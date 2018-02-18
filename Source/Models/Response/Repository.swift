//
//  Repository.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

public struct Repository: Decodable {
  public let id: Int
  public let owner: User
  public let name: String
  public let fullName: String
  public let description: String?
  public let isPrivate: Bool
  public let isFork: Bool
  public let url: String
  public let htmlUrl: String
  public let cloneUrl: String?
  public let mirrorUrl: String?
  public let sshUrl: String?
  public let svnUrl: String?
  public let homepage: String?
  public let language: String?
  public let forksCount: Int?
  public let stargazersCount: Int?
  public let size: Int?
  public let defaultBranch: String?
  public let openIssuesCount: Int?
  public let hasDownloads: Bool?
  public let hasIssues: Bool?
  public let hasPages: Bool?
  public let hasWiki: Bool?
  public let pushedAt: Date?
  public let createdAt: Date?
  public let updatedAt: Date?
  // public let permissions: RepositoryPermissions
  public let allowMergeCommit: Bool?
  public let allowRebaseMerge: Bool?
  public let allowSquashMerge: Bool?
  public let subscribersCount: Int?

}

extension Repository {
  enum CodingKeys: String, CodingKey {
    case id
    case owner
    case name
    case fullName = "full_name"
    case description
    case isPrivate = "private"
    case isFork = "fork"
    case url
    case htmlUrl = "html_url"
    case cloneUrl = "clone_url"
    case mirrorUrl = "mirror_url"
    case sshUrl = "ssh_url"
    case svnUrl = "svn_url"
    case homepage
    case language
    case forksCount = "forks_count"
    case stargazersCount = "stargazers_count"
    case size
    case defaultBranch = "default_branch"
    case openIssuesCount = "open_issues_count"
    case hasDownloads = "has_downloads"
    case hasIssues = "has_issues"
    case hasPages = "has_pages"
    case hasWiki = "has_wiki"
    case pushedAt = "pushed_at"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case allowMergeCommit = "allow_merge_commit"
    case allowRebaseMerge = "allow_rebase_merge"
    case allowSquashMerge = "allow_squash_merge"
    case subscribersCount = "subscribers_count"
  }
}
