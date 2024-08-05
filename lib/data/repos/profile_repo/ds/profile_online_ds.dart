import 'dart:convert';
import 'dart:io';

import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/data/model/profile_response/profile_response.dart';
import 'package:be_helpful/data/utils/shared_utils.dart';
import 'package:be_helpful/domain/repos/profile_repo/ds/profile_online_ds.dart';
import 'package:be_helpful/ui/utils/constants.dart';
import 'package:be_helpful/ui/utils/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: ProfileOnlineDS)
class ProfileOnlineDsImpl extends ProfileOnlineDS {

  @override
  Future<Either<Failuer, ProfileResponse>> getProfile() async {

    String token = await SharedPrefsUtils().getToken()??"";
    try{
      Uri url = Uri.https(EndPoints.baseUrl , EndPoints.profile);

      Response serverResponse = await get(
        url,
        headers: {
          "Authorization" : "Bearer $token",

        }
      );

      ProfileResponse response = ProfileResponse.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >=200 && serverResponse.statusCode < 300){
        return right(response);
      }else{
        return left(Failuer(response.message??Constants.defaultErrorMessage));
      }
    }catch(e,ee){
      print("error in ProfileOnlineDsImpl $e in $ee");
      return left(Failuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, bool>> updatePhoto(File image) async {

    String token = await SharedPrefsUtils().getToken()??"";
    try {
      var formData = MultipartRequest('PATCH', Uri.parse("https://${EndPoints.baseUrl}${EndPoints.updatePhoto}"));


      formData.headers.addAll(
          {
            'authorization': 'Bearer $token',
          }
      );


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

  @override
  Future<Either<Failuer, bool>> updateProfile(String name, String phoneNum)async {
    String token = await SharedPrefsUtils().getToken()??"";
    try{
      Uri url = Uri.https(EndPoints.baseUrl , EndPoints.updateProfile);

      Response serverResponse = await patch(
          url,
        headers: {
            "Authorization" : "Bearer $token",
        },
        body: {
          "name": name,
          "phone": phoneNum
        }
      );

      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 ){
        return const Right(true);
      }else{
        return left(Failuer(Constants.defaultErrorMessage));
      }
    }catch(e,ee){
      print("error in updateProfile is $e in $ee ");
      return left(Failuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, ProfileResponse>> getProfileByID(String userID) async{
    String token = await SharedPrefsUtils().getToken()??"";
    try{
      Uri url = Uri.https(EndPoints.baseUrl,"${EndPoints.getProfileByID}/$userID");
      Response serverResponse = await get(
          url,
        headers: {
            'Authorization' : "Bearer $token"
        }
      );

      ProfileResponse response = ProfileResponse.fromJson(jsonDecode(serverResponse.body));

      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
        return right(response);
      }else{
        return left(Failuer(response.message??Constants.defaultErrorMessage));
      }
    }catch(e,ee){
      print("error in getProfileByID is $e in $ee");
      return left(Failuer(e.toString()));

    }
  }
  
  
}