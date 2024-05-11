import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/domain/use_cases/sign_up_use_case.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit {

  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  TextEditingController confirmPassController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  bool isPass = true;
  IconData icon = Icons.remove_red_eye_outlined;
  SignUpUseCase signUpUseCase;

  SignUpViewModel(this.signUpUseCase):super(BaseRequestInitialState());

  signUp()async{

    emit(BaseRequestLoadingState());
    Either<Failuer, bool> response = await
    signUpUseCase.execute(
        nameController.text,
        emailController.text,
        passController.text,
        confirmPassController.text,
        phoneController.text
    );

    response.fold(
            (error) {
          emit(BaseRequestErrorState(error.errorMessage));
        },
            (success) {
          emit(BaseRequestSuccessState());
        });

  }

}