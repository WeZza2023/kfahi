class UserModel {
  String? phone;
  String? profile;
  String? first;
  String? email;

  UserModel({this.phone, this.profile, this.first, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    profile = json['profile'];
    first = json['first'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['profile'] = this.profile;
    data['first'] = this.first;
    data['email'] = this.email;
    return data;
  }
}
