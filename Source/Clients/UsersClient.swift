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
    return self.get(apiUrl: ApiUrl.user(username))
      .map({ (data, response) -> User in
        return try self.decoder.decode(User.self, from: data)
      })
  }
}
