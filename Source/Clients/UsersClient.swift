import RxSwift

public class UsersClient: ApiClient {
  enum Endpoints {
    case user(String)
    case users

    var pathComponents: [String] {
      switch self {
      case .user(let username): return ["users", username]
      case .users: return ["users"]
      }
    }
  }

  public func getUser(username: String) -> Observable<User> {
    return self.get(pathComponents: Endpoints.user(username).pathComponents)
      .map({ (data, response) -> User in
        return try self.decoder.decode(User.self, from: data)
      })
  }
}
