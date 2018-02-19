//
//  PaginatedApiClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/19/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

import RxSwift

final class PaginatedApiClient<T> {

  private let firstPageUrl: String
  private let queryDict: [String: CustomStringConvertible]
  private let limit: Int
  private let httpService = HTTPService()
  private let headers: [String: CustomStringConvertible]
  private let decoder: JSONDecoder

  init(apiUrl: ApiUrl, parameters: [ApiParameter?], limit: Int, headers: [String: CustomStringConvertible], decoder: JSONDecoder) {
    self.firstPageUrl = apiUrl.fullPath
    self.limit = limit
    self.headers = headers
    self.decoder = decoder

    var unwrappedParameters = parameters.flatMap({ $0 })
    let perPage = min(limit, 100)
    unwrappedParameters.append(CustomApiParameter(name: "per_page", value: perPage))
    self.queryDict = CustomApiParameter.queryDict(forParameters: unwrappedParameters)
  }

  func performRequest() -> Observable<[T]> {
    return loadPage(url: firstPageUrl, queryDict: queryDict)
  }

  private func loadPage(url: String, queryDict: [String: CustomStringConvertible]?, results: [T] = []) -> Observable<[T]> {
    return httpService.get(url: url, query: queryDict, headers: headers)
      .concatMap({ [decoder, limit, loadPage] (response) -> Observable<[T]> in
        let pageResults = try decoder.decode([T].self, from: response.0)
        let newResults = results + pageResults

        let nextUrl: String?
        if let linkString = response.1.allHeaderFields["Link"] as? String {
          nextUrl = PageLinkParser.parse(linkString: linkString).next
        } else {
          nextUrl = nil
        }

        if newResults.count >= limit || nextUrl == nil {
          return Observable.just(Array(newResults.prefix(limit)))
        } else {
          return loadPage(nextUrl!, nil, newResults)
        }
      })
  }
}
