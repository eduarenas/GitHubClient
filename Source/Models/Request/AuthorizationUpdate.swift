//
//  AuthorizationUpdate.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/18/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

public struct AuthorizationUpdate: Encodable {

  public let note: String?
  public let noteUrl: String?
  public let scopes: [String]?
  public let addScopes: [String]?
  public let removeScopes: [String]?
  public let fingerprint: String?

  public init(note: String? = nil,
              noteUrl: String? = nil,
              scopes: [String]? = nil,
              addScopes: [String]? = nil,
              removeScopes: [String]? = nil,
              fingerprint: String? = nil) {
    self.note = note
    self.noteUrl = noteUrl
    self.scopes = scopes
    self.addScopes = addScopes
    self.removeScopes = removeScopes
    self.fingerprint = fingerprint
  }
}
