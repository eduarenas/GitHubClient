//
//  ApiParameter.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

public protocol ApiParameter {
  var name: String { get }
  var value: CustomStringConvertible { get }
}

extension ApiParameter where Self: RawRepresentable, Self.RawValue == String {
  public var value: CustomStringConvertible {
    return self.rawValue
  }
}

struct CustomApiParameter: ApiParameter {
  let name: String
  let value: CustomStringConvertible

  static func queryDict(forParameters parameters: [ApiParameter]) -> [String: CustomStringConvertible] {
    return Dictionary(parameters.map({ ($0.name, $0.value) }), uniquingKeysWith: { $1 })
  }
}

extension Array where Element: ApiParameter {

  func joinedParameters() -> ApiParameter {
    assert(Set(self.map({ $0.name })).count == 1, "All parameters in array need to have the same name")
    precondition(!self.isEmpty, "Parameters must not be empty")
    return CustomApiParameter(name: self[0].name, value: self.map({ $0.value.description }).joined(separator: ","))
  }
}
