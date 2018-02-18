//
//  Issue.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/13/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

public struct Issue: Decodable {

  let id: Int
  let url: String
  let htmlUrl: String
  let commentsUrl: String
  let eventsUrl: String
  let number: Int
  let state: IssueState
  let title: String
  let body: String
  let closedBy: User?
  let user: User?
  // let labels: [Label]
  let assignee: User?
  let assignees:  [User]?
  //let milestone: Milestone?
  let comments: Int
  // let pullRequest: PullRequest
  let closedAt: Date?
  let createdAt: Date?
  let updatedAt: Date?
  let locked: Bool
  let repository: Repository?

}
