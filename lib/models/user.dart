class UserModel {
  String username;
  String uID;
  String email;
  String password;
  String address;
  String profilePic;

  UserModel({
    this.username,
    this.email,
    this.password,
    this.address,
    this.uID,
    this.profilePic,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': username,
      'uID': uID,
      'email': email,
      'password': password,
      'address': address,
      'profilePic': profilePic,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      username: map['userName'],
      uID: map['uID'],
      email: map['email'] ?? '',
      profilePic: map['profilePic'],
      password: map['password'],
      address: map['address'],
    );
  }
}
