//
//  OAuthClient.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/17/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

import RxSwift

public final class OAuthClient: ApiClient {
  
  public func list(limit: Int? = nil) -> Observable<[Authorization]> {
    return getObjects(apiUrl: .authorizations, limit: limit)
  }
  
  public func listPaginated() -> Observable<PageResult<Authorization>> {
    return getPaginatedObjects(apiUrl: .authorizations)
  }
  
  public func get(id: Int) -> Observable<Authorization> {
    return getObject(apiUrl: .authorization(id: id))
  }
  
  public func create(_ authorization: NewAuthorization) -> Observable<Authorization> {
    return post(apiUrl: .authorizations, object: authorization)
  }
  
  public func getOrCreate(_ authorization: NewAuthorization, clientId: String, fingerprint: String? = nil) -> Observable<Authorization> {
    if let fingerprint = fingerprint {
      return put(apiUrl: .clientAndFingerprintAuthorization(clientId: clientId, fingerprint: fingerprint), object: authorization)
    } else {
      return put(apiUrl: .clientAuthorization(clientId: clientId), object: authorization)
    }
  }
  
  public func edit(id: Int, update: AuthorizationUpdate) -> Observable<Authorization> {
    return patch(apiUrl: .authorization(id: id), object: update)
  }
  
  public func delete(id: Int) -> Completable {
    return delete(apiUrl: .authorization(id: id))
  }
  
  public func check(clientId: String, token: String) -> Observable<Authorization> {
    return getObject(apiUrl: .clientAuthorizationToken(clientId: clientId, token: token))
  }
  
  public func reset(clientId: String, token: String) -> Observable<Authorization> {
    return post(apiUrl: .clientAuthorizationToken(clientId: clientId, token: token))
  }
  
  public func revoke(clientId: String, token: String) -> Completable {
    return delete(apiUrl: .clientAuthorizationToken(clientId: clientId, token: token))
  }
}
