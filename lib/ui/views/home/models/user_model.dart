class UserModel {
  final String userId;
  final String? fullName;
  final num? cgpa;
  final String email;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.cgpa,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json['user_id'],
        fullName: json['full_name'],
        cgpa: json['current_cgpa'] ?? 0.0,
        email: json['email'],
      );
}
