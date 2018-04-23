//
//  OrganizationsClient.swift
//  GitHubClient
//
//  Created by Eduardo Arenas on 4/20/18.
//

import RxSwift

@available(OSX 10.12, *)
final public class OrganizationsClient: ApiClient {

  // Mark: Organizations

  public func listAllForCurrentUser(limit: Int? = nil) -> Observable<[Organization]> {
    return getObjects(apiUrl: .currentUserOrganizations, limit: limit)
  }

  public func listAllForCurrentUserPaginated() -> Observable<PageResult<Organization>> {
    return getPaginatedObjects(apiUrl: .currentUserOrganizations)
  }

  public func listForUser(_ username: String, limit: Int? = nil) -> Observable<[Organization]> {
    return getObjects(apiUrl: .userOrganizations(username: username), limit: limit)
  }

  public func listForUserPaginated(_ username: String) -> Observable<PageResult<Organization>> {
    return getPaginatedObjects(apiUrl: .userOrganizations(username: username))
  }

  public func listAll(since organizationId: Int? = nil, limit: Int = 100) -> Observable<[Organization]> {
    return getObjects(apiUrl: .organizations, limit: limit, parameters: organizationId.map({ CustomApiParameter(name: "since", value: $0) }))
  }

  public func listAllPaginated(since organizationId: Int? = nil) -> Observable<PageResult<Organization>> {
    return getPaginatedObjects(apiUrl: .organizations, parameters: organizationId.map({ CustomApiParameter(name: "since", value: $0) }))
  }

  public func get(org: String) -> Observable<Organization> {
    return getObject(apiUrl: .organization(org: org))
  }

  public func edit(org: String, update: OrganizationUpdate) -> Observable<Organization> {
    return patch(apiUrl: .organization(org: org), object: update)
  }

  // MARK: Outside Collaborators

  public func listOutsideCollaborators(org: String, filter: CollaboratorsFilter? = nil, limit: Int? = nil) -> Observable<[User]> {
    return getObjects(apiUrl: .organizationOutsideCollaborators(org: org), limit: limit, parameters: filter)
  }

  public func listOutsideCollaboratorsPaginated(org: String, filter: CollaboratorsFilter? = nil) -> Observable<PageResult<User>> {
    return getPaginatedObjects(apiUrl: .organizationOutsideCollaborators(org: org), parameters: filter)
  }

  public func removeOutsideCollaborator(org: String, username: String) -> Completable {
    return delete(apiUrl: .organizationOutsideCollaborator(org: org, username: username))
  }
}

@available(OSX 10.12, *)
public extension OrganizationsClient {

  public enum CollaboratorsFilter: String, ApiParameter {
    public var name: String { return "filter" }

    case twoFactorAuthDisabled
    case all
  }
}
