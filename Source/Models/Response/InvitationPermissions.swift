//
//  InvitationPermissions.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/25/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

public enum InvitationPermissions: String, Decodable {
  case read
  case write
  case admin
}
