//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

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
}
