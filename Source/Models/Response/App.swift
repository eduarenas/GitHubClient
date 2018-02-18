//
//  App.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/17/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

public struct App: Codable {
  public let url: String
  public let name: String
  public let clientId: String
}

extension App {
  enum CodingKeys: String, CodingKey {
    case url
    case name
    case clientId = "client_id"
  }
}
