//
//  Limit.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/24/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

public enum Limit {
  case limit(Int)
  case all

  var perPage: Int {
    switch self {
    case .limit(let limit): return min(limit, 100)
    case .all: return 100
    }
  }
}
