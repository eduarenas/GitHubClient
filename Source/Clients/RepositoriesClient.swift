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

  public func getAllForCurrentUser(visibility: Visibility? = nil, affiliations: [Affiliation]? = nil, type: CurrentUserRepoType? = nil, sort: Sort? = nil, direction: Direction? = nil) -> Observable<[Repository]> {
    let affiliation = affiliations.map { CustomApiParameter.joinedParameters(fromParameters: $0) }
    return get(apiUrl: .currentUserRepositories, parameters: [visibility, affiliation, type, sort, direction])
  }

  public func getRepositories(forUser username: String, type: UserRepoType? = nil, sort: Sort? = nil, direction: Direction? = nil) -> Observable<[Repository]> {
    return get(apiUrl: .userRepositories(username: username), parameters: [type, sort, direction])
  }

  public func getRepositories(forOrganization organization: String, type: OrgRepoType? = nil) -> Observable<[Repository]> {
    return get(apiUrl: .organizationRepositories(organization: organization), parameters: [type])
  }

  public func getAllRepositories(since repositoryId: Int? = nil) -> Observable<[Repository]> {
    return get(apiUrl: .repositories, parameters: repositoryId.map({ [CustomApiParameter(name: "since", value: $0)] }))
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

  public enum CurrentUserRepoType: String, ApiParameter {
    public var name: String { return "type" }

    case all
    case member
    case owner
    case `private`
    case `public`
  }

  public enum UserRepoType: String, ApiParameter {
    public var name: String { return "type" }

    case all
    case member
    case owner
  }

  public enum OrgRepoType: String, ApiParameter {
    public var name: String { return "type" }

    case all
    case forks
    case member
    case `private`
    case `public`
    case source
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
