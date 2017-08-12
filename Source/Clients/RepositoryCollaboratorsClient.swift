//
//  RepositoryCollaboratorsClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/12/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation
import RxSwift

public final class RepositoryCollaboratorsClient: ApiClient {

  public func listAll(owner: String, repo: String, affiliation: Affiliation? = nil) -> Observable<[User]> {
    return get(apiUrl: ApiUrl.repositoryCollaborators(owner: owner, repo: repo), parameters: [affiliation])
  }

