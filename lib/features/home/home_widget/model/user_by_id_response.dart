class GetUserByIDResponse {
  String? fullname;
  String? id;
  String? email;
  Profile? profile;
  String? avatarUrl;
  List<Organisations>? organisations;
  List<Blogs>? blogs;

  GetUserByIDResponse(
      {this.fullname,
        this.id,
        this.email,
        this.profile,
        this.avatarUrl,
        this.organisations,
        this.blogs});

  GetUserByIDResponse.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    id = json['id'];
    email = json['email'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    avatarUrl = json['avatar_url'];
    if (json['organisations'] != null) {
      organisations = <Organisations>[];
      json['organisations'].forEach((v) {
        organisations!.add(new Organisations.fromJson(v));
      });
    }
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['id'] = this.id;
    data['email'] = this.email;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['avatar_url'] = this.avatarUrl;
    if (this.organisations != null) {
      data['organisations'] =
          this.organisations!.map((v) => v.toJson()).toList();
    }
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organisations {
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
        this.isActive});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['email'] = this.email;
    data['industry'] = this.industry;
    data['type'] = this.type;
    data['country'] = this.country;
    data['address'] = this.address;
    data['state'] = this.state;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['owner_id'] = this.ownerId;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Blogs {
  String? id;
  String? title;
  String? imageUrl;
  String? content;
  String? publishedDate;
  String? updatedDate;
  String? authorId;
  Author? author;
  String? category;
  List<Comments>? comments;

  Blogs(
      {this.id,
        this.title,
        this.imageUrl,
        this.content,
        this.publishedDate,
        this.updatedDate,
        this.authorId,
        this.author,
        this.category,
        this.comments});

  Blogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    content = json['content'];
    publishedDate = json['publishedDate'];
    updatedDate = json['updatedDate'];
    authorId = json['authorId'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    category = json['category'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['content'] = this.content;
    data['publishedDate'] = this.publishedDate;
    data['updatedDate'] = this.updatedDate;
    data['authorId'] = this.authorId;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['category'] = this.category;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Author {
  String? id;
  String? firstName;
  String? lastName;
  String? avatarUrl;
  String? email;
  String? phoneNumber;
  String? password;
  String? passwordSalt;
  String? passwordResetToken;
  String? passwordResetTokenTime;
  String? createdAt;
  String? updatedAt;
  Profile? profile;
  bool? isSuperAdmin;
  List<Organizations>? organizations;
  List<Products>? products;
  List<Transactions>? transactions;
  List<Subscriptions>? subscriptions;
  List<String>? blogs;
  List<UsersRoles>? usersRoles;
  List<LastLogins>? lastLogins;
  String? timezoneId;
  Timezone? timezone;

  Author(
      {this.id,
        this.firstName,
        this.lastName,
        this.avatarUrl,
        this.email,
        this.phoneNumber,
        this.password,
        this.passwordSalt,
        this.passwordResetToken,
        this.passwordResetTokenTime,
        this.createdAt,
        this.updatedAt,
        this.profile,
        this.isSuperAdmin,
        this.organizations,
        this.products,
        this.transactions,
        this.subscriptions,
        this.blogs,
        this.usersRoles,
        this.lastLogins,
        this.timezoneId,
        this.timezone});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    avatarUrl = json['avatarUrl'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    passwordSalt = json['passwordSalt'];
    passwordResetToken = json['passwordResetToken'];
    passwordResetTokenTime = json['passwordResetTokenTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    isSuperAdmin = json['isSuperAdmin'];
    if (json['organizations'] != null) {
      organizations = <Organizations>[];
      json['organizations'].forEach((v) {
        organizations!.add(new Organizations.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(new Subscriptions.fromJson(v));
      });
    }
    blogs = json['blogs'].cast<String>();
    if (json['usersRoles'] != null) {
      usersRoles = <UsersRoles>[];
      json['usersRoles'].forEach((v) {
        usersRoles!.add(new UsersRoles.fromJson(v));
      });
    }
    if (json['lastLogins'] != null) {
      lastLogins = <LastLogins>[];
      json['lastLogins'].forEach((v) {
        lastLogins!.add(new LastLogins.fromJson(v));
      });
    }
    timezoneId = json['timezoneId'];
    timezone = json['timezone'] != null
        ? new Timezone.fromJson(json['timezone'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['avatarUrl'] = this.avatarUrl;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['passwordSalt'] = this.passwordSalt;
    data['passwordResetToken'] = this.passwordResetToken;
    data['passwordResetTokenTime'] = this.passwordResetTokenTime;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['isSuperAdmin'] = this.isSuperAdmin;
    if (this.organizations != null) {
      data['organizations'] =
          this.organizations!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    if (this.subscriptions != null) {
      data['subscriptions'] =
          this.subscriptions!.map((v) => v.toJson()).toList();
    }
    data['blogs'] = this.blogs;
    if (this.usersRoles != null) {
      data['usersRoles'] = this.usersRoles!.map((v) => v.toJson()).toList();
    }
    if (this.lastLogins != null) {
      data['lastLogins'] = this.lastLogins!.map((v) => v.toJson()).toList();
    }
    data['timezoneId'] = this.timezoneId;
    if (this.timezone != null) {
      data['timezone'] = this.timezone!.toJson();
    }
    return data;
  }
}

class Profile {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? avatarUrl;
  String? userId;
  String? user;
  String? username;
  String? pronoun;
  String? jobTitle;
  String? bio;
  String? department;
  String? facebookLink;
  String? twitterLink;
  String? linkedinLink;
  String? instagramLink;

  Profile(
      {this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.avatarUrl,
        this.userId,
        this.user,
        this.username,
        this.pronoun,
        this.jobTitle,
        this.bio,
        this.department,
        this.facebookLink,
        this.twitterLink,
        this.linkedinLink,
        this.instagramLink});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    avatarUrl = json['avatarUrl'];
    userId = json['userId'];
    user = json['user'];
    username = json['username'];
    pronoun = json['pronoun'];
    jobTitle = json['jobTitle'];
    bio = json['bio'];
    department = json['department'];
    facebookLink = json['facebookLink'];
    twitterLink = json['twitterLink'];
    linkedinLink = json['linkedinLink'];
    instagramLink = json['instagramLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['avatarUrl'] = this.avatarUrl;
    data['userId'] = this.userId;
    data['user'] = this.user;
    data['username'] = this.username;
    data['pronoun'] = this.pronoun;
    data['jobTitle'] = this.jobTitle;
    data['bio'] = this.bio;
    data['department'] = this.department;
    data['facebookLink'] = this.facebookLink;
    data['twitterLink'] = this.twitterLink;
    data['linkedinLink'] = this.linkedinLink;
    data['instagramLink'] = this.instagramLink;
    return data;
  }
}

class Organizations {
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
  String? inviteToken;
  List<String>? users;
  List<UsersRoles>? usersRoles;
  List<Subscriptions>? subscriptions;

  Organizations(
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
        this.inviteToken,
        this.users,
        this.usersRoles,
        this.subscriptions});

  Organizations.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    ownerId = json['ownerId'];
    isActive = json['isActive'];
    inviteToken = json['inviteToken'];
    users = json['users'].cast<String>();
    if (json['usersRoles'] != null) {
      usersRoles = <UsersRoles>[];
      json['usersRoles'].forEach((v) {
        usersRoles!.add(new UsersRoles.fromJson(v));
      });
    }
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(new Subscriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['email'] = this.email;
    data['industry'] = this.industry;
    data['type'] = this.type;
    data['country'] = this.country;
    data['address'] = this.address;
    data['state'] = this.state;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['ownerId'] = this.ownerId;
    data['isActive'] = this.isActive;
    data['inviteToken'] = this.inviteToken;
    data['users'] = this.users;
    if (this.usersRoles != null) {
      data['usersRoles'] = this.usersRoles!.map((v) => v.toJson()).toList();
    }
    if (this.subscriptions != null) {
      data['subscriptions'] =
          this.subscriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UsersRoles {
  String? id;
  String? userId;
  String? roleId;
  String? organizationId;
  String? user;
  Role? role;
  String? orgainzation;

  UsersRoles(
      {this.id,
        this.userId,
        this.roleId,
        this.organizationId,
        this.user,
        this.role,
        this.orgainzation});

  UsersRoles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    roleId = json['roleId'];
    organizationId = json['organizationId'];
    user = json['user'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    orgainzation = json['orgainzation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['roleId'] = this.roleId;
    data['organizationId'] = this.organizationId;
    data['user'] = this.user;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['orgainzation'] = this.orgainzation;
    return data;
  }
}

class Role {
  String? id;
  String? name;
  String? description;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? organizationId;
  String? organisation;
  List<Permissions>? permissions;
  List<String>? usersRoles;

  Role(
      {this.id,
        this.name,
        this.description,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.organizationId,
        this.organisation,
        this.permissions,
        this.usersRoles});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    organizationId = json['organizationId'];
    organisation = json['organisation'];
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add(new Permissions.fromJson(v));
      });
    }
    usersRoles = json['usersRoles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['organizationId'] = this.organizationId;
    data['organisation'] = this.organisation;
    if (this.permissions != null) {
      data['permissions'] = this.permissions!.map((v) => v.toJson()).toList();
    }
    data['usersRoles'] = this.usersRoles;
    return data;
  }
}

class Permissions {
  String? id;
  String? name;
  String? description;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<String>? roles;

  Permissions(
      {this.id,
        this.name,
        this.description,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.roles});

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['roles'] = this.roles;
    return data;
  }
}

class Subscriptions {
  String? id;
  String? userId;
  String? user;
  String? organizationId;
  String? organization;
  String? transactionId;
  String? transaction;
  String? billingPlanId;
  BillingPlan? billingPlan;
  String? plan;
  String? frequency;
  bool? isActive;
  num? amount;
  String? startDate;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;

  Subscriptions(
      {this.id,
        this.userId,
        this.user,
        this.organizationId,
        this.organization,
        this.transactionId,
        this.transaction,
        this.billingPlanId,
        this.billingPlan,
        this.plan,
        this.frequency,
        this.isActive,
        this.amount,
        this.startDate,
        this.expiryDate,
        this.createdAt,
        this.updatedAt});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    user = json['user'];
    organizationId = json['organizationId'];
    organization = json['organization'];
    transactionId = json['transactionId'];
    transaction = json['transaction'];
    billingPlanId = json['billingPlanId'];
    billingPlan = json['billingPlan'] != null
        ? new BillingPlan.fromJson(json['billingPlan'])
        : null;
    plan = json['plan'];
    frequency = json['frequency'];
    isActive = json['isActive'];
    amount = json['amount'];
    startDate = json['startDate'];
    expiryDate = json['expiryDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['user'] = this.user;
    data['organizationId'] = this.organizationId;
    data['organization'] = this.organization;
    data['transactionId'] = this.transactionId;
    data['transaction'] = this.transaction;
    data['billingPlanId'] = this.billingPlanId;
    if (this.billingPlan != null) {
      data['billingPlan'] = this.billingPlan!.toJson();
    }
    data['plan'] = this.plan;
    data['frequency'] = this.frequency;
    data['isActive'] = this.isActive;
    data['amount'] = this.amount;
    data['startDate'] = this.startDate;
    data['expiryDate'] = this.expiryDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class BillingPlan {
  String? id;
  String? name;
  String? frequency;
  bool? isActive;
  num? amount;
  String? description;
  String? createdAt;
  String? updatedAt;

  BillingPlan(
      {this.id,
        this.name,
        this.frequency,
        this.isActive,
        this.amount,
        this.description,
        this.createdAt,
        this.updatedAt});

  BillingPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    frequency = json['frequency'];
    isActive = json['isActive'];
    amount = json['amount'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['frequency'] = this.frequency;
    data['isActive'] = this.isActive;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Products {
  String? id;
  String? name;
  String? description;
  String? category;
  num? price;
  bool? available;
  String? userId;
  String? user;
  String? status;
  String? imageUrl;
  String? size;
  num? quantity;
  String? organizationId;
  Organizations? organization;
  String? createdAt;
  String? updatedAt;
  List<Transactions>? transactions;

  Products(
      {this.id,
        this.name,
        this.description,
        this.category,
        this.price,
        this.available,
        this.userId,
        this.user,
        this.status,
        this.imageUrl,
        this.size,
        this.quantity,
        this.organizationId,
        this.organization,
        this.createdAt,
        this.updatedAt,
        this.transactions});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    available = json['available'];
    userId = json['userId'];
    user = json['user'];
    status = json['status'];
    imageUrl = json['imageUrl'];
    size = json['size'];
    quantity = json['quantity'];
    organizationId = json['organizationId'];
    organization = json['organization'] != null
        ? new Organizations.fromJson(json['organization'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category'] = this.category;
    data['price'] = this.price;
    data['available'] = this.available;
    data['userId'] = this.userId;
    data['user'] = this.user;
    data['status'] = this.status;
    data['imageUrl'] = this.imageUrl;
    data['size'] = this.size;
    data['quantity'] = this.quantity;
    data['organizationId'] = this.organizationId;
    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? id;
  String? userId;
  String? user;
  String? productId;
  String? product;
  String? subscriptionId;
  Subscriptions? subscription;
  String? type;
  String? status;
  String? partners;
  num? amount;
  String? reference;
  String? createdAt;
  String? paidAt;
  String? modifiedAt;

  Transactions(
      {this.id,
        this.userId,
        this.user,
        this.productId,
        this.product,
        this.subscriptionId,
        this.subscription,
        this.type,
        this.status,
        this.partners,
        this.amount,
        this.reference,
        this.createdAt,
        this.paidAt,
        this.modifiedAt});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    user = json['user'];
    productId = json['productId'];
    product = json['product'];
    subscriptionId = json['subscriptionId'];
    subscription = json['subscription'] != null
        ? new Subscriptions.fromJson(json['subscription'])
        : null;
    type = json['type'];
    status = json['status'];
    partners = json['partners'];
    amount = json['amount'];
    reference = json['reference'];
    createdAt = json['createdAt'];
    paidAt = json['paidAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['user'] = this.user;
    data['productId'] = this.productId;
    data['product'] = this.product;
    data['subscriptionId'] = this.subscriptionId;
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    data['type'] = this.type;
    data['status'] = this.status;
    data['partners'] = this.partners;
    data['amount'] = this.amount;
    data['reference'] = this.reference;
    data['createdAt'] = this.createdAt;
    data['paidAt'] = this.paidAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}

class LastLogins {
  String? id;
  String? userId;
  String? user;
  String? loginTime;
  String? logoutTime;
  String? ipAddress;

  LastLogins(
      {this.id,
        this.userId,
        this.user,
        this.loginTime,
        this.logoutTime,
        this.ipAddress});

  LastLogins.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    user = json['user'];
    loginTime = json['loginTime'];
    logoutTime = json['logoutTime'];
    ipAddress = json['ipAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['user'] = this.user;
    data['loginTime'] = this.loginTime;
    data['logoutTime'] = this.logoutTime;
    data['ipAddress'] = this.ipAddress;
    return data;
  }
}

class Timezone {
  String? id;
  String? timezoneValue;
  String? gmtOffset;
  String? description;

  Timezone({this.id, this.timezoneValue, this.gmtOffset, this.description});

  Timezone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timezoneValue = json['timezoneValue'];
    gmtOffset = json['gmtOffset'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timezoneValue'] = this.timezoneValue;
    data['gmtOffset'] = this.gmtOffset;
    data['description'] = this.description;
    return data;
  }
}

class Comments {
  String? id;
  String? content;
  String? blogId;
  String? blog;
  String? authorId;
  Author? author;
  String? createdAt;

  Comments(
      {this.id,
        this.content,
        this.blogId,
        this.blog,
        this.authorId,
        this.author,
        this.createdAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    blogId = json['blogId'];
    blog = json['blog'];
    authorId = json['authorId'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['blogId'] = this.blogId;
    data['blog'] = this.blog;
    data['authorId'] = this.authorId;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}
