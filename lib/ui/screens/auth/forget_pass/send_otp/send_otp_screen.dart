import 'package:be_helpful/domain/di/di.dart';
import 'package:be_helpful/ui/screens/auth/forget_pass/otp/otp_screen.dart';
import 'package:be_helpful/ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart';
import 'package:be_helpful/ui/screens/auth/widgets/tff_widget.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:be_helpful/ui/utils/dialog_utils.dart';
import 'package:be_helpful/ui/widgets/button.dart';
import 'package:be_helpful/ui/widgets/description_text.dart';
import 'package:be_helpful/ui/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendOtpScreen extends StatefulWidget {
  static const String routeName = "SendOtpScreen";
  const SendOtpScreen({super.key});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  SendOTPViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener(
        bloc: viewModel,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: viewModel.sendOTPKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(text: "البحث عن حسابك"),
                  CustomDescriptionText(text: "أدخل عنوان بريدك الإلكتروني ",),
                  const SizedBox(height: 20,),
                  CustomTextFormField(
                    hintText: "البريد الالكتروني",
                    controller:viewModel.emailController ,
                    validator: (text){
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter email';
                      }
                      var emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return 'email format not valid';
                      }

                      return null;
                    },
                    type: TextInputType.emailAddress,
                    isRight: true,
                  ),
                  const SizedBox(height: 40,),
                  CustomButton(
                    text: "ارسال رمز التأكيد",
                    onPressed:(){
                      viewModel.sendOTP();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        listener: (context, state) {
          if(state is BaseRequestLoadingState)
          {
            showLoading(context);
          }else if (state is BaseRequestSuccessState){
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, VerificationOTPScreen.routeName);
          }else if (state is BaseRequestErrorState){
            Navigator.pop(context);
            showErrorDialog(context, state.message);
          }
        },

      ),
    );
  }
}
