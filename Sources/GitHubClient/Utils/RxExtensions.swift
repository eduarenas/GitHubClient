//
//  RxExtensions.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/25/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

extension ObservableType {
  func asCompletable() -> Completable {
    return flatMap { _ in Observable<Never>.empty() }
      .asCompletable()
  }
}
