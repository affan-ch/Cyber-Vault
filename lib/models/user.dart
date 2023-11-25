class User {
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String token;

  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.username,
      required this.token});

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'username': username,
      'token': token,
    };
  }
}
