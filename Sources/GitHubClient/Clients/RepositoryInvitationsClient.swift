//
//  RepositoryInvitationsClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/18/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

import RxSwift

@available(OSX 10.12, *)
public final class RepositoryInvitationsClient: ApiClient {
  
  public func listAll(owner: String, repo: String, limit: Int? = nil) -> Observable<[Invitation]> {
    return getObjects(apiUrl: .invitations(owner: owner, repo: repo), limit: limit)
  }
  
  public func listAllPaginated(owner: String, repo: String) -> Observable<PageResult<Invitation>> {
    return getPaginatedObjects(apiUrl: .invitations(owner: owner, repo: repo))
  }
  
  public func delete(owner: String, repo: String, id: Int) -> Completable {
    return delete(apiUrl: .invitation(owner: owner, repo: repo, id: id))
  }
  
}
