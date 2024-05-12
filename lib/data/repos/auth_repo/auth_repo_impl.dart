import 'dart:convert';

import 'package:be_helpful/data/model/auth_response/auth_response.dart';
import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/data/utils/shared_utils.dart';
import 'package:be_helpful/domain/repos/auth_repo/auth_repo.dart';
import 'package:be_helpful/ui/utils/constants.dart';
import 'package:be_helpful/ui/utils/end_points.dart';
import 'package:be_helpful/ui/utils/extensions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {

  SharedPrefsUtils sharedPrefsUtils;
  Connectivity connectivity;
  AuthRepoImpl(this.connectivity , this.sharedPrefsUtils);

  @override
  Future<Either<Failuer, bool>> login(String email, String pass) async{
    final body = jsonEncode({
      "email": email,
      "password": pass,});

    if(await connectivity.isInternetConnective) {
      try{
        Uri url = Uri.https(EndPoints.baseUrl,EndPoints.login);

        Response serverResponse = await post(
            url,
            headers: {
              "Content-Type": "application/json",
            },
            body: body
        );



        AuthResponse authResponse = AuthResponse.fromJson(
            jsonDecode(serverResponse.body));

        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {
          sharedPrefsUtils.saveUser(authResponse);
          sharedPrefsUtils.saveToken(authResponse.token!);
          return const Right(true);
        } else {
print(body);
          print(serverResponse.body);
          return left(Failuer(authResponse.message??Constants.defaultErrorMessage));

        }
      }catch(e,ee){
        print(ee);
        return left(Failuer(e.toString()));
      }
    } else {
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }
  

  @override
  Future<Either<Failuer, bool>> signUp(String name, String email, String pass, String confirmPass, String phone) async{

    final body = jsonEncode({
      "name": name,
      "email": email,
      "password": pass,
      "passwordConfirm": confirmPass,
      "phone": phone
    });
    if(await connectivity.isInternetConnective){
      try{
        Uri url = Uri.https(EndPoints.baseUrl,EndPoints.register);
        Response serverResponse = await post(
            url,
            headers: {
              "Content-Type": "application/json",
            },
          body: body
        );
        AuthResponse authResponse = AuthResponse.fromJson(
            jsonDecode(serverResponse.body));
        if( serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
          print(serverResponse.body);
          sharedPrefsUtils.saveUser(authResponse);
          sharedPrefsUtils.saveToken(authResponse.token!);
          return right(true);
        }else{
          print(serverResponse.body);
          return left(Failuer(authResponse.message??Constants.defaultErrorMessage));
        }
        
      }catch(e,ee){
        print("$e , $ee");
        return left(Failuer(e.toString()));
      }
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }

  }

  @override
  Future<Either<Failuer, bool>> sendOTP(String email) async{
    final body = jsonEncode({
      "email": email,});

    if(await connectivity.isInternetConnective) {
      try{
        Uri url = Uri.https(EndPoints.baseUrl,EndPoints.sendOTP);

        Response serverResponse = await post(
            url,
            headers: {
              "Content-Type": "application/json",
            },
            body: body
        );



        AuthResponse authResponse = AuthResponse.fromJson(
            jsonDecode(serverResponse.body));

        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {
          return const Right(true);
        } else {
         
          return left(Failuer(authResponse.message??Constants.defaultErrorMessage));

        }
      }catch(e,ee){
        print(ee);
        return left(Failuer(e.toString()));
      }
    } else {
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }



  @override
  Future<Either<Failuer, bool>> verificationOTP(String otp) async{
    final body = jsonEncode({
      "resetCode": otp,});

    if(await connectivity.isInternetConnective) {
      try{
        Uri url = Uri.https(EndPoints.baseUrl,EndPoints.verificationOTP);

        Response serverResponse = await post(
            url,
            headers: {
              "Content-Type": "application/json",
            },
            body: body
        );


        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {
          return const Right(true);
        } else {

          return left(Failuer(Constants.defaultErrorMessage));

        }
      }catch(e,ee){
        print("erorr is $e ,,,,$ee");
        return left(Failuer(e.toString()));
      }
    } else {
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }

}