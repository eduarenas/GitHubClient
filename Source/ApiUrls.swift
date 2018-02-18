//
//  ApiUrls.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

enum ApiUrl {
  private static let baseUrl = "https://api.github.com/"

  // Authorizations
  case authorizations

  // Issues
  case currentUserAssignedIssues
  case currentUserOwnedAndMemberReposIssues
  case currentUserOrganizationIssues(org: String)
  case repositoryIssue(owner: String, repo: String, number: Int)
  case repositoryIssues(owner: String, repo: String)

  // Repositories
  case currentUserRepositories
  case userRepositories(username: String)
  case organizationRepositories(organization: String)
  case repositories
  case repository(owner: String, repo: String)

  // Repository Collaborators
  case repositoryCollaborators(owner: String, repo: String)
  case repositoryCollaborator(owner: String, repo: String, username: String)

  // Users
  case currentUser
  case user(username: String)
  case users
  
  var fullPath: String {
    switch self {
    case .authorizations: return ApiUrl.fullPath(from: ["authorizations"])
    case .currentUserAssignedIssues: return ApiUrl.fullPath(from: ["issues"])
    case .currentUserOwnedAndMemberReposIssues: return ApiUrl.fullPath(from: ["user", "issues"])
    case .currentUserOrganizationIssues(let org): return ApiUrl.fullPath(from: ["orgs", org, "issues"])
    case .repositoryIssue(let owner, let repo, let number): return ApiUrl.fullPath(from: ["repos", owner, repo, "issues", number])
    case .repositoryIssues(let owner, let repo): return ApiUrl.fullPath(from: ["repos", owner, repo, "issues"])
    case .currentUserRepositories: return ApiUrl.fullPath(from: ["user", "repos"])
    case .userRepositories(let username): return ApiUrl.fullPath(from: ["users", username, "repos"])
    case .organizationRepositories(let organization): return ApiUrl.fullPath(from: ["orgs", organization, "repos"])
    case .repositories: return ApiUrl.fullPath(from: ["repositories"])
    case .repository(let owner, let repo): return ApiUrl.fullPath(from: ["repos", owner, repo])
    case .repositoryCollaborators(let owner, let repo): return ApiUrl.fullPath(from: ["repos", owner, repo, "collaborators"])
    case .repositoryCollaborator(let owner, let repo, let username): return ApiUrl.fullPath(from: ["repos", owner, repo, "collaborators", username])
    case .currentUser: return ApiUrl.fullPath(from: ["user"])
    case .user(let username): return ApiUrl.fullPath(from: ["users", username])
    case .users: return ApiUrl.fullPath(from: ["users"])
    }
  }

  static func fullPath(from components: [CustomStringConvertible]) -> String {
    let endpointPath = components.map({ $0.description }).joined(separator: "/")
    return baseUrl.appending(endpointPath)
  }
}
