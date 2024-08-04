import '../home_responses/posts_response.dart';

/// status : "success"
/// posts : 4
/// data : {"data":{"photo":{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715629118/fjvgt9e0bfphclnznh7h.jpg","publicId":"fjvgt9e0bfphclnznh7h"},"_id":"65cfc72cf784130afbaa69e1","name":"mona ali","email":"monaali@gmail.com","phone":"01027734182","__v":0,"posts":[{"_id":"66413fb9335155d1aca451a0","content":"فوستان مقاس ميديم بحاله جيدة","images":[{"publicId":"rdnjopr2h6lugcnobxfp","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715552185/rdnjopr2h6lugcnobxfp.png","_id":"66413fb9335155d1aca451a1"}],"createdAt":"2024-05-12T20:45:31.837Z","location":"شارع ابو عوض، أبو كبير، مركز أبو كبير\n، محافظة الشرقية ","category":"ملابس","price":0,"__v":0},{"_id":"66414029335155d1aca451a7","content":"ماكينة خياطه بالماتور من سنجار بحاله متوسطة","images":[{"publicId":"vktz0az0xxfa1rcaz8pg","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715552297/vktz0az0xxfa1rcaz8pg.png","_id":"66414029335155d1aca451a8"}],"createdAt":"2024-05-12T20:45:31.837Z","location":"شارع ابو عوض، أبو كبير، مركز أبو كبير\n، محافظة الشرقية ","category":"أجهزة منزلية","price":0,"__v":0},{"_id":"66425f7e0f48d661927128d2","content":"طقم حلل جديد ل اي عروسه جديده","images":[{"publicId":"x2klnw5g6lbpgegdutkv","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715625853/x2klnw5g6lbpgegdutkv.png","_id":"66425f7e0f48d661927128d3"}],"createdAt":"2024-05-13T18:38:17.025Z","location":"شبين الكوم محافظة المنوفية","category":"أجهزة منزلية","price":0,"__v":0},{"_id":"66426d4fc1195c91476545b4","content":"ثلاجه 12 قدم بحاله جيده ","images":[{"publicId":"vata3vk0avfgi51hftdq","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715629391/vata3vk0avfgi51hftdq.png","_id":"66426d4fc1195c91476545b5"}],"createdAt":"2024-05-13T19:37:15.397Z","location":"شبين الكوم محافظة المنوفية","category":"أجهزة منزلية","price":0,"__v":0}],"id":"65cfc72cf784130afbaa69e1"}}

class ProfileResponse {
  ProfileResponse({
      this.status, 
      this.posts, 
      this.data,});

  ProfileResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    posts = json['posts'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  int? posts;
  ProfileData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['posts'] = posts;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// data : {"photo":{"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715629118/fjvgt9e0bfphclnznh7h.jpg","publicId":"fjvgt9e0bfphclnznh7h"},"_id":"65cfc72cf784130afbaa69e1","name":"mona ali","email":"monaali@gmail.com","phone":"01027734182","__v":0,"posts":[{"_id":"66413fb9335155d1aca451a0","content":"فوستان مقاس ميديم بحاله جيدة","images":[{"publicId":"rdnjopr2h6lugcnobxfp","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715552185/rdnjopr2h6lugcnobxfp.png","_id":"66413fb9335155d1aca451a1"}],"createdAt":"2024-05-12T20:45:31.837Z","location":"شارع ابو عوض، أبو كبير، مركز أبو كبير\n، محافظة الشرقية ","category":"ملابس","price":0,"__v":0},{"_id":"66414029335155d1aca451a7","content":"ماكينة خياطه بالماتور من سنجار بحاله متوسطة","images":[{"publicId":"vktz0az0xxfa1rcaz8pg","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715552297/vktz0az0xxfa1rcaz8pg.png","_id":"66414029335155d1aca451a8"}],"createdAt":"2024-05-12T20:45:31.837Z","location":"شارع ابو عوض، أبو كبير، مركز أبو كبير\n، محافظة الشرقية ","category":"أجهزة منزلية","price":0,"__v":0},{"_id":"66425f7e0f48d661927128d2","content":"طقم حلل جديد ل اي عروسه جديده","images":[{"publicId":"x2klnw5g6lbpgegdutkv","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715625853/x2klnw5g6lbpgegdutkv.png","_id":"66425f7e0f48d661927128d3"}],"createdAt":"2024-05-13T18:38:17.025Z","location":"شبين الكوم محافظة المنوفية","category":"أجهزة منزلية","price":0,"__v":0},{"_id":"66426d4fc1195c91476545b4","content":"ثلاجه 12 قدم بحاله جيده ","images":[{"publicId":"vata3vk0avfgi51hftdq","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715629391/vata3vk0avfgi51hftdq.png","_id":"66426d4fc1195c91476545b5"}],"createdAt":"2024-05-13T19:37:15.397Z","location":"شبين الكوم محافظة المنوفية","category":"أجهزة منزلية","price":0,"__v":0}],"id":"65cfc72cf784130afbaa69e1"}

class ProfileData {
  ProfileData({
      this.data,});

  ProfileData.fromJson(dynamic json) {
    data = json['data'] != null ? ProfileDataDetails.fromJson(json['data']) : null;
  }
  ProfileDataDetails? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// photo : {"url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715629118/fjvgt9e0bfphclnznh7h.jpg","publicId":"fjvgt9e0bfphclnznh7h"}
/// _id : "65cfc72cf784130afbaa69e1"
/// name : "mona ali"
/// email : "monaali@gmail.com"
/// phone : "01027734182"
/// __v : 0
/// posts : [{"_id":"66413fb9335155d1aca451a0","content":"فوستان مقاس ميديم بحاله جيدة","images":[{"publicId":"rdnjopr2h6lugcnobxfp","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715552185/rdnjopr2h6lugcnobxfp.png","_id":"66413fb9335155d1aca451a1"}],"createdAt":"2024-05-12T20:45:31.837Z","location":"شارع ابو عوض، أبو كبير، مركز أبو كبير\n، محافظة الشرقية ","category":"ملابس","price":0,"__v":0},{"_id":"66414029335155d1aca451a7","content":"ماكينة خياطه بالماتور من سنجار بحاله متوسطة","images":[{"publicId":"vktz0az0xxfa1rcaz8pg","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715552297/vktz0az0xxfa1rcaz8pg.png","_id":"66414029335155d1aca451a8"}],"createdAt":"2024-05-12T20:45:31.837Z","location":"شارع ابو عوض، أبو كبير، مركز أبو كبير\n، محافظة الشرقية ","category":"أجهزة منزلية","price":0,"__v":0},{"_id":"66425f7e0f48d661927128d2","content":"طقم حلل جديد ل اي عروسه جديده","images":[{"publicId":"x2klnw5g6lbpgegdutkv","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715625853/x2klnw5g6lbpgegdutkv.png","_id":"66425f7e0f48d661927128d3"}],"createdAt":"2024-05-13T18:38:17.025Z","location":"شبين الكوم محافظة المنوفية","category":"أجهزة منزلية","price":0,"__v":0},{"_id":"66426d4fc1195c91476545b4","content":"ثلاجه 12 قدم بحاله جيده ","images":[{"publicId":"vata3vk0avfgi51hftdq","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715629391/vata3vk0avfgi51hftdq.png","_id":"66426d4fc1195c91476545b5"}],"createdAt":"2024-05-13T19:37:15.397Z","location":"شبين الكوم محافظة المنوفية","category":"أجهزة منزلية","price":0,"__v":0}]
/// id : "65cfc72cf784130afbaa69e1"

class ProfileDataDetails {
  ProfileDataDetails({
      this.photo, 
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.v, 
      this.posts, 
  });

  ProfileDataDetails.fromJson(dynamic json) {
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    v = json['__v'];
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts?.add(Posts.fromJson(v));
      });
    }
    id = json['id'];
  }
  Photo? photo;
  String? id;
  String? name;
  String? email;
  String? phone;
  int? v;
  List<Posts>? posts;

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
    if (posts != null) {
      map['posts'] = posts?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    return map;
  }

}

/// _id : "66413fb9335155d1aca451a0"
/// content : "فوستان مقاس ميديم بحاله جيدة"
/// images : [{"publicId":"rdnjopr2h6lugcnobxfp","url":"https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715552185/rdnjopr2h6lugcnobxfp.png","_id":"66413fb9335155d1aca451a1"}]
/// createdAt : "2024-05-12T20:45:31.837Z"
/// location : "شارع ابو عوض، أبو كبير، مركز أبو كبير\n، محافظة الشرقية "
/// category : "ملابس"
/// price : 0
/// __v : 0


/// publicId : "rdnjopr2h6lugcnobxfp"
/// url : "https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715552185/rdnjopr2h6lugcnobxfp.png"
/// _id : "66413fb9335155d1aca451a1"

class Images {
  Images({
      this.publicId, 
      this.url, 
      this.id,});

  Images.fromJson(dynamic json) {
    publicId = json['publicId'];
    url = json['url'];
    id = json['_id'];
  }
  String? publicId;
  String? url;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['publicId'] = publicId;
    map['url'] = url;
    map['_id'] = id;
    return map;
  }

}

/// url : "https://res.cloudinary.com/dbpf3rtg9/image/upload/v1715629118/fjvgt9e0bfphclnznh7h.jpg"
/// publicId : "fjvgt9e0bfphclnznh7h"

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