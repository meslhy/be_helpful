import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/domain/repos/auth_repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendOTPUseCase{
  AuthRepo repo;
  SendOTPUseCase(this.repo);

  Future<Either<Failuer , bool>> execute(String email){
    return repo.sendOTP(email);
  }
}