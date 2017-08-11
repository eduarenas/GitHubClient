//
//  Repository.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

public struct Repository: Decodable {
  public let allowMergeCommit: Bool?
  public let allowRebaseMerge: Bool?
  public let allowSquashMerge: Bool?
  public let cloneUrl: String?
  public let createdAt: Date?
  public let defaultBranch: String?
  public let description: String?
  public let forksCount: Int?
  public let fullName: String
  public let hasDownloads: Bool?
  public let hasIssues: Bool?
  public let hasPages: Bool?
  public let hasWiki: Bool?
  public let htmlUrl: String
  public let homepage: String?
  public let id: Int
  public let isFork: Bool
  public let isPrivate: Bool
  public let language: String?
  public let mirrorUrl: String?
  public let name: String
  public let openIssuesCount: Int?
  public let owner: User
  // public let parent: Repository?
  // public let permissions: RepositoryPermissions
  public let pushedAt: Date?
  // public let source: Repository?
  public let size: Int?
  public let sshUrl: String?
  public let stargazersCount: Int?
  public let subscribersCount: Int?
  public let svnUrl: String?
  public let updatedAt: Date?
  public let url: String
}

extension Repository {
  enum CodingKeys: String, CodingKey {
    case allowMergeCommit = "allow_merge_commit"
    case allowRebaseMerge = "allow_rebase_merge"
    case allowSquashMerge = "allow_squash_merge"
    case cloneUrl = "clone_url"
    case createdAt = "created_at"
    case defaultBranch = "default_branch"
    case description
    case forksCount = "forks_count"
    case fullName = "full_name"
    case hasDownloads = "has_downloads"
    case hasIssues = "has_issues"
    case hasPages = "has_pages"
    case hasWiki = "has_wiki"
    case htmlUrl = "html_url"
    case homepage
    case id
    case isFork = "fork"
    case isPrivate = "private"
    case language
    case mirrorUrl = "mirror_url"
    case name
    case openIssuesCount = "open_issues_count"
    case owner
    case pushedAt = "pushed_at"
    case size
    case sshUrl = "ssh_url"
    case stargazersCount = "stargazers_count"
    case subscribersCount = "subscribers_count"
    case svnUrl = "svn_url"
    case updatedAt = "updated_at"
    case url
  }
}
