//
//  Invitation.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/18/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

public struct Invitation {
  let id: Int
  let repository: Repository
  let invetee: User
  let inviter: User
  let permissions: Permission
  let createdAt: Date
  let url: String
  let htmlUrl: String
}