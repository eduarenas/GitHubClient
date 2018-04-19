//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation
import RxSwift

public class ApiClient {
  
  let encoder = JSONEncoder()
  let decoder = JSONDecoder()
  
  private let httpService = HTTPService()
  private let headers: [String: CustomStringConvertible]
  
  public init(authentication: Authentication = .anonymous) {
    var clientHeaders = ["Accept": "application/vnd.github.v3+json"]
    clientHeaders["Authorization"] = authentication.authorizationHeader
    headers = clientHeaders
    encoder.dateEncodingStrategy = .iso8601
    decoder.dateDecodingStrategy = .iso8601
  }
  
  func getObject<T: Decodable>(apiUrl: ApiUrl, parameters: ApiParameter?...) -> Observable<T> {
    return get(apiUrl: apiUrl, parameters: parameters)
      .map { return try self.decoder.decode(T.self, from: $0.0) }
  }
  
  func getBoolean(apiUrl: ApiUrl, parameters: ApiParameter?...) -> Observable<Bool> {
    return get(apiUrl: apiUrl, parameters: parameters)
      .map { _ in true }
  }
  
  func getObjects<T: Decodable>(apiUrl: ApiUrl, limit: Int?, parameters: ApiParameter?...) -> Observable<[T]> {
    var unwrappedParameters = parameters.flatMap({ $0 })
    unwrappedParameters.append(CustomApiParameter(name: "per_page", value: limit ?? 100))
    let queryDict = CustomApiParameter.queryDict(forParameters: unwrappedParameters)
    
    return getPaginated(url: apiUrl.fullPath, queryDict: queryDict)
      .flatMap({ (firstPageResult: PageResult<T>) -> Observable<[T]> in
        return self.fetchUntilLimit(currentPageResult: firstPageResult, limit: limit, accumulatedResults: [])
      })
  }
  
  func getPaginatedObjects<T: Decodable>(apiUrl: ApiUrl,
                                         parameters: ApiParameter?...) -> Observable<PageResult<T>> {
    let unwrappedParameters = parameters.flatMap({ $0 })
    let queryDict = CustomApiParameter.queryDict(forParameters: unwrappedParameters)
    return getPaginated(url: apiUrl.fullPath,
                        queryDict: queryDict)
  }
  
  func post<N: Encodable, R: Decodable>(apiUrl: ApiUrl, object: N) -> Observable<R> {
    return Observable.just(object)
      .map { try self.encoder.encode($0) }
      .flatMap { self.httpService.post(url: apiUrl.fullPath, data: $0, headers: self.headers) }
      .map { return try self.decoder.decode(R.self, from: $0.0) }
  }
  
  func post<R: Decodable>(apiUrl: ApiUrl) -> Observable<R> {
    return self.httpService.post(url: apiUrl.fullPath, headers: self.headers)
      .map { return try self.decoder.decode(R.self, from: $0.0) }
  }
  
  func patch<U: Encodable, R: Decodable>(apiUrl: ApiUrl, object: U) -> Observable<R> {
    return Observable.just(object)
      .map { try self.encoder.encode($0) }
      .flatMap { self.httpService.patch(url: apiUrl.fullPath, data: $0, headers: self.headers) }
      .map { return try self.decoder.decode(R.self, from: $0.0) }
  }
  
  func put<P: Encodable>(apiUrl: ApiUrl, parameters: P? = nil) -> Completable {
    return Observable.just(parameters)
      .map { try $0.flatMap({ try self.encoder.encode($0) }) }
      .flatMap { self.httpService.put(url: apiUrl.fullPath, data: $0, headers: self.headers) }
      .asCompletable()
  }
  
  func put<P: Encodable, R: Decodable>(apiUrl: ApiUrl, object: P? = nil) -> Observable<R> {
    return Observable.just(object)
      .map { try self.encoder.encode($0) }
      .flatMap { self.httpService.put(url: apiUrl.fullPath, data: $0, headers: self.headers) }
      .map { return try self.decoder.decode(R.self, from: $0.0) }
  }
  
  func delete(apiUrl: ApiUrl) -> Completable {
    return httpService.delete(url: apiUrl.fullPath, headers: headers)
      .asCompletable()
  }
  
  private func get(apiUrl: ApiUrl, parameters: [ApiParameter?]) -> Observable<(Data, HTTPURLResponse)> {
    let unwrappedParameters = parameters.flatMap({ $0 })
    let queryDict = CustomApiParameter.queryDict(forParameters: unwrappedParameters)
    return httpService.get(url: apiUrl.fullPath, query: queryDict, headers: headers)
  }
  
  private func getPaginated<T: Decodable>(url: String,
                                          queryDict: [String: CustomStringConvertible]?) -> Observable<PageResult<T>> {
    return httpService.get(url: url, query: queryDict, headers: headers)
      .map({ (response) -> PageResult<T> in
        let pageItems = try self.decoder.decode([T].self, from: response.0)
        
        let linkString = response.1.allHeaderFields["Link"] as? String
        let nextUrl = linkString.flatMap { PageLinkParser.parse(linkString: $0).next }
        
        return PageResult(items: pageItems,
                          nextPage: nextUrl.map({ self.getPaginated(url: $0, queryDict: nil) }))
      })
  }
  
  private func fetchUntilLimit<T>(currentPageResult: PageResult<T>,
                                  limit: Int?,
                                  accumulatedResults: [T]) -> Observable<[T]> {
    
    let results = accumulatedResults + currentPageResult.items
    
    let reachedLimit = limit.map { $0 >= results.count } ?? false
    
    if let nextPage = currentPageResult.nextPage, !reachedLimit {
      return nextPage.flatMap({ (nextPageResult) -> Observable<[T]> in
        return self.fetchUntilLimit(currentPageResult: nextPageResult, limit: limit, accumulatedResults: results)
      })
    } else {
      let truncatedResults = limit.map { Array(results.prefix($0)) } ?? results
      return Observable.just(truncatedResults)
    }
  }
}
