//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

@available(OSX 10.12, *)
public final class RepositoriesClient: ApiClient {
  
  public func listAllForCurrentUser(visibility: Visibility? = nil,
                                    affiliations: [Affiliation]? = nil,
                                    type: CurrentUserRepoType? = nil,
                                    sort: Sort? = nil,
                                    direction: Direction? = nil,
                                    limit: Int? = nil) -> Observable<[Repository]> {
    let affiliation = affiliations?.joinedParameters()
    return getObjects(apiUrl: .currentUserRepositories, limit: limit, parameters: visibility, affiliation, type, sort, direction)
  }
  
  public func listAllForCurrentUserPaginated(visibility: Visibility? = nil,
                                             affiliations: [Affiliation]? = nil,
                                             type: CurrentUserRepoType? = nil,
                                             sort: Sort? = nil,
                                             direction: Direction? = nil) -> Observable<PageResult<Repository>> {
    let affiliation = affiliations?.joinedParameters()
    return getPaginatedObjects(apiUrl: .currentUserRepositories, parameters: visibility, affiliation, type, sort, direction)
  }
  
  public func listForUser(_ username: String,
                          type: UserRepoType? = nil,
                          sort: Sort? = nil,
                          direction: Direction? = nil,
                          limit: Int? = nil) -> Observable<[Repository]> {
    return getObjects(apiUrl: .userRepositories(username: username), limit: limit, parameters: type, sort, direction)
  }
  
  public func listForUserPaginated(_ username: String,
                                   type: UserRepoType? = nil,
                                   sort: Sort? = nil,
                                   direction: Direction? = nil) -> Observable<PageResult<Repository>> {
    return getPaginatedObjects(apiUrl: .userRepositories(username: username), parameters: type, sort, direction)
  }
  
  public func listForOrganization(_ organization: String, type: OrgRepoType? = nil, limit: Int? = nil) -> Observable<[Repository]> {
    return getObjects(apiUrl: .organizationRepositories(organization: organization), limit: limit, parameters: type)
  }
  
  public func listForOrganizationPaginated(_ organization: String, type: OrgRepoType? = nil) -> Observable<PageResult<Repository>> {
    return getPaginatedObjects(apiUrl: .organizationRepositories(organization: organization), parameters: type)
  }
  
  public func listAll(since repositoryId: Int? = nil, limit: Int = 100) -> Observable<[Repository]> {
    return getObjects(apiUrl: .repositories, limit: limit, parameters: repositoryId.map({ CustomApiParameter(name: "since", value: $0) }))
  }
  
  public func listAllPaginated(since repositoryId: Int? = nil) -> Observable<PageResult<Repository>> {
    return getPaginatedObjects(apiUrl: .repositories, parameters: repositoryId.map({ CustomApiParameter(name: "since", value: $0) }))
  }
  
  public func createForCurrentUser(_ repository: NewRepository) -> Observable<Repository> {
    return post(apiUrl: .currentUserRepositories, object: repository)
  }
  
  public func create(_ repository: NewRepository, inOrganization organization: String) -> Observable<Repository> {
    return post(apiUrl: .organizationRepositories(organization: organization), object: repository)
  }
  
  public func get(owner: String, repo: String) -> Observable<Repository> {
    return getObject(apiUrl: .repository(owner: owner, repo: repo))
  }
  
  public func edit(owner: String, repo: String, update: RepositoryUpdate) -> Observable<Repository> {
    return patch(apiUrl: .repository(owner: owner, repo: repo), object: update)
  }
  
  public func delete(owner: String, repo: String) -> Completable {
    return delete(apiUrl: .repository(owner: owner, repo: repo))
  }
}

@available(OSX 10.12, *)
public extension RepositoriesClient {
  
  enum Visibility: String, ApiParameter {
    public var name: String { return "visibility" }
    
    case all
    case `private`
    case `public`
  }
  
  enum CurrentUserRepoType: String, ApiParameter {
    public var name: String { return "type" }
    
    case all
    case member
    case owner
    case `private`
    case `public`
  }
  
  enum UserRepoType: String, ApiParameter {
    public var name: String { return "type" }
    
    case all
    case member
    case owner
  }
  
  enum OrgRepoType: String, ApiParameter {
    public var name: String { return "type" }
    
    case all
    case forks
    case member
    case `private`
    case `public`
    case source
  }
  
  enum Sort: String, ApiParameter {
    public var name: String { return "sort" }
    
    case created
    case fullName = "full_name"
    case pushed
    case updated
  }
}
