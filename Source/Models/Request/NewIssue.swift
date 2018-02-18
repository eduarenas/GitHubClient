//
//  NewIssue.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/18/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

public struct NewIssue: Encodable {

  public let title: String
  public let body: String?
  public let milestone: Int?
  public let labels: [String]?
  public let assignees: [String]?

  public init(title: String,
              body: String? = nil,
              milestone: Int? = nil,
              labels: [String]? = nil,
              assignees: [String]? = nil) {
    self.title = title
    self.body = body
    self.milestone = milestone
    self.labels = labels
    self.assignees = assignees
  }
}
