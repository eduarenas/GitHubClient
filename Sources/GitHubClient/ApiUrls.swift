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
  case authorization(id: Int)
  case clientAuthorization(clientId: String)
  case clientAndFingerprintAuthorization(clientId: String, fingerprint: String)
  case clientAuthorizationToken(clientId: String, token: String)
  
  // Invitations
  case invitations(owner: String, repo: String)
  case invitation(owner: String, repo: String, id: Int)
  
  // Issues
  case currentUserAssignedIssues
  case currentUserOwnedAndMemberReposIssues
  case currentUserOrganizationIssues(org: String)
  case repositoryIssue(owner: String, repo: String, number: Int)
  case repositoryIssues(owner: String, repo: String)

  // Organizations
  case currentUserOrganizations
  case userOrganizations(username: String)
  case organizations
  case organization(org: String)
  
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
    case .authorizations: return ApiUrl.fullPath(from: "authorizations")
    case .authorization(let id): return ApiUrl.fullPath(from: "authorization", id)
    case .clientAuthorization(let clientId): return ApiUrl.fullPath(from: "authorizations", "clients", clientId)
    case .clientAndFingerprintAuthorization(let clientId, let fingerprint): return ApiUrl.fullPath(from: "authorizations", "clients", clientId, fingerprint)
    case .clientAuthorizationToken(let clientId, let token): return ApiUrl.fullPath(from: "applications", clientId, "tokens", token)
    case .invitations(let owner, let repo): return ApiUrl.fullPath(from: "repos", owner, repo, "invitations")
    case .invitation(let owner, let repo, let id): return ApiUrl.fullPath(from: "repos", owner, repo, "invitations", id)
    case .currentUserAssignedIssues: return ApiUrl.fullPath(from: "issues")
    case .currentUserOwnedAndMemberReposIssues: return ApiUrl.fullPath(from: "user", "issues")
    case .currentUserOrganizationIssues(let org): return ApiUrl.fullPath(from: "orgs", org, "issues")
    case .repositoryIssue(let owner, let repo, let number): return ApiUrl.fullPath(from: "repos", owner, repo, "issues", number)
    case .repositoryIssues(let owner, let repo): return ApiUrl.fullPath(from: "repos", owner, repo, "issues")
    case .currentUserOrganizations: return ApiUrl.fullPath(from: "user", "orgs")
    case .userOrganizations(let username): return ApiUrl.fullPath(from: "users", username, "orgs")
    case .organizations: return ApiUrl.fullPath(from: "organizations")
    case .organization(let org): return ApiUrl.fullPath(from: "orgs", org)
    case .currentUserRepositories: return ApiUrl.fullPath(from: "user", "repos")
    case .userRepositories(let username): return ApiUrl.fullPath(from: "users", username, "repos")
    case .organizationRepositories(let organization): return ApiUrl.fullPath(from: "orgs", organization, "repos")
    case .repositories: return ApiUrl.fullPath(from: "repositories")
    case .repository(let owner, let repo): return ApiUrl.fullPath(from: "repos", owner, repo)
    case .repositoryCollaborators(let owner, let repo): return ApiUrl.fullPath(from: "repos", owner, repo, "collaborators")
    case .repositoryCollaborator(let owner, let repo, let username): return ApiUrl.fullPath(from: "repos", owner, repo, "collaborators", username)
    case .currentUser: return ApiUrl.fullPath(from: "user")
    case .user(let username): return ApiUrl.fullPath(from: "users", username)
    case .users: return ApiUrl.fullPath(from: "users")
    }
  }
  
  static func fullPath(from components: CustomStringConvertible...) -> String {
    let endpointPath = components.map({ $0.description }).joined(separator: "/")
    return baseUrl.appending(endpointPath)
  }
}
