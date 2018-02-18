//
//  IssueLabel.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/18/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

public struct IssueLabel: Decodable {
  public let id: Int
  public let url: String
  public let name: String
  public let color: String
  public let `default`: Bool
}
