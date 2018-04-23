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
  public let invitee: User
  public let inviter: User
  public let permissions: InvitationPermissions
  public let createdAt: Date
  public let url: String
  public let htmlUrl: String
}

extension Invitation {
  enum CodingKeys: String, CodingKey {
    case id
    case repository
    case invitee
    case inviter
    case permissions
    case createdAt = "created_at"
    case url
    case htmlUrl = "html_url"
  }
}
