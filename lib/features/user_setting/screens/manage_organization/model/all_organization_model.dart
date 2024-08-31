class AllOrganizationResponse {
  List<SingleOrganization>? data;
  String? message;
  int? statusCode;

  AllOrganizationResponse({this.data, this.message, this.statusCode});

  AllOrganizationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SingleOrganization>[];
      json['data'].forEach((v) {
        data!.add(SingleOrganization.fromJson(v));
      });
    }
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status_code'] = statusCode;
    return data;
  }
}

class SingleOrganization {
  String? id;
  String? name;
  String? description;
  String? slug;
  String? email;
  String? industry;
  String? type;
  String? country;
  String? address;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? ownerId;
  bool? isActive;

  SingleOrganization(
      {this.id,
        this.name,
        this.description,
        this.slug,
        this.email,
        this.industry,
        this.type,
        this.country,
        this.address,
        this.state,
        this.createdAt,
        this.updatedAt,
        this.ownerId,
        this.isActive});

  SingleOrganization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    slug = json['slug'];
    email = json['email'];
    industry = json['industry'];
    type = json['type'];
    country = json['country'];
    address = json['address'];
    state = json['state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ownerId = json['owner_id'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['slug'] = slug;
    data['email'] = email;
    data['industry'] = industry;
    data['type'] = type;
    data['country'] = country;
    data['address'] = address;
    data['state'] = state;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['owner_id'] = ownerId;
    data['is_active'] = isActive;
    return data;
  }
}
