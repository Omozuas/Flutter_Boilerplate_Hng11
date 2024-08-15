import 'dart:convert';

import 'Organisation_roles_model.dart';

class OrganizationRoledById {
  final String id;
  final String name;
  final String description;
  final OrganisationRoles? permissions;

  const OrganizationRoledById({
    required this.id,
    required this.name,
    required this.description,
    this.permissions,
  });

  OrganizationRoledById copyWith(
      {String? id,
      String? name,
      String? description,
      OrganisationRoles? permissions}) {
    return OrganizationRoledById(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      permissions: permissions ?? this.permissions,
    );
  }

  factory OrganizationRoledById.fromMap(Map<String, dynamic> map) {
    return OrganizationRoledById(
        id: map['id'] as String,
        name: map['name'] as String,
        description: map['description'] as String,
        permissions: map['permissions'] == null
            ? null
            : OrganisationRoles.fromMap(
                map['permissions'] as Map<String, dynamic>));
  }

  factory OrganizationRoledById.fromJson(String source) =>
      OrganizationRoledById.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant OrganizationRoledById other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  String toString() {
    return 'OrganizationRoledById (id: $id, name: $name, description: $description,permissions: $permissions )';
  }
}
