class User {
  String host;
  String token;
  // 工厂模式
  factory User() =>_getInstance();
  static User get instance => _getInstance();
  static User _instance;
  User._internal() {
    // 
  }
  static User _getInstance() {
    if (_instance == null) {
      _instance = new User._internal();
    }
    return _instance;
  }

  setHost(String host) {
    this.host = host;
  }

  setToken(String token) {
    this.token = token;
  }

  String getHost() {
    return this.host;
  }

  String getToken() {
    return this.token;
  }
}
