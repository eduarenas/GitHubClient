//
//  CommonParameters.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/12/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

public enum Affiliation: String, ApiParameter {
  public var name: String { return "affiliation" }

  case collaborator
  case organizationMember = "organization_member"
  case owner
}

public enum Permission: String, ApiParameter, Encodable {
  public var name: String { return "permission" }

  case pull
  case push
  case admin
}
