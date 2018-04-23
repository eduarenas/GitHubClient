//
//  Invitation.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/18/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

import Foundation

public struct Invitation: Decodable {
  public let id: Int
  public let repository: Repository
  public let invetee: User
  public let inviter: User
  public let permissions: InvitationPermissions
  public let createdAt: Date
  public let url: String
  public let htmlUrl: String
}
