import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/domain/use_cases/verification_otp_use_case.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerificationOTPViewModel extends Cubit{


  String otpText = "";
  VerificationOTPUseCase verificationOTPUseCase;
  VerificationOTPViewModel(this.verificationOTPUseCase):super(BaseRequestInitialState());

  verificationOTP()async{
    if(otpText == "")return;
    emit(BaseRequestLoadingState());
    Either<Failuer, bool> response = await
    verificationOTPUseCase.execute(otpText);

    response.fold(
            (error) {
          emit(BaseRequestErrorState(error.errorMessage));
        },
            (success) {
          emit(BaseRequestSuccessState());
        });
  }


}