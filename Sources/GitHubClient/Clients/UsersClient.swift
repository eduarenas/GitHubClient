//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

@available(OSX 10.12, *)
public final class UsersClient: ApiClient {

  public func get(username: String) -> Observable<User> {
    return getObject(apiUrl: .user(username: username))
  }

  public func getCurrent() -> Observable<User> {
    return getObject(apiUrl: .currentUser)
  }

  public func editCurrent(update: UserUpdate) -> Observable<User> {
    return patch(apiUrl: .currentUser, object: update)
  }

  public func listAll(since userId: Int? = nil, limit: Int = 100) -> Observable<[User]> {
    return getObjects(apiUrl: .users,
                      limit: limit,
                      parameters: userId.map({ CustomApiParameter(name: "since", value: $0) }))
  }
  
  public func listAllPaginated(since userId: Int? = nil) -> Observable<PageResult<User>> {
    return getPaginatedObjects(apiUrl: .users, parameters: userId.map({ CustomApiParameter(name: "since", value: $0) }))
  }
}
