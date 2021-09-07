class UserModel {
  String? userId;
  String? userFirstName;
  String? userLastName;
  String? userEmail;
  String? userPassword;

  UserModel(
      {this.userId,
      this.userFirstName,
      this.userLastName,
      this.userEmail,
      this.userPassword});

  UserModel.fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    userFirstName = map['userFirstName'];
    userLastName = map['userLastName'];
    userEmail = map['userEmail'];
    userPassword = map['userPassword'];
  }

  toJson() {
    return {
      'userId': userId,
      'userFirstName': userFirstName,
      'userLastName': userLastName,
      'userEmail': userEmail,
      'userPassword': userPassword,
    };
  }
}
