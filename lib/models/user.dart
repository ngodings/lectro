class DataUser {
  int? id;
  String? username;
  String? email;
  String? fullName;
  String? about;
  String? address;
  String? phone;
  String? avatar;
  int? status;
  String? createdAt;
  String? updatedAt;

  DataUser(
      {this.id,
      this.username,
      this.email,
      this.fullName,
      this.about,
      this.address,
      this.phone,
      this.avatar,
      this.status,
      this.createdAt,
      this.updatedAt});

  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    fullName = json['full_name'];
    about = json['about'];
    address = json['address'];
    phone = json['phone'];
    avatar = json['avatar'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['full_name'] = fullName;
    data['about'] = about;
    data['address'] = address;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ResponseSignUp {
  String? notice;
  int? timestamp;

  ResponseSignUp({
    this.notice,
    this.timestamp,
  });

  ResponseSignUp.fromJson(Map<String, dynamic> json) {
    notice = json['notice'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notice'] = notice;
    data['timestamp'] = timestamp;
    return data;
  }
}
