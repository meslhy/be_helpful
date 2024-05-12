import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/domain/repos/auth_repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerificationOTPUseCase{

  AuthRepo repo;
  VerificationOTPUseCase(this.repo);

  Future<Either<Failuer , bool>> execute(String otp){
    return repo.verificationOTP(otp);
  }
}