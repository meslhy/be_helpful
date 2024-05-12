

import 'package:be_helpful/data/model/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {

  Future<Either<Failuer , bool>> login(String email , String pass);
  Future<Either<Failuer , bool>> signUp (String name ,String email , String pass , String confirmPass , String phone);
  Future<Either<Failuer , bool>> sendOTP (String email);
  Future<Either<Failuer , bool>> verificationOTP (String otp);
}