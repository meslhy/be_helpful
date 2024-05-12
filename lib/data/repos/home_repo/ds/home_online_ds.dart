import 'dart:convert';

import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/data/model/home_responses/posts_response.dart';
import 'package:be_helpful/data/utils/shared_utils.dart';
import 'package:be_helpful/domain/repos/home_repo/ds/home_online_ds.dart';
import 'package:be_helpful/ui/utils/constants.dart';
import 'package:be_helpful/ui/utils/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
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


}