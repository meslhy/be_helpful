/// status : "success"
/// results : 5
/// page : 1
/// posts : [{"price":0,"_id":"65cfcd35336294270e444611","content":"مرايا ","images":[{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1708117298/sw3x7flgtrjbzjcddoec.jpg","publicId":"sw3x7flgtrjbzjcddoec","_id":"65cfcd35336294270e444612"},{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1708117299/roiqshxevdtr3yjoqnoy.jpg","publicId":"roiqshxevdtr3yjoqnoy","_id":"65cfcd35336294270e444613"}],"createdAt":"2024-02-16T20:49:28.455Z","user":{"photo":{"url":"https://res.cloudinary.com/dteurgaig/image/upload/v1708185204/jlclnenzg23zmjrfqjwb.jpg","publicId":"jlclnenzg23zmjrfqjwb"},"_id":"65cfc72cf784130afbaa69e1","name":"tester1","phone":"01027734183","id":"65cfc72cf784130afbaa69e1"},"location":"زويه ","category":"ملابس","__v":0},{"price":0,"_id":"65cfce36336294270e44461a","content":"مرايا ازاز","images":[{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1708117557/j6tn4uewo6otyevwgfbj.jpg","publicId":"j6tn4uewo6otyevwgfbj","_id":"65cfce36336294270e44461b"}],"createdAt":"2024-02-16T20:49:28.455Z","user":{"photo":{"url":"https://res.cloudinary.com/dteurgaig/image/upload/v1708185204/jlclnenzg23zmjrfqjwb.jpg","publicId":"jlclnenzg23zmjrfqjwb"},"_id":"65cfc72cf784130afbaa69e1","name":"tester1","phone":"01027734183","id":"65cfc72cf784130afbaa69e1"},"location":"زويه ","category":"ديكور وأثاث","__v":0},{"price":0,"_id":"65cfce81336294270e444622","content":"مرايا مش ازاز","images":[{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1708117631/hltunbptrtcw62qugsrm.jpg","publicId":"hltunbptrtcw62qugsrm","_id":"65cfce81336294270e444623"},{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1708117632/iatystksoerjoil9of3n.jpg","publicId":"iatystksoerjoil9of3n","_id":"65cfce81336294270e444624"}],"createdAt":"2024-02-16T20:49:28.455Z","user":{"photo":{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1713120136/shwvncspbpdwxz4jqszd.jpg","publicId":"shwvncspbpdwxz4jqszd"},"_id":"65cfc73af784130afbaa69e4","name":"tester2","phone":"01027734183","id":"65cfc73af784130afbaa69e4"},"location":"زويه ","category":"ترفيه و تسلية","__v":0},{"price":0,"_id":"65cfcec3336294270e44462b","content":"لعبه","images":[{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1708117698/w8jxfunxtlbc2ymmfhdr.jpg","publicId":"w8jxfunxtlbc2ymmfhdr","_id":"65cfcec3336294270e44462c"}],"createdAt":"2024-02-16T20:49:28.455Z","user":{"photo":{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1713120136/shwvncspbpdwxz4jqszd.jpg","publicId":"shwvncspbpdwxz4jqszd"},"_id":"65cfc73af784130afbaa69e4","name":"tester2","phone":"01027734183","id":"65cfc73af784130afbaa69e4"},"location":"زويه ","category":"أخري","__v":0},{"_id":"65d2754bcbf8c27f6cb6f38b","content":"لعبه","images":[{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1708291403/plub3ghxbhs7qadq343w.jpg","publicId":"plub3ghxbhs7qadq343w","_id":"65d2754bcbf8c27f6cb6f38c"}],"createdAt":"2024-02-18T21:21:58.154Z","user":{"photo":{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1713120136/shwvncspbpdwxz4jqszd.jpg","publicId":"shwvncspbpdwxz4jqszd"},"_id":"65cfc73af784130afbaa69e4","name":"tester2","phone":"01027734183","id":"65cfc73af784130afbaa69e4"},"location":"زويه ","category":"أخري","price":5,"__v":0}]

