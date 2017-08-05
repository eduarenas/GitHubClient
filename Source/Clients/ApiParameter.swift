//
//  ApiParameter.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 8/5/17.
//  Copyright © 2017 GameChanger. All rights reserved.
//

import Foundation

public protocol ApiParameter {
  var name: String { get }
  var value: CustomStringConvertible { get }
}

extension ApiParameter where Self: RawRepresentable {
  public typealias RawValue = String
  public var value: CustomStringConvertible {
    return self.rawValue
  }
}

struct CustomApiParameter: ApiParameter {
  let name: String
  let value: CustomStringConvertible

  // TODO: Move to `extension Array: ApiParameter where Element: ApiParameter?` when conditional conformances (SE-0143) are implemented
  static func queryDict(forParameters parameters: [ApiParameter?]) -> [String: CustomStringConvertible]? {
    let unwrappedParameters = parameters.flatMap({ $0 })
    guard unwrappedParameters.count > 0 else {
      return nil
    }

    var queryDict = [String: CustomStringConvertible]()
    unwrappedParameters.forEach { (parameter) in
      queryDict[parameter.name] = parameter.value
    }
    return queryDict
  }

  // TODO: Move to `extension Array: ApiParameter where Element: ApiParameter` when conditional conformances (SE-0143) are implemented
  static func joinedParameters(fromParameters parameters: [ApiParameter]) -> ApiParameter {
    assert(Set(parameters.map({ $0.name })).count == 1, "All parameters in array need to have the same name")
    precondition(!parameters.isEmpty, "Parameters must not be empty")
    return CustomApiParameter(name: parameters[0].name, value: parameters.map({ $0.value.description }).joined(separator: ","))
  }
}
