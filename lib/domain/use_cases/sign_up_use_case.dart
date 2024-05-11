import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/domain/repos/auth_repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@injectable
class SignUpUseCase{

  AuthRepo repo;

  SignUpUseCase(this.repo);

  Future<Either<Failuer , bool>> execute(String name ,String email , String pass , String confirmPass , String phone){
    return repo.signUp(name, email, pass, confirmPass, phone);
  }

}