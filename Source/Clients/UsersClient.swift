//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

public class UsersClient: ApiClient {

  public func getUser(username: String) -> Observable<User> {
    return get(apiUrl: ApiUrl.user(username: username))
  }

  public func getCurrentUser() -> Observable<User> {
    return get(apiUrl: ApiUrl.currentUser)
  }

  public func getAllUsers() -> Observable<[User]> {
    return get(apiUrl: ApiUrl.users)
  }
}
