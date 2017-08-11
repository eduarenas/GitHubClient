//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

public struct User: Decodable {

  public let login: String
  public let id: Int
  public let avatarURL: String?
  public let url: String?
  public let htmlURL: String?
  public let type: UserType
  public let siteAdmin: Bool?
  public let name: String?
  public let company: String?
  public let blog: String?
  public let location: String?
  public let email: String?
  public let hireable: Bool?
  public let bio: String?
  public let publicRepos: Int?
  public let publicGists: Int?
  public let followers: Int?
  public let following: Int?
  public let createdAt: Date?
  public let updatedAt: Date?
  public let totalPrivateRepos: Int?
  public let ownedPrivateRepos: Int?
  public let privateGists: Int?
  public let diskUsage: Int?
  public let collaborators: Int?
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
