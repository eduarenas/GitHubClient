//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

public struct User: Codable {
  
  let avatarURL: String?
  let bio: String?
  let blog: String?
  let collaborators: Int?
  let company: String?
  let createdAt: Date?
  let diskUsage: Int?
  let email: String?
  let followers: Int?
  let following: Int?
  let hireable: Bool?
  let htmlURL: String?
  let id: Int
  let location: String?
  let login: String
  let name: String?
  let type: UserType
  let ownedPrivateRepos: Int?
  // TODO: let plan: Plan?
  let privateGists: Int?
  let publicGists: Int?
  let publicRepos: Int?
  let siteAdmin: Bool?
  let totalPrivateRepos: Int?
  let updatedAt: Date?
  let url: String?
}

extension User {
  enum CodingKeys: String, CodingKey {
    case avatarURL = "avatar_url"
    case bio
    case blog
    case collaborators
    case company
    case createdAt = "created_at"
    case diskUsage = "disk_usage"
    case email
    case followers
    case following
    case hireable
    case htmlURL = "html_url"
    case id
    case location
    case login
    case name
    case type
    case ownedPrivateRepos = "owned_private_repos"
    // TODO: let plan: Plan?
    case privateGists = "private_gists"
    case publicGists = "public_gists"
    case publicRepos = "public_repos"
    case siteAdmin = "site_admin"
    case totalPrivateRepos = "total_private_repos"
    case updatedAt = "updated_at"
    case url
  }
}
