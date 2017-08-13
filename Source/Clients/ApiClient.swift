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

  public init(authorizationToken: String) {
    headers = ["Authorization": authorizationToken,
               "Accept": "application/vnd.github.v3+json"]
    encoder.dateEncodingStrategy = .iso8601
    decoder.dateDecodingStrategy = .iso8601
  }

  func getObject<T: Decodable>(apiUrl: ApiUrl, parameters: [ApiParameter?]? = nil) -> Observable<T> {
    return get(apiUrl: apiUrl, parameters: parameters)
      .map { return try self.decoder.decode(T.self, from: $0.0) }
  }

  func getBoolean(apiUrl: ApiUrl, parameters: [ApiParameter?]? = nil) -> Observable<Bool> {
    return get(apiUrl: apiUrl, parameters: parameters)
      .map { _ in true }
  }

  private func get(apiUrl: ApiUrl, parameters: [ApiParameter?]? = nil) -> Observable<(Data, URLResponse)> {
    let queryDict = parameters.flatMap { CustomApiParameter.queryDict(forParameters: $0) }
    return httpService.get(url: apiUrl.fullPath, query: queryDict, headers: headers)
  }

  func post<N: Encodable, R: Decodable>(apiUrl: ApiUrl, object: N) -> Observable<R> {
    return httpService.post(url: apiUrl.fullPath, data: try! encoder.encode(object), headers: headers)
      .map { return try self.decoder.decode(R.self, from: $0.0) }
  }

  func patch<U: Encodable, R: Decodable>(apiUrl: ApiUrl, object: U) -> Observable<R> {
    return httpService.patch(url: apiUrl.fullPath, data: try! encoder.encode(object), headers: headers)
      .map { return try self.decoder.decode(R.self, from: $0.0) }
  }

  func delete(apiUrl: ApiUrl) -> Completable {
    return httpService.delete(url: apiUrl.fullPath, headers: headers)
      .flatMap { _ in Observable<Never>.empty() }
      .asCompletable()
  }
}
