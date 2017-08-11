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

  let decoder = JSONDecoder()

  private let httpService = HTTPService()
  private let headers: [String: CustomStringConvertible]

  public init(authorizationToken: String) {
    headers = ["Authorization": authorizationToken,
               "Accept": "application/vnd.github.v3+json"]
    decoder.dateDecodingStrategy = .iso8601
  }

  func get<T: Decodable>(apiUrl: ApiUrl, parameters: [ApiParameter?]? = nil) -> Observable<T> {
    let queryDict = parameters.flatMap { CustomApiParameter.queryDict(forParameters: $0) }
    return httpService.get(url: apiUrl.fullPath, query: queryDict, headers: headers)
      .map { return try self.decoder.decode(T.self, from: $0.0) }
  }
}
