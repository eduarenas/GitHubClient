//
//  RepositoryCollaboratorsClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/12/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

public final class RepositoryCollaboratorsClient: ApiClient {

  public func listAll(owner: String, repo: String, affiliation: Affiliation? = nil) -> Observable<[User]> {
    return getObject(apiUrl: .repositoryCollaborators(owner: owner, repo: repo), parameters: affiliation)
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
