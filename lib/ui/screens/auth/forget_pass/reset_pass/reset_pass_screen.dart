import 'package:be_helpful/domain/di/di.dart';
import 'package:be_helpful/ui/screens/auth/forget_pass/otp/otp_screen.dart';
import 'package:be_helpful/ui/screens/auth/forget_pass/reset_pass/reset_pass_view_model.dart';
import 'package:be_helpful/ui/screens/auth/forget_pass/send_otp/send_otp_screen.dart';
import 'package:be_helpful/ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart';
import 'package:be_helpful/ui/screens/auth/login/login_screen.dart';
import 'package:be_helpful/ui/screens/auth/widgets/tff_widget.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:be_helpful/ui/utils/dialog_utils.dart';
import 'package:be_helpful/ui/widgets/button.dart';
import 'package:be_helpful/ui/widgets/description_text.dart';
import 'package:be_helpful/ui/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassScreen extends StatefulWidget {
  static const String routeName = "ResetPassScreen";
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  ResetPassViewModel resetPassViewModel = getIt();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener(
        bloc: resetPassViewModel,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, SendOtpScreen.routeName);
                        },
                        icon: Icon(Icons.arrow_back_ios)
                    ),
                    CustomText(text: "تعديل الباسورد"),
                  ],
                ),
                const SizedBox(height: 20,),
                CustomTextFormField(
                  hintText: "البريد الالكتروني",
                  controller:resetPassViewModel.emailController ,
                  validator: (text){},
                  type: TextInputType.emailAddress,
                  isRight: true,
                ),
                const SizedBox(height: 30,),
                CustomTextFormField(
                  hintText: "كلمة السر الجديده",
                  controller:resetPassViewModel.passController ,
                  validator: (text){},
                  type: TextInputType.emailAddress,
                  isRight: true,
                  isPassword: true,
                  isVisible: resetPassViewModel.isPass,
                  icon: IconButton(
                      onPressed: ()
                      {
                        resetPassViewModel.isPass =!resetPassViewModel.isPass;
                        resetPassViewModel.icon = resetPassViewModel.isPass ? Icons.remove_red_eye_outlined : Icons.remove_outlined ;
                        setState(() {});
                      }, icon: Icon(resetPassViewModel.icon)),
                ),
                const SizedBox(height: 30,),
                CustomTextFormField(
                  hintText: "تأكيد كلمة السر الجديده",
                  controller:resetPassViewModel.confirmPassController ,
                  validator: (text){},
                  type: TextInputType.emailAddress,
                  isRight: true,
                  isPassword: true,
                  isVisible: resetPassViewModel.isPass,
                  icon: IconButton(
                      onPressed: ()
                      {
                        resetPassViewModel.isPass =!resetPassViewModel.isPass;
                        resetPassViewModel.icon = resetPassViewModel.isPass ? Icons.remove_red_eye_outlined : Icons.remove_outlined ;
                        setState(() {});
                      }, icon: Icon(resetPassViewModel.icon)),
                ),
                const SizedBox(height: 30,),
                CustomButton(
                  text: "ارسال رمز التأكيد",
                  onPressed:(){
                    resetPassViewModel.resetPass();
                  },
                ),
              ],
            ),
          ),
        ),
        listener: (context, state) {
          if(state is BaseRequestLoadingState)
          {
            showLoading(context);
          }else if (state is BaseRequestSuccessState){
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          }else if (state is BaseRequestErrorState){
            Navigator.pop(context);
            showErrorDialog(context, state.message);
          }
        },

      ),
    );
  }
}
