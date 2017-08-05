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

  public func getAllForCurrentUser(visibility: Visibility? = nil, affiliations: [Affiliation]? = nil, type: RepoType? = nil, sort: Sort? = nil, direction: Direction? = nil) -> Observable<[Repository]> {
    let affiliation = affiliations.map { CustomApiParameter.joinedParameters(fromParameters: $0) }
    return get(apiUrl: .currentUserRepositories, parameters: [visibility, affiliation, type, sort, direction])
  }

  public func getRepositories(forUser username: String) -> Observable<[Repository]> {
    return get(apiUrl: .userRepositories(username: username))
  }

  public func getRepositories(forOrganization organization: String) -> Observable<[Repository]> {
    return get(apiUrl: .organizationRepositories(organization: organization))
  }

  public func getAllRepositories() -> Observable<[Repository]> {
    return get(apiUrl: .repositories)
  }

}

public extension RepositoriesClient {
  
  public enum Visibility: String, ApiParameter {
    public var name: String { return "visibility" }

    case all
    case `private`
    case `public`
  }

  public enum Affiliation: String, ApiParameter {
    public var name: String { return "affiliation" }

    case collaborator
    case organizationMember = "organization_member"
    case owner
  }

  public enum RepoType: String, ApiParameter {
    public var name: String { return "type" }

    case all
    case member
    case owner
    case `private`
    case `public`
  }

  public enum Sort: String, ApiParameter {
    public var name: String { return "sort" }

    case created
    case fullName = "full_name"
    case pushed
    case updated
  }

  public enum Direction: String, ApiParameter {
    public var name: String { return "direction" }

    case ascending = "asc"
    case descending = "desc"
  }
}
