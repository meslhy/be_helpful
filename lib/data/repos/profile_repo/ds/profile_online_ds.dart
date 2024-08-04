import 'dart:convert';

import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/data/model/profile_response/profile_response.dart';
import 'package:be_helpful/data/utils/shared_utils.dart';
import 'package:be_helpful/domain/repos/profile_repo/ds/profile_online_ds.dart';
import 'package:be_helpful/ui/utils/constants.dart';
import 'package:be_helpful/ui/utils/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
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
  
  
}