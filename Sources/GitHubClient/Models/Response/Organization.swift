//
//  Organization.swift
//  GitHubClient
//
//  Created by Eduardo Arenas on 4/23/18.
//

import Foundation

public struct Organization: Decodable {
  public let id: Int
  public let login: String
  public let url: String
  public let reposUrl: String
  public let eventsUrl: String
  public let hooksUrl: String
  public let issuesUrl: String
  public let membersUrl: String
  public let publicMembersUrl: String
  public let avatarUrl: String
  public let description: String?
  public let name: String?
  public let company: String?
  public let blog: String?
  public let location: String?
  public let email: String?
  public let hasOrganizationProjects: Bool?
  public let hasRepositoryProjects: Bool?
  public let publicRepos: Int?
  public let publicGists: Int?
  public let followers: Int?
  public let following: Int?
  public let htmlUrl: String?
  public let createdAt: Date?
  public let updatedAt: Date?
  public let type: String? // TODO: strong type
  public let totalPrivateRepos: Int?
  public let ownedPrivateRepos: Int?
  public let privateGists: Int?
  public let diskUsage: Int?
  public let collaborators: Int?
  public let billingEmail: String?
  public let plan: Plan?
  public let defaultRepositoryPermission: String? // TODO: strong type
  public let membersCanCreateRepositories: Bool?
  public let twoFactorRequirementEnabled: Bool?
}

extension Organization {
  enum CodingKeys: String, CodingKey {
    case id
    case login
    case url
    case reposUrl = "repos_url"
    case eventsUrl = "events_url"
    case hooksUrl = "hooks_url"
    case issuesUrl = "issues_url"
    case membersUrl = "members_url"
    case publicMembersUrl = "public_members_url"
    case avatarUrl = "avatar_url"
    case description
    case name
    case company
    case blog
    case location
    case email
    case hasOrganizationProjects = "has_organization_projects"
    case hasRepositoryProjects = "has_repository_projects"
    case publicRepos = "public_repos"
    case publicGists = "public_gists"
    case followers
    case following
    case htmlUrl = "html_url"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case type
    case totalPrivateRepos = "total_private_repos"
    case ownedPrivateRepos = "owned_private_repos"
    case privateGists = "private_gists"
    case diskUsage = "disk_usage"
    case collaborators
    case billingEmail = "billing_email"
    case plan
    case defaultRepositoryPermission = "default_repository_permission"
    case membersCanCreateRepositories = "members_can_create_repositories"
    case twoFactorRequirementEnabled = "two_factor_requirement_enabled"
  }
}
