class GetUserData {
  AuthUser? data;
  String? message;
  int? statusCode;

  GetUserData({this.data, this.message, this.statusCode});

  GetUserData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  AuthUser.fromJson(json['data']) : null;
    data = json['data'] != null ? AuthUser.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] =message;
    data['status_code'] =statusCode;
    data['message'] = message;
    data['status_code'] = statusCode;
    return data;
  }
}

class AuthUser {
  String? fullname;
  String? id;
  String? email;
  dynamic profile;
  String? avatarUrl;
  List<Organisations>? organisations;
  List<dynamic>? blogs;

  AuthUser(
      {this.fullname,
      this.id,
      this.email,
      this.profile,
      this.avatarUrl,
      this.organisations,
      this.blogs});

  AuthUser.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    id = json['id'];
    email = json['email'];
    profile = json['profile'];
    avatarUrl = json['avatar_url'];
    if (json['organisations'] != null) {
      organisations = <Organisations>[];
      json['organisations'].forEach((v) {
        organisations!.add( Organisations.fromJson(v));
      });
    }
    if (json['blogs'] != null) {
      blogs = <Null>[];
      json['blogs'].forEach((v) {
        // blogs!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fullname'] =fullname;
    data['id'] =id;
    data['email'] =email;
    data['profile'] =profile;
    data['avatar_url'] =avatarUrl;
    if (this.organisations != null) {
      data['organisations'] =
          this.organisations!.map((v) => v.toJson()).toList();
    }
    if (blogs != null) {
      // data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    if (this.blogs != null) {
      // data['blogs'] =blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organisations {
  String? id;
  String? name;
  dynamic description;
  dynamic slug;
  String? email;
  dynamic industry;
  dynamic type;
  dynamic country;
  dynamic address;
  dynamic state;
  String? createdAt;
  String? updatedAt;
  String? ownerId;
  bool? isActive;
  List<dynamic>? usersRoles;

  Organisations(
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
      this.isActive,
      this.usersRoles});

  Organisations.fromJson(Map<String, dynamic> json) {
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
    if (json['usersRoles'] != null) {
      usersRoles = <Null>[];
      json['usersRoles'].forEach((v) {
        // usersRoles!.add( Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] =id;
    data['name'] =name;
    data['description'] =description;
    data['slug'] =slug;
    data['email'] =email;
    data['industry'] =industry;
    data['type'] =type;
    data['country'] =country;
    data['address'] =address;
    data['state'] =state;
    data['created_at'] =createdAt;
    data['updated_at'] =updatedAt;
    data['owner_id'] =ownerId;
    data['is_active'] =isActive;
    if (this.usersRoles != null) {
      data['usersRoles'] = usersRoles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
