import 'dart:convert';
import 'dart:io';

import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/data/model/home_responses/posts_response.dart';
import 'package:be_helpful/data/utils/shared_utils.dart';
import 'package:be_helpful/domain/repos/home_repo/ds/home_online_ds.dart';
import 'package:be_helpful/ui/utils/constants.dart';
import 'package:be_helpful/ui/utils/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeOnlineDS)
class HomeOnlineDSImpl extends HomeOnlineDS{

  // SharedPrefsUtils sharedPrefsUtils;
  //
  // HomeOnlineDSImpl(this.sharedPrefsUtils);
  @override
  Future<Either<Failuer, PostsResponse>> getAllPosts() async{
    try{
      Uri url = Uri.https(EndPoints.baseUrl,EndPoints.allPosts);
      Response serverResponse = await get(url);
      PostsResponse postsResponse = PostsResponse.fromJson(jsonDecode(serverResponse.body));

      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 ){
        return right(postsResponse);
      }else{
        return left(Failuer(postsResponse.message??Constants.defaultErrorMessage));
      }
    }catch(e,ee){
      print("$e ,, $ee");
      return left(Failuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, bool>> createPost(String content, String location, String category, File image) async {
    String token = await SharedPrefsUtils().getToken()??"";
    try {
      var formData = MultipartRequest('POST', Uri.parse("https://${EndPoints.baseUrl}${EndPoints.updatePhoto}"));


      formData.headers.addAll(
          {
            'authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          }
      );

      formData.fields.addAll({
        'content' : content,
        'location' : location,
        'category' : category
      });


      formData.files.add( MultipartFile(
        'profileImage',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: image.path.split("/").last,
        contentType: MediaType('image', 'png'),
      ));


      Response serverResponse = await Response.fromStream(await formData.send());

    print(" body of update profile is ::: ${serverResponse.body}");
    if (serverResponse.statusCode >= 200 &&
    serverResponse.statusCode < 300) {
    return const Right(true);
    } else {
    return left(Failuer( Constants.defaultErrorMessage));
    }
    }catch(e,ee){
    print("$e,$ee");
    return left(Failuer(Constants.defaultErrorMessage));
    }
  }


}