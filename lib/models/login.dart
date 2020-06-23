class Login {
  final String username;
  final String password;

  Login(this.username, this.password);

  Map toJson() => {
    'username': username,
    'password': password
  };
}
