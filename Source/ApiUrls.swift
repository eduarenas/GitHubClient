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

  // Repositories
  case currentUserRepositories
  case userRepositories(username: String)
  case organizationRepositories(organization: String)

  // Users
  case currentUser
  case user(username: String)
  case users
  
  var fullPath: String {
    switch self {
    case .currentUserRepositories: return ApiUrl.fullPath(from: ["user", "repos"])
    case .userRepositories(let username): return ApiUrl.fullPath(from: ["users", username, "repos"])
    case .organizationRepositories(let organization): return ApiUrl.fullPath(from: ["orgs", organization, "repos"])
    case .currentUser: return ApiUrl.fullPath(from: ["user"])
    case .user(let username): return ApiUrl.fullPath(from: ["users", username])
    case .users: return ApiUrl.fullPath(from: ["users"])
    }
  }

  static func fullPath(from components: [CustomStringConvertible]) -> String {
    let endpointPath = components.map({ $0.description }).joined(separator: "/")
    return baseURL.appending(endpointPath)
  }
}
