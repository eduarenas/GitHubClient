//
//  PageLinkParser.swift
//  GithubClient
//
//  Created by Eduardo Arenas on 2/18/18.
//  Copyright © 2018 GameChanger. All rights reserved.
//

import Foundation

struct PageLinks {
  let first: String?
  let previous: String?
  let next: String?
  let last: String?
}

final class PageLinkParser {

  private static let regex = try! NSRegularExpression(pattern: "<(?<url>[^>]*)>; ?rel=\"(?<rel>[^\"]*)\"")

  static func parse(linkString: String) -> PageLinks {
    let matches = regex.matches(in: linkString, range: NSRange(linkString.startIndex..., in: linkString))
    let relations = matches.map { String(linkString[Range($0.range(withName: "rel"), in: linkString)!]) }
    let urls = matches.map { String(linkString[Range($0.range(withName: "url"), in: linkString)!]) }
    let dictionary = Dictionary(uniqueKeysWithValues: zip(relations, urls))

    return PageLinks(first: dictionary["first"],
                     previous: dictionary["prev"],
                     next: dictionary["next"],
                     last: dictionary["last"])
  }
}
