class UserModel {
  String? userId, name, email, profilePic;
  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.profilePic,
  });

  UserModel.fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    name = map['name'];
    email = map['email'];
    profilePic = map['profilePic'];
  }

  toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'profilePic': profilePic,
    };
  }
}
