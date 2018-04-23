//
//  Plan.swift
//  GitHubClient
//
//  Created by Eduardo Arenas on 4/23/18.
//

public struct Plan: Decodable {
  public let name: String
  public let space: Int?
  public let privateRepos: Int?
  public let filledSeats: Int?
  public let seats: Int?
}

extension Plan {
  enum CodingKeys: String, CodingKey {
    case name
    case space
    case privateRepos = "private_repos"
    case filledSeats = "filled_seats"
    case seats
  }
}
