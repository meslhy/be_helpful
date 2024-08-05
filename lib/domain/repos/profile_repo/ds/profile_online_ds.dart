import 'dart:io';

import 'package:be_helpful/data/model/profile_response/profile_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/model/failures.dart';

abstract class ProfileOnlineDS {

  Future<Either<Failuer,ProfileResponse>> getProfile();
  Future<Either<Failuer,ProfileResponse>> getProfileByID(String userID);
  Future<Either<Failuer,bool>> updatePhoto(File image);
  Future<Either<Failuer,bool>> updateProfile(String name , String phoneNum);
}