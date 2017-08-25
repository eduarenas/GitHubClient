//
//  Credentials.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/25/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

public enum Authentication {
  case anonymous
  case oauth(token: String)
  case basic(username: String, password: String)

  var authorizationHeader: String? {
    switch self {
    case .anonymous: return nil
    case .oauth(let token): return "Token \(token)"
    case .basic(let username, let password): return basicAuthenticationHeader(username: username, password: password)
    }
  }

  private func basicAuthenticationHeader(username: String, password: String) -> String? {
    guard let authorizationField = "\(username):\(password)".data(using: .utf8)?.base64EncodedString() else { return nil }
    return "Basic \(authorizationField)"
  }
}
