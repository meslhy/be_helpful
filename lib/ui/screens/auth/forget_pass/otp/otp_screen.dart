import 'package:be_helpful/domain/di/di.dart';
import 'package:be_helpful/ui/screens/auth/forget_pass/otp/otp_view_model.dart';
import 'package:be_helpful/ui/screens/auth/forget_pass/send_otp/send_otp_screen.dart';
import 'package:be_helpful/ui/screens/home/home_screen.dart';
import 'package:be_helpful/ui/utils/app_colors.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:be_helpful/ui/utils/dialog_utils.dart';
import 'package:be_helpful/ui/widgets/button.dart';
import 'package:be_helpful/ui/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class VerificationOTPScreen extends StatefulWidget {
  static const String routeName = "OtpScreen";
  const VerificationOTPScreen({super.key});

  @override
  State<VerificationOTPScreen> createState() => _VerificationOTPScreenState();
}

class _VerificationOTPScreenState extends State<VerificationOTPScreen> {

  VerificationOTPViewModel viewModel = getIt();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener(
        bloc: viewModel,
        listener: (context, state) {
          if(state is BaseRequestLoadingState)
          {
            showLoading(context);
          }else if (state is BaseRequestSuccessState){
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }else if (state is BaseRequestErrorState){
            Navigator.pop(context);
            showErrorDialog(context, state.message);
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xffF5F0F0),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, SendOtpScreen.routeName);
                        },
                        child: CustomText(
                          text: "الغاء",
                          color: AppColors.accent,
                        ),
                    ),
                    const SizedBox(width: 30,),
                    CustomText(
                      text: "تعيين رمز الدخول",
                    ),
                  ],
                ),
                const SizedBox(height: 100,),
                TimerCountdown(
                  format: CountDownTimerFormat.minutesSeconds,
                    endTime: DateTime.now().add(
                      const Duration(
                        minutes: 10
                      ),
                    ),
                  onEnd: (){
                    Navigator.pushReplacementNamed(context, SendOtpScreen.routeName);
                  },
                ),
                const SizedBox(height: 50,),
                OtpTextField(
                  numberOfFields: 6,
                  enabledBorderColor: AppColors.black,
                  focusedBorderColor: AppColors.grey,
                  borderRadius: BorderRadius.circular(16),
                  showCursor: false,
                  showFieldAsBox: true,
                  fillColor: AppColors.primary,
                  filled: true,
                  onSubmit: (String verificationCode){
                    viewModel.otpText = verificationCode ;
                  },
                ),
                const SizedBox(height: 50,),
                CustomButton(
                  text: "تم",
                  onPressed: (){
                   viewModel.verificationOTP();
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
