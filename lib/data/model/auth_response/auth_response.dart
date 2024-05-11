/// status : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MWYwNTgwNGYxNjdjZDgwOTNjNzgwNiIsImlhdCI6MTcxMzMxMDMwMiwiZXhwIjoxNzIxMDg2MzAyfQ.jUoly0ead3FOUzAJpSj285lDGk0AIy3ecFZDBAG2BGU"
/// data : {"user":{"photo":{"url":"default.jpg","publicId":null},"_id":"661f05804f167cd8093c7806","name":"meslhy","email":"meslhy@email.com","phone":"01027734183","__v":0,"id":"661f05804f167cd8093c7806"}}

class AuthResponse {
  AuthResponse({
      this.status, 
      this.token, 
      this.data,
    this.message
  });

  AuthResponse.fromJson(dynamic json) {
    status = json['status'];
    token = json['token'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? token;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['token'] = token;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// user : {"photo":{"url":"default.jpg","publicId":null},"_id":"661f05804f167cd8093c7806","name":"meslhy","email":"meslhy@email.com","phone":"01027734183","__v":0,"id":"661f05804f167cd8093c7806"}

class Data {
  Data({
      this.user,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

/// photo : {"url":"default.jpg","publicId":null}
/// _id : "661f05804f167cd8093c7806"
/// name : "meslhy"
/// email : "meslhy@email.com"
/// phone : "01027734183"
/// __v : 0
/// id : "661f05804f167cd8093c7806"

class User {
  User({
      this.photo, 
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.v,
  });

  User.fromJson(dynamic json) {
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    v = json['__v'];
    id = json['id'];
  }
  Photo? photo;
  String? id;
  String? name;
  String? email;
  String? phone;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (photo != null) {
      map['photo'] = photo?.toJson();
    }
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['__v'] = v;
    map['id'] = id;
    return map;
  }

}

/// url : "default.jpg"
/// publicId : null

class Photo {
  Photo({
      this.url, 
      this.publicId,});

  Photo.fromJson(dynamic json) {
    url = json['url'];
    publicId = json['publicId'];
  }
  String? url;
  dynamic publicId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['publicId'] = publicId;
    return map;
  }

}