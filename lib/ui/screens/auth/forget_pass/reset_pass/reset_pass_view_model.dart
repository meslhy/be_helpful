import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/domain/use_cases/reset_pass_use_case.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPassViewModel extends Cubit{
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  TextEditingController confirmPassController =TextEditingController();
  bool isPass = true;
  IconData icon = Icons.remove_red_eye_outlined;

  ResetPassUseCase resetPassUseCase;

  ResetPassViewModel(this.resetPassUseCase):super(BaseRequestInitialState());

  resetPass()async{
    emit(BaseRequestLoadingState());
    Either<Failuer, bool> response = await
    resetPassUseCase.execute(emailController.text, passController.text,confirmPassController.text);

    response.fold(
            (error) {
          emit(BaseRequestErrorState(error.errorMessage));
        },
            (success) {
          emit(BaseRequestSuccessState());
        });
  }

}