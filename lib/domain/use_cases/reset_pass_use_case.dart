
import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/domain/repos/auth_repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPassUseCase {

  AuthRepo repo;

  ResetPassUseCase(this.repo);

  Future<Either<Failuer , bool>> execute(String email , String pass , String confirmPass){

    return repo.resetPass(email, pass, confirmPass);
  }


}