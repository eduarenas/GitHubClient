//
//  ApiUrls.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

enum ApiUrl {
  private static let baseURL = "https://api.github.com/"

  case user(String)
  case users
  
  var fullPath: String {
    switch self {
    case .user(let username): return ApiUrl.fullPath(from: ["users", username])
    case .users: return ApiUrl.fullPath(from: ["users"])
    }
  }

  static func fullPath(from components: [CustomStringConvertible]) -> String {
    let endpointPath = components.map({ $0.description }).joined(separator: "/")
    return baseURL.appending(endpointPath)
  }
}
