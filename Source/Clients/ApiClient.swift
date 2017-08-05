import Foundation
import RxSwift

public class ApiClient {

  let decoder = JSONDecoder()

  private let httpService = HTTPService()
  private let headers: [String: CustomStringConvertible]

  public init(authorizationToken: String) {
    headers = ["Authorization": authorizationToken,
               "Accept": "application/vnd.github.v3+json"]
    decoder.dateDecodingStrategy = .iso8601
  }

  func get(apiUrl: ApiUrl, query: [String: CustomStringConvertible]? = nil) -> Observable<(Data, URLResponse)> {
    return httpService.get(url: apiUrl.fullPath, query: query, headers: headers)
  }
}
