//
//  OrganizationUpdate.swift
//  GitHubClient
//
//  Created by Eduardo Arenas on 4/23/18.
//

import Foundation

public struct OrganizationUpdate: Encodable {

  public let billingEmail: String?
  public let company: String?
  public let email: String?
  public let location: String?
  public let name: String?
  public let description: String?
  public let hasOrganizationProjects: Bool?
  public let hasRepositoryProjects: Bool?
  public let defaultRepositoryPermissions: String? // TODO: strong type
  public let membersCanCreateRepositories: Bool?

  public init(billingEmail: String? = nil,
              company: String? = nil,
              email: String? = nil,
              location: String? = nil,
              name: String? = nil,
              description: String? = nil,
              hasOrganizationProjects: Bool? = nil,
              hasRepositoryProjects: Bool? = nil,
              defaultRepositoryPermissions: String? = nil,
              membersCanCreateRepositories: Bool? = nil) {
    self.billingEmail = billingEmail
    self.company = company
    self.email = email
    self.location = location
    self.name = name
    self.description = description
    self.hasOrganizationProjects = hasOrganizationProjects
    self.hasRepositoryProjects = hasRepositoryProjects
    self.defaultRepositoryPermissions = defaultRepositoryPermissions
    self.membersCanCreateRepositories = membersCanCreateRepositories
  }
}

extension OrganizationUpdate {
  enum CodingKeys: String, CodingKey {
    case billingEmail = "billing_email"
    case company
    case email
    case location
    case name
    case description
    case hasOrganizationProjects = "has_organization_projects"
    case hasRepositoryProjects = "has_repository_projects"
    case defaultRepositoryPermissions = "default_repository_permissions"
    case membersCanCreateRepositories = "members_can_create_repositories"
  }
}
