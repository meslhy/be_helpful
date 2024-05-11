import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/domain/use_cases/login_use_case.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit{
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  LoginUseCase loginUseCase ;
  bool isPass = true;
  IconData icon = Icons.remove_red_eye_outlined;

  LoginViewModel(this.loginUseCase):super(BaseRequestInitialState());

  void login() async {
    print(emailController.text);
    print(passController.text);
    emit(BaseRequestLoadingState());
    Either<Failuer, bool> response = await
    loginUseCase.execute(emailController.text, passController.text);

    response.fold(
            (error) {
          emit(BaseRequestErrorState(error.errorMessage));
        },
            (success) {
          emit(BaseRequestSuccessState());
        });
  }

}