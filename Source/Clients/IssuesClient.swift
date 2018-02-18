//
//  IssuesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/13/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

public final class IssuesClient: ApiClient {

  func listAllAssignedToCurrentUser(filter: Filter? = nil,
                                    state: State? = nil,
                                    labels: [String]? = nil,
                                    sort: Sort? = nil,
                                    direction: Direction? = nil,
                                    since: String? = nil) -> Observable<[Issue]> {
    return getObject(apiUrl: .currentUserAssignedIssues,
                     parameters: filter, state, labelsParameter(labels), sort, direction, sinceParameter(since))
  }

  func listAllForOwnedAndMemberRepos(filter: Filter? = nil,
                                     state: State? = nil,
                                     labels: [String]? = nil,
                                     sort: Sort? = nil,
                                     direction: Direction? = nil,
                                     since: String? = nil) -> Observable<[Issue]> {
    return getObject(apiUrl: .currentUserOwnedAndMemberReposIssues,
                     parameters: filter, state, labelsParameter(labels), sort, direction, sinceParameter(since))
  }

  func listAllForOrganization(org: String,
                              filter: Filter? = nil,
                              state: State? = nil,
                              labels: [String]? = nil,
                              sort: Sort? = nil,
                              direction: Direction? = nil,
                              since: String? = nil) -> Observable<[Issue]> {
    return getObject(apiUrl: .currentUserOrganizationIssues(org: org),
                     parameters: filter, state, labelsParameter(labels), sort, direction, sinceParameter(since))
  }

  func get(owner: String, repo: String, number: Int) -> Observable<Issue> {
    return getObject(apiUrl: .repositoryIssue(owner: owner, repo: repo, number: number))
  }
}

public extension IssuesClient {

  public enum Filter: String, ApiParameter {
    public var name: String { return "filter" }

    case assigned
    case created
    case mentioned
    case subscribed
    case all
  }

  public enum State: String, ApiParameter {
    public var name: String { return "state" }

    case open
    case closed
    case all
  }

  public enum Sort: String, ApiParameter {
    public var name: String { return "sort" }

    case created
    case updated
    case comments
  }

  private func labelsParameter(_ labels: [String]?) -> ApiParameter? {
    return labels.map { CustomApiParameter(name: "labels", value: $0.joined(separator: ",")) }
  }

  private func sinceParameter(_ since: String?) -> ApiParameter? {
    return since.map { CustomApiParameter(name: "since", value: $0) }
  }
}
