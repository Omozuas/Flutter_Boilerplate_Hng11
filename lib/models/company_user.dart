import 'dart:convert';

// Model for signup purpose (company)

class Company {
  final String name;
  final String description;
  final String email;
  final String state;
  final String industry;
  final String type;
  final String address;
  final String country;
  Company({
    required this.name,
    required this.description,
    required this.email,
    required this.state,
    required this.industry,
    required this.type,
    required this.address,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'email': email,
      'state': state,
      'industry': industry,
      'type': type,
      'address': address,
      'country': country,
    };
  }

  factory Company.initial() {
    return Company(
        name: '',
        description: '',
        email: '',
        state: '',
        industry: '',
        type: '',
        address: '',
        country: '');
  }
  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      email: map['email'] ?? '',
      state: map['state'] ?? '',
      industry: map['industry'] ?? '',
      type: map['type'] ?? '',
      address: map['address'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Company(name: $name, description: $description, email: $email, state: $state, industry: $industry, type: $type, address: $address, country: $country)';
  }
}
