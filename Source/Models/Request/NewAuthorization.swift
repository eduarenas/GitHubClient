//
//  NewAuthorization.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/17/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

public struct NewAuthorization: Encodable {
  
  public let note: String?
  public let noteUrl: String?
  public let scopes: [String]?
  public let clientId: String?
  public let clientSecret: String?
  public let fingerprint: String?
  
  public init(note: String? = nil,
    noteUrl: String? = nil,
    scopes: [String]? = nil,
    clientId: String? = nil,
    clientSecret: String? = nil,
    fingerprint: String? = nil) {
    self.note = note
    self.noteUrl = noteUrl
    self.scopes = scopes
    self.clientId = clientId
    self.clientSecret = clientSecret
    self.fingerprint = fingerprint
  }
}
