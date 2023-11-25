class Account {
  final String id;
  final String accountDomain;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String password;
  final String phoneNumber;

  Account(this.id, this.accountDomain, this.firstName, this.lastName,
      this.email, this.username, this.password, this.phoneNumber);

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        json['id'] ?? "",
        json['accountDomain'] ?? "No Domain",
        json['firstName'] ?? "",
        json['lastName'] ?? "",
        json['email'] ?? "",
        json['username'] ?? "",
        json['password'] ?? "",
        json['phoneNumber'] ?? "");
  }
}
