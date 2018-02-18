//
//  Authorization.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/17/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

public struct Authorization: Decodable {
  public let id: Int
  public let url: String
  public let scopes: [String]
  public let token: String
  public let tokenLastEight: String
  public let hashedToken: String
  public let app: App
  public let note: String?
  public let noteUrl: String?
  public let fingerprint: String?
  public let updatedAt: Date
  public let createdAt: Date
}

extension Authorization {
  enum CodingKeys: String, CodingKey {
    case id
    case url
    case scopes
    case token
    case tokenLastEight = "token_last_eight"
    case hashedToken = "hashed_token"
    case app
    case note
    case noteUrl = "note_url"
    case updatedAt = "updated_at"
    case createdAt = "created_at"
    case fingerprint
  }
}
