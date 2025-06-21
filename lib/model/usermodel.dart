class UserModel {
  String? uid;
  String? email;
  bool? status;
  String? profileImage;
  int? lastseen;

  UserModel({
    this.uid,
    this.status,
    this.lastseen,
    this.email,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      lastseen: json['lastseen'] ?? '',
      status: json['status'] ?? false, // ✅ Fixed: fallback as bool
      email: json['email'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'lastseen': lastseen,
      'status': status,
      'email': email,
      'profileImage': profileImage,
    };
  }

  UserModel copywith({
    String? email,
    int? lastseen,
    String? uid,
    bool? status,
    String? profileImage,
  }) {
    return UserModel(
      email: email ?? this.email,
      status: status ?? this.status,
      lastseen: lastseen ?? this.lastseen,
      uid: uid ?? this.uid,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
