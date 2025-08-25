class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? json['first_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? json['mobile_number'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'token': token,
    };
  }
}