class PostsResponse {
  PostsResponse({
      this.status, 
      this.results, 
      this.page, 
      this.posts,
    this.message
  });

  PostsResponse.fromJson(dynamic json) {
    status = json['status'];
    results = json['results'];
    page = json['page'];
    message = json['message'];
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts?.add(Posts.fromJson(v));
      });
    }
  }
  String? status;
  int? results;
  int? page;
  List<Posts>? posts;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['results'] = results;
    map['page'] = page;
    map['message'] = message;
    if (posts != null) {
      map['posts'] = posts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// price : 0
/// _id : "65cfcd35336294270e444611"
/// content : "مرايا "
/// images : [{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1708117298/sw3x7flgtrjbzjcddoec.jpg","publicId":"sw3x7flgtrjbzjcddoec","_id":"65cfcd35336294270e444612"},{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1708117299/roiqshxevdtr3yjoqnoy.jpg","publicId":"roiqshxevdtr3yjoqnoy","_id":"65cfcd35336294270e444613"}]
/// createdAt : "2024-02-16T20:49:28.455Z"
/// user : {"photo":{"url":"https://res.cloudinary.com/dteurgaig/image/upload/v1708185204/jlclnenzg23zmjrfqjwb.jpg","publicId":"jlclnenzg23zmjrfqjwb"},"_id":"65cfc72cf784130afbaa69e1","name":"tester1","phone":"01027734183","id":"65cfc72cf784130afbaa69e1"}
/// location : "زويه "
/// category : "ملابس"
/// __v : 0

class Posts {
  Posts({
      this.price, 
      this.id, 
      this.content, 
      this.images, 
      this.createdAt, 
      this.user, 
      this.location, 
      this.category, 
      this.v,});

  Posts.fromJson(dynamic json) {
    price = json['price'];
    id = json['_id'];
    content = json['content'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    location = json['location'];
    category = json['category'];
    v = json['__v'];
  }
  int? price;
  String? id;
  String? content;
  List<Images>? images;
  String? createdAt;
  User? user;
  String? location;
  String? category;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['_id'] = id;
    map['content'] = content;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['location'] = location;
    map['category'] = category;
    map['__v'] = v;
    return map;
  }

}

/// photo : {"url":"https://res.cloudinary.com/dteurgaig/image/upload/v1708185204/jlclnenzg23zmjrfqjwb.jpg","publicId":"jlclnenzg23zmjrfqjwb"}
/// _id : "65cfc72cf784130afbaa69e1"
/// name : "tester1"
/// phone : "01027734183"
/// id : "65cfc72cf784130afbaa69e1"

class User {
  User({
      this.photo, 
      this.id, 
      this.name, 
      this.phone,});

  User.fromJson(dynamic json) {
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
  }
  Photo? photo;
  String? id;
  String? name;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (photo != null) {
      map['photo'] = photo?.toJson();
    }
    map['_id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dteurgaig/image/upload/v1708185204/jlclnenzg23zmjrfqjwb.jpg"
/// publicId : "jlclnenzg23zmjrfqjwb"

class Photo {
  Photo({
      this.url, 
      this.publicId,});

  Photo.fromJson(dynamic json) {
    url = json['url'];
    publicId = json['publicId'];
  }
  String? url;
  String? publicId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['publicId'] = publicId;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dbpf3rtg9/image/upload/v1708117298/sw3x7flgtrjbzjcddoec.jpg"
/// publicId : "sw3x7flgtrjbzjcddoec"
/// _id : "65cfcd35336294270e444612"

class Images {
  Images({
      this.url, 
      this.publicId, 
      this.id,});

  Images.fromJson(dynamic json) {
    url = json['url'];
    publicId = json['publicId'];
    id = json['_id'];
  }
  String? url;
  String? publicId;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['publicId'] = publicId;
    map['_id'] = id;
    return map;
  }

}