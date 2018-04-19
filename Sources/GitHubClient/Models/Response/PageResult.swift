//
//  PageResult.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/24/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

import RxSwift

public struct PageResult<T> {
  public let items: [T]
  public let nextPage: Observable<PageResult<T>>?
}

