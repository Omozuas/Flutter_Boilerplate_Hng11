import 'dart:convert';

class UserOwnedOrganization {
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String name;
  final String? description;
  final String email;
  final String? industry;
  final String? type;
  final String? country;
  final String? address;
  final String? state;
  final bool isDeleted;

  const UserOwnedOrganization({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.email,
    required this.industry,
    required this.type,
    required this.country,
    required this.address,
    required this.state,
    required this.isDeleted,
  });

  UserOwnedOrganization copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? description,
    String? email,
    String? industry,
    String? type,
    String? country,
    String? address,
    String? state,
    bool? isDeleted,
  }) {
    return UserOwnedOrganization(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      description: description ?? this.description,
      email: email ?? this.email,
      industry: industry ?? this.industry,
      type: type ?? this.type,
      country: country ?? this.country,
      address: address ?? this.address,
      state: state ?? this.state,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
      'name': name,
      if (description != null) 'description': description,
      'email': email,
      if (industry != null) 'industry': industry,
      if (type != null) 'type': type,
      if (country != null) 'country': country,
      if (address != null) 'address': address,
      if (state != null) 'state': state,
      'isDeleted': isDeleted,
    };
  }

  factory UserOwnedOrganization.fromMap(Map<String, dynamic> map) {
    return UserOwnedOrganization(
      id: map['id'] as String,
      createdAt: DateTime.parse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      name: map['name'] as String,
      description: map['description'] as String?,
      email: map['email'] as String,
      industry: map['industry'] as String?,
      type: map['type'] as String?,
      country: map['country'] as String?,
      address: map['address'] as String?,
      state: map['state'] as String?,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserOwnedOrganization.fromJson(String source) =>
      UserOwnedOrganization.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserOwnedOrganization(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, description: $description, email: $email, industry: $industry, type: $type, country: $country, address: $address, state: $state, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant UserOwnedOrganization other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
