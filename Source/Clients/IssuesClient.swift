//
//  IssuesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/13/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

public final class IssuesClient: ApiClient {

  func listAllAssignedToCurrentUser() -> Observable<[Issue]> {
    return getObject(apiUrl: .currentUserAssignedIssues)
  }

  func listAllForOwnedAndMemberRepos() -> Observable<[Issue]> {
    return getObject(apiUrl: .currentUserOwnedAndMemberReposIssues)
  }

  func listAllForOrganization(org: String) -> Observable<[Issue]> {
    return getObject(apiUrl: .currentUserOrganizationIssues(org: org))
  }

  func get(owner: String, repo: String, number: Int) -> Observable<Issue> {
    return getObject(apiUrl: .repositoryIssue(owner: owner, repo: repo, number: number))
  }
}
