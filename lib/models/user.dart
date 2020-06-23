class User {
  int id;
  String firstName;
  String lastName;
  String username;
  String password;

  User({ this.id, this.firstName, this.lastName, this.username, this.password });

  Map toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'password': password
      };

  User.fromJson(Map json) {
    this.id = json['ID'];
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.username = json['username'];
    this.password = json['password'];
  }

}
