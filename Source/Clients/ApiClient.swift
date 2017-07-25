import Foundation
import RxSwift

public class ApiClient {

  let decoder = JSONDecoder()

  private let baseURL = "https://api.github.com/"

  private let httpService = HTTPService()
  private let headers: [String: CustomStringConvertible]

  public init(authorizationToken: String) {
    headers = ["Authorization": authorizationToken,
               "Accept": "application/vnd.github.v3+json"]
    decoder.dateDecodingStrategy = .iso8601
  }

  func get(pathComponents: [CustomStringConvertible], query: [String: CustomStringConvertible]? = nil) -> Observable<(Data, URLResponse)> {
    let url = fullPath(for: pathComponents)
    return httpService.get(url: url, query: query, headers: headers)
  }

  private func fullPath(for components: [CustomStringConvertible]) -> String {
    let endpointPath = components.map({ $0.description }).joined(separator: "/")
    return baseURL.appending(endpointPath)
  }
}

