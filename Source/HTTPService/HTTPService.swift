//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

enum HTTPServiceError: Error {
  case invalidURL(url: String)
  case invalidResponse
}

enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
  case patch = "PATCH"
  case put = "PUT"
  case delete = "DELETE"
}

class HTTPService {

  typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

  func get(url: String, query: [String: CustomStringConvertible]? = nil, headers: [String: CustomStringConvertible]? = nil, completion: @escaping CompletionHandler) {
    let builder = requestBuilder(url: url, method: .get, query: query, headers: headers)
    performRequest(builder, completion: completion)
  }

  func post(url: String, query: [String: CustomStringConvertible]? = nil, data: Data? = nil, headers: [String: CustomStringConvertible]? = nil, completion: @escaping CompletionHandler) {
    let builder = requestBuilder(url: url, method: .post, query: query, data: data, headers: headers)
    performRequest(builder, completion: completion)
  }

  func patch(url: String, query: [String: CustomStringConvertible]? = nil, data: Data? = nil, headers: [String: CustomStringConvertible]? = nil, completion: @escaping CompletionHandler) {
    let builder = requestBuilder(url: url, method: .patch, query: query, data: data, headers: headers)
    performRequest(builder, completion: completion)
  }

  func put(url: String, query: [String: CustomStringConvertible]? = nil, data: Data? = nil, headers: [String: CustomStringConvertible]? = nil, completion: @escaping CompletionHandler) {
    let builder = requestBuilder(url: url, method: .put, query: query, data: data, headers: headers)
    performRequest(builder, completion: completion)
  }

  func delete(url: String, query: [String: CustomStringConvertible]? = nil, headers: [String: CustomStringConvertible]? = nil, completion: @escaping CompletionHandler) {
    let builder = requestBuilder(url: url, method: .delete, query: query, headers: headers)
    performRequest(builder, completion: completion)
  }

  private func performRequest(_ requestBuilder: () throws -> URLRequest, completion: @escaping CompletionHandler) {
    do {
      let request = try requestBuilder()
      URLSession.shared.dataTask(with: request, completionHandler: completion).resume()
    } catch let error {
      completion(nil, nil, error)
    }
  }

  private func requestBuilder(url: String, method: HTTPMethod, query: [String: CustomStringConvertible]? = nil, data: Data? = nil, headers: [String: CustomStringConvertible]?) -> () throws -> URLRequest {

    let requestBuilder: () throws -> URLRequest = {
      let finalUrl = try self.buildURL(urlString: url, query: query)
      var request = URLRequest(url: finalUrl)
      request.httpMethod = method.rawValue
      headers?.forEach { request.setValue($0.value.description, forHTTPHeaderField: $0.key)  }
      request.httpBody = data
      return request
    }
    return requestBuilder
  }

  private func buildURL(urlString: String, query: [String: CustomStringConvertible]?) throws -> URL {
    guard let url = URL(string: urlString) else { throw HTTPServiceError.invalidURL(url: urlString) }
    guard let query = query else { return url }

    var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
    var queryItems = [URLQueryItem]()
    query.forEach { queryItems.append(URLQueryItem(name: $0.key, value: $0.value.description)) }
    urlComponents?.queryItems = queryItems
    return urlComponents?.url ?? url
  }
}
