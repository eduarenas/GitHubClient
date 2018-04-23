//
//  IssuesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/13/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

@available(OSX 10.12, *)
public final class IssuesClient: ApiClient {
  
  public func listAllAssignedToCurrentUser(filter: Filter? = nil,
                                           state: State? = nil,
                                           labels: [String]? = nil,
                                           sort: Sort? = nil,
                                           direction: Direction? = nil,
                                           since: String? = nil,
                                           limit: Int? = nil) -> Observable<[Issue]> {
    return getObjects(apiUrl: .currentUserAssignedIssues,
                      limit: limit,
                      parameters: filter, state, labelsParameter(labels), sort, direction, sinceParameter(since))
  }
  
  public func listAllAssignedToCurrentUserPaginated(filter: Filter? = nil,
                                                    state: State? = nil,
                                                    labels: [String]? = nil,
                                                    sort: Sort? = nil,
                                                    direction: Direction? = nil,
                                                    since: String? = nil) -> Observable<PageResult<Issue>> {
    return getPaginatedObjects(apiUrl: .currentUserAssignedIssues,
                               parameters: filter, state, labelsParameter(labels), sort, direction, sinceParameter(since))
  }
  
  public func listAllForOwnedAndMemberRepos(filter: Filter? = nil,
                                            state: State? = nil,
                                            labels: [String]? = nil,
                                            sort: Sort? = nil,
                                            direction: Direction? = nil,
                                            since: String? = nil,
                                            limit: Int? = nil) -> Observable<[Issue]> {
    return getObjects(apiUrl: .currentUserOwnedAndMemberReposIssues,
                      limit: limit,
                      parameters: filter, state, labelsParameter(labels), sort, direction, sinceParameter(since))
  }
  
  public func listAllForOwnedAndMemberReposPaginated(filter: Filter? = nil,
                                                     state: State? = nil,
                                                     labels: [String]? = nil,
                                                     sort: Sort? = nil,
                                                     direction: Direction? = nil,
                                                     since: String? = nil) -> Observable<PageResult<Issue>> {
    return getPaginatedObjects(apiUrl: .currentUserOwnedAndMemberReposIssues,
                               parameters: filter, state, labelsParameter(labels), sort, direction, sinceParameter(since))
  }
  
  public func listAllForOrganization(org: String,
                                     filter: Filter? = nil,
                                     state: State? = nil,
                                     labels: [String]? = nil,
                                     sort: Sort? = nil,
                                     direction: Direction? = nil,
                                     since: String? = nil,
                                     limit: Int? = nil) -> Observable<[Issue]> {
    return getObjects(apiUrl: .currentUserOrganizationIssues(org: org),
                      limit: limit,
                      parameters: filter, state, labelsParameter(labels), sort, direction, sinceParameter(since))
  }
  
  public func listAllForOrganizationPaginated(org: String,
                                              filter: Filter? = nil,
                                              state: State? = nil,
                                              labels: [String]? = nil,
                                              sort: Sort? = nil,
                                              direction: Direction? = nil,
                                              since: String? = nil) -> Observable<PageResult<Issue>> {
    return getPaginatedObjects(apiUrl: .currentUserOrganizationIssues(org: org),
                               parameters: filter, state, labelsParameter(labels), sort, direction, sinceParameter(since))
  }
  
  public func get(owner: String, repo: String, number: Int) -> Observable<Issue> {
    return getObject(apiUrl: .repositoryIssue(owner: owner, repo: repo, number: number))
  }
  
  public func create(_ issue: NewIssue, owner: String, repo: String) -> Observable<Issue> {
    return post(apiUrl: .repositoryIssues(owner: owner, repo: repo), object: issue)
  }
  
  public func edit(owner: String, repo: String, number: Int, update: IssueUpdate) -> Observable<Issue> {
    return patch(apiUrl: .repositoryIssue(owner: owner, repo: repo, number: number), object: update)
  }
}

@available(OSX 10.12, *)
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
