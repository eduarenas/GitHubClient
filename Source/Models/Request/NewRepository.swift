//
//  NewRepository.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/11/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

public struct NewRepository: Encodable {

  public let name: String
  public let description: String?
  public let homepage: String?
  public let isPrivate: Bool?
  public let hasIssues: Bool?
  public let hasProjects: Bool?
  public let hasWiki: Bool?
  public let teamId: Int?
  public let autoInit: Bool?
  public let gitignoreTemplate: String?
  public let licenseTemplate: String?
  public let allowSquashMerge: Bool?
  public let allowMergeCommit: Bool?
  public let allowRebaseMerge: Bool?
}

extension NewRepository {

  enum CodingKeys: String, CodingKey {
    case name
    case description
    case homepage
    case isPrivate = "private"
    case hasIssues = "has_issues"
    case hasProjects = "has_projects"
    case hasWiki = "has_wiki"
    case teamId = "team_id"
    case autoInit = "auto_init"
    case gitignoreTemplate = "gitignore_template"
    case licenseTemplate = "license_template"
    case allowSquashMerge = "allow_squash_merge"
    case allowMergeCommit = "allow_merge_commit"
    case allowRebaseMerge = "allow_rebase_merge"
  }
}
