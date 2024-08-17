class User {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? createdAt; // Optional for registration response

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      createdAt: json['created_at'],
    );
  }
}
