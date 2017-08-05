//
//  Repository.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

public struct Repository: Codable {
  public let description: String?
  public let id: Int
  public let name: String
}
