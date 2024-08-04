import 'package:dartz/dartz.dart';

import '../../../data/model/failures.dart';
import '../../../data/model/profile_response/profile_response.dart';

abstract class ProfileRepo {

  Future<Either<Failuer,ProfileResponse>> getProfile();
}