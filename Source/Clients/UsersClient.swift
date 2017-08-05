import RxSwift

public class UsersClient: ApiClient {

  public func getUser(username: String) -> Observable<User> {
    return self.get(apiUrl: ApiUrl.user(username))
      .map({ (data, response) -> User in
        return try self.decoder.decode(User.self, from: data)
      })
  }
}
