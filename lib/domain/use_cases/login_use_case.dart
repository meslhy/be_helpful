import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/domain/repos/auth_repo/auth_repo.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase extends Cubit {

  AuthRepo login;

  LoginUseCase(this.login):super(BaseRequestInitialState());

  Future<Either<Failuer , bool>> execute(String email , String password ){
    return login.login(email,password);

  }




}