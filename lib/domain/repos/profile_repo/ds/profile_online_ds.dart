import 'package:be_helpful/data/model/profile_response/profile_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/model/failures.dart';

abstract class ProfileOnlineDS {

  Future<Either<Failuer,ProfileResponse>> getProfile();
}