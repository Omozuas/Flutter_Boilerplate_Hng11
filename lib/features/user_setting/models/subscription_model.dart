class SubscriptionModel {
  final String id;
  final String userId;
  final String organizationId;
  final String transactionId;
  final SubscriptionPlan plan;
  final String frequency;
  final bool isActive;
  final int amount;
  final DateTime? createdAt;
  final DateTime? startDate;
  final DateTime? expiryDate;
  final DateTime? updatedAt;

  SubscriptionModel({
    required this.id,
    required this.userId,
    required this.organizationId,
    required this.transactionId,
    required this.plan,
    required this.frequency,
    required this.isActive,
    required this.amount,
    required this.startDate,
    required this.expiryDate,
    required this.createdAt,
    required this.updatedAt,
  });

  SubscriptionModel copyWith({
    String? id,
    String? userId,
    String? organizationId,
    String? transactionId,
    SubscriptionPlan? plan,
    String? frequency,
    bool? isActive,
    int? amount,
    DateTime? startDate,
    DateTime? expiryDate,
    DateTime? createdAt,
    dynamic updatedAt,
  }) {
    return SubscriptionModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      transactionId: transactionId ?? this.transactionId,
      plan: plan ?? this.plan,
      frequency: frequency ?? this.frequency,
      isActive: isActive ?? this.isActive,
      amount: amount ?? this.amount,
      startDate: startDate ?? this.startDate,
      expiryDate: expiryDate ?? this.expiryDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory SubscriptionModel.fromMap(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json["id"] as String,
        userId: json["userId"] as String,
        organizationId: json["organizationId"] as String,
        transactionId: json["transactionId"] as String,
        plan: SubscriptionPlan.fromString(json["plan"]),
        frequency: json["frequency"] as String,
        isActive: json["isActive"] ?? false,
        amount: int.tryParse(json["amount"].toString()) ?? 0,
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        startDate: DateTime.tryParse(json["startDate"] ?? ''),
        expiryDate: DateTime.tryParse(json["expiryDate"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  @override
  bool operator ==(covariant SubscriptionModel other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

enum SubscriptionPlan {
  free('Free'),
  basic('Basic'),
  advanced('Advanced');

  const SubscriptionPlan(this.text);
  final String text;

  factory SubscriptionPlan.fromString(String data) {
    return SubscriptionPlan.values.firstWhere(
      (val) => val.text.toLowerCase() == data.toLowerCase(),
      orElse: () => SubscriptionPlan.free,
    );
  }
}

extension SubExtension on SubscriptionPlan {
  int get amount {
    return switch (this) {
      SubscriptionPlan.free => 0,
      SubscriptionPlan.basic => 20,
      SubscriptionPlan.advanced => 50,
    };
  }

  String get frequency => 'month';

  String get about {
    return switch (this) {
      SubscriptionPlan.free =>
        'The essential to provide\nyour best work for clients.',
      SubscriptionPlan.basic =>
        'Ideal for growing needs\nwho want more features.',
      SubscriptionPlan.advanced =>
        'Designed for power users\nand maxium functionality',
    };
  }

  List<String> get bulletDescriptions {
    return switch (this) {
      SubscriptionPlan.free => [
          '10 projects',
          'Up to 10 subscribers',
          'Advanced analytics',
        ],
      SubscriptionPlan.basic => [
          '100 projects',
          'Up to 50 subscribers',
          'Advanced analytics',
          '24-hour support',
        ],
      SubscriptionPlan.advanced => [
          '200 projects',
          'Up to 50 subscribers',
          'Advanced analytics',
          '24-hour support',
          'Marketing advisor',
        ],
    };
  }

  String get description {
    return switch (this) {
      SubscriptionPlan.free =>
        'Your account is on a free 90-day trial of our Free plan, through October 27th. Upgrade anytime to stay on this plan when your trial ends.',
      SubscriptionPlan.basic =>
        'You\'re currently enjoying the benefits of our Basic plan. Your subscription will auto-renew on the 30th of September 2024',
      SubscriptionPlan.advanced =>
        'You\'re currently enjoying the benefits of our Advanced plan. Your subscription will auto-renew on the 30th of September 2024',
    };
  }

  List<(String, List<(String, Object)>)> get details {
    return switch (this) {
      SubscriptionPlan.free => [
          (
            'Project Management',
            [
              ('Projects', 'Up to 10'),
              ('File Upload', '10gb'),
              ('User Account', '1'),
              ('Teams', '1'),
            ],
          ),
          (
            'Sharing and collaboration',
            [
              ('Integration', true),
              ('Guest Access', true),
              ('Page Analysis', true),
              ('Task Management', true),
            ],
          ),
          (
            'Support',
            [
              ('Priority Support', true),
              ('Customer Support', false),
            ],
          ),
        ],
      SubscriptionPlan.basic => [
          (
            'Project Management',
            [
              ('Projects', 'Up to 100'),
              ('File Upload', '20gb'),
              ('User Account', '10'),
              ('Teams', 'Unlimited'),
            ],
          ),
          (
            'Sharing and collaboration',
            [
              ('Integration', true),
              ('Guest Access', true),
              ('Page Analysis', true),
              ('Task Management', true),
            ],
          ),
          (
            'Management and security',
            [
              ('Team Security', true),
              ('Data Backup', true),
              ('HIPAA Compliance', true),
            ],
          ),
          (
            'Support',
            [
              ('Priority Support', true),
              ('Customer Support', true),
            ],
          ),
        ],
      SubscriptionPlan.advanced => [
          (
            'Project Management',
            [
              ('Projects', 'Up to 200'),
              ('File Upload', '50gb'),
              ('User Account', '50'),
              ('Teams', 'Unlimited'),
            ],
          ),
          (
            'Sharing and collaboration',
            [
              ('Integration', true),
              ('Guest Access', true),
              ('Page Analysis', true),
              ('Task Management', true),
            ],
          ),
          (
            'Management and security',
            [
              ('Team Security', true),
              ('Data Backup', true),
              ('HIPAA Compliance', true),
            ],
          ),
          (
            'Support',
            [
              ('Priority Support', true),
              ('Customer Support', true),
            ],
          ),
        ],
    };
  }
}
