//
//  UserUpdate.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/11/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

public struct UserUpdate: Encodable {

  public let name: String?
  public let email: String?
  public let blog: String?
  public let company: String?
  public let location: String?
  public let hireable: Bool?
  public let bio: String?

  public init(name: String? = nil,
              email: String? = nil,
              blog: String? = nil,
              company: String? = nil,
              location: String? = nil,
              hireable: Bool? = nil,
              bio: String? = nil) {
    self.name = name
    self.email = email
    self.blog = blog
    self.company = company
    self.location = location
    self.hireable = hireable
    self.bio = bio
  }
}
