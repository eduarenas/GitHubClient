//
//  RepositoryCollaboratorsClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/12/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

@available(OSX 10.12, *)
public final class RepositoryCollaboratorsClient: ApiClient {
  
  public func listAll(owner: String, repo: String, affiliation: Affiliation? = nil, limit: Int? = nil) -> Observable<[User]> {
    return getObjects(apiUrl: .repositoryCollaborators(owner: owner, repo: repo), limit: limit, parameters: affiliation)
  }
  
  public func listAllPaginated(owner: String, repo: String, affiliation: Affiliation? = nil) -> Observable<PageResult<User>> {
    return getPaginatedObjects(apiUrl: .repositoryCollaborators(owner: owner, repo: repo), parameters: affiliation)
  }
  
  public func check(owner: String, repo: String, username: String) -> Observable<Bool> {
    return getBoolean(apiUrl: .repositoryCollaborator(owner: owner, repo: repo, username: username))
  }
  
  public func add(owner: String, repo: String, username: String, permission: Permission? = nil) -> Completable {
    return put(apiUrl: .repositoryCollaborator(owner: owner, repo: repo, username: username),
               parameters: permission.flatMap({ PermisionParameter(permission: $0) }))
  }
  
  public func delete(owner: String, repo: String, username: String) -> Completable {
    return delete(apiUrl: .repositoryCollaborator(owner: owner, repo: repo, username: username))
  }
  
  struct PermisionParameter: Encodable {
    let permission: Permission
  }
}
