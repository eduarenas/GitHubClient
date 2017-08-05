//
//  RepositoriesClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

import RxSwift

public class RepositoriesClient: ApiClient {

  public func getAllForCurrentUser() -> Observable<[Repository]> {
    return self.get(apiUrl: .currentUserRepositories)
  }

  public func getRepositories(forUser username: String) -> Observable<[Repository]> {
    return self.get(apiUrl: .userRepositories(username: username))
  }

  public func getRepositories(forOrganization organization: String) -> Observable<[Repository]> {
    return self.get(apiUrl: .organizationRepositories(organization: organization))
  }

}
