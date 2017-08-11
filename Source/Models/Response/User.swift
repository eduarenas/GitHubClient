//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

public struct User: Decodable {

  let login: String
  let id: Int
  let avatarURL: String?
  let url: String?
  let htmlURL: String?
  let type: UserType
  let siteAdmin: Bool?
  let name: String?
  let company: String?
  let blog: String?
  let location: String?
  let email: String?
  let hireable: Bool?
  let bio: String?
  let publicRepos: Int?
  let publicGists: Int?
  let followers: Int?
  let following: Int?
  let createdAt: Date?
  let updatedAt: Date?
  let totalPrivateRepos: Int?
  let ownedPrivateRepos: Int?
  let privateGists: Int?
  let diskUsage: Int?
  let collaborators: Int?
  // TODO: let plan: Plan?

}

extension User {
  enum CodingKeys: String, CodingKey {
    case login
    case id
    case avatarURL = "avatar_url"
    case url
    case htmlURL = "html_url"
    case type
    case siteAdmin = "site_admin"
    case name
    case company
    case blog
    case location
    case email
    case hireable
    case bio
    case publicRepos = "public_repos"
    case publicGists = "public_gists"
    case followers
    case following
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case totalPrivateRepos = "total_private_repos"
    case ownedPrivateRepos = "owned_private_repos"
    case privateGists = "private_gists"
    case diskUsage = "disk_usage"
    case collaborators
  }
}
