import 'dart:convert';

class OrganisationRoles {
  final String id;
  final String name;
  final String description;

  const OrganisationRoles({
    required this.id,
    required this.name,
    required this.description,
  });

  OrganisationRoles copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return OrganisationRoles(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "description": description,
      "name": name,
    };
  }

  factory OrganisationRoles.fromMap(Map<String, dynamic> map) {
    return OrganisationRoles(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrganisationRoles.fromJson(String source) =>
      OrganisationRoles.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant OrganisationRoles other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  String toString() {
    return 'OrganisationRoles(id: $id, name: $name, description: $description)';
  }
}
