//
//  OAuthClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/17/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

import RxSwift

public final class OAuthClient: ApiClient {

  public func listAuthorizations() -> Observable<[Authorization]> {
    return getObject(apiUrl: .authorizations)
  }

  public func createAuthorization(_ authorization: NewAuthorization) -> Observable<Authorization> {
    return post(apiUrl: .authorizations, object: authorization)
  }
}
