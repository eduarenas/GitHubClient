//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

public final class UsersClient: ApiClient {

  public func get(username: String) -> Observable<User> {
    return getObject(apiUrl: .user(username: username))
  }

  public func getCurrent() -> Observable<User> {
    return getObject(apiUrl: .currentUser)
  }

  public func updateCurrent(update: UserUpdate) -> Observable<User> {
    return patch(apiUrl: .currentUser, object: update)
  }

  public func listAll(since userId: Int? = nil) -> Observable<[User]> {
    return getObject(apiUrl: .users, parameters: userId.map({ [CustomApiParameter(name: "since", value: $0)] }))
  }
}
