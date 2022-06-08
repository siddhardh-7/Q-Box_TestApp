class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? profileImageUrl;

  UserModel({this.firstName, this.lastName, this.email, this.profileImageUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    profileImageUrl = json['profileImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['profileImageUrl'] = this.profileImageUrl;
    return data;
  }
}
