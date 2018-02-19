//
//  HTTPService+Rx.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 7/18/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import RxSwift

extension HTTPService {
  
  func get(url: String,
           query: [String: CustomStringConvertible]? = nil,
           headers: [String: CustomStringConvertible]? = nil) -> Observable<(Data, HTTPURLResponse)> {
    return Observable.create({ (observer) -> Disposable in
      self.get(url: url, query: query, headers: headers, completion: self.notifyObserver(observer))
      return Disposables.create()
    })
  }
  
  func post(url: String,
            query: [String: CustomStringConvertible]? = nil,
            data: Data? = nil,
            headers: [String: CustomStringConvertible]? = nil) -> Observable<(Data, HTTPURLResponse)> {
    return Observable.create({ (observer) -> Disposable in
      self.post(url: url, query: query, data: data, headers: headers, completion: self.notifyObserver(observer))
      return Disposables.create()
    })
  }

  func patch(url: String,
             query: [String: CustomStringConvertible]? = nil,
             data: Data? = nil,
             headers: [String: CustomStringConvertible]? = nil) -> Observable<(Data, HTTPURLResponse)> {
    return Observable.create({ (observer) -> Disposable in
      self.patch(url: url, query: query, data: data, headers: headers, completion: self.notifyObserver(observer))
      return Disposables.create()
    })
  }
  
  func put(url: String,
           query: [String: CustomStringConvertible]? = nil,
           data: Data? = nil,
           headers: [String: CustomStringConvertible]? = nil) -> Observable<(Data, HTTPURLResponse)> {
    return Observable.create({ (observer) -> Disposable in
      self.put(url: url, query: query, data: data, headers: headers, completion: self.notifyObserver(observer))
      return Disposables.create()
    })
  }
  
  func delete(url: String,
              query: [String: CustomStringConvertible]? = nil,
              headers: [String: CustomStringConvertible]? = nil) -> Observable<(Data, HTTPURLResponse)> {
    return Observable.create({ (observer) -> Disposable in
      self.delete(url: url, query: query, headers: headers, completion: self.notifyObserver(observer))
      return Disposables.create()
    })
  }
  
  private func notifyObserver(_ observer: AnyObserver<(Data, HTTPURLResponse)>) -> CompletionHandler {
    return { (data, response, error) in
      if let error = error {
        observer.onError(error)
      } else if let data = data, let response = response as? HTTPURLResponse {
        observer.onNext((data, response))
        observer.onCompleted()
      } else {
        observer.onError(HTTPServiceError.invalidResponse)
      }
    }
  }
}

