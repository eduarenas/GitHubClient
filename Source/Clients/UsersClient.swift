//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

public class UsersClient: ApiClient {

  public func get(username: String) -> Observable<User> {
    return get(apiUrl: ApiUrl.user(username: username))
  }

  public func getCurrent() -> Observable<User> {
    return get(apiUrl: ApiUrl.currentUser)
  }

  public func getAll(since userId: Int? = nil) -> Observable<[User]> {
    return get(apiUrl: ApiUrl.users, parameters: userId.map({ [CustomApiParameter(name: "since", value: $0)] }))
  }

  public func updateCurrent(update: UserUpdate) -> Observable<User> {
    return patch(apiUrl: ApiUrl.currentUser, object: update)
  }
}
