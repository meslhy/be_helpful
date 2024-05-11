import 'package:be_helpful/domain/di/di.dart';
import 'package:be_helpful/ui/screens/auth/login/login_screen.dart';
import 'package:be_helpful/ui/screens/auth/login/login_view_model.dart';
import 'package:be_helpful/ui/screens/auth/signup/signup_view_model.dart';
import 'package:be_helpful/ui/screens/auth/widgets/tff_widget.dart';
import 'package:be_helpful/ui/screens/home/home_screen.dart';
import 'package:be_helpful/ui/utils/app_assets.dart';
import 'package:be_helpful/ui/utils/app_colors.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:be_helpful/ui/utils/dialog_utils.dart';
import 'package:be_helpful/ui/widgets/button.dart';
import 'package:be_helpful/ui/widgets/description_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "SinUpScreen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        print("state is ...$state");
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
        backgroundColor: AppColors.primary,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        flex: 25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
                              width: 120,
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets.nameIcon),

                                  )
                              ),
                            ),
                            CustomDescriptionText(text: "إنضم إلى مجتمعنا الخيرى لمساعده بعضنا البعض"),
                          ],
                        )
                    ),
                    Expanded(
                      flex: 75,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextFormField(
                            hintText: "UserName",
                            controller: viewModel.nameController,
                            validator: (x){
                              return "";
                            },
                            type: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 35,),
                          CustomTextFormField(
                            hintText: "Email",
                            controller: viewModel.emailController,
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
                            } ,
                            type: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 35,),
                          CustomTextFormField(
                            hintText: "Password",
                            controller: viewModel.passController,
                            validator: (x){
                              return "";
                            },
                            type: TextInputType.visiblePassword,
                            isPassword: true,
                            isVisible: viewModel.isPass,
                            icon: IconButton(
                                onPressed: ()
                                {
                                  viewModel.isPass =!viewModel.isPass;
                                  viewModel.icon = viewModel.isPass ? Icons.remove_red_eye_outlined : Icons.remove_outlined ;
                                  setState(() {});
                                }, icon: Icon(viewModel.icon)),
                          ),
                          const SizedBox(height: 35,),
                          CustomTextFormField(
                            hintText: "Password Confirm",
                            controller: viewModel.confirmPassController,
                            validator: (x){
                              return "";
                            },
                            type: TextInputType.visiblePassword,
                            isPassword: true,
                            isVisible: viewModel.isPass,
                            icon: IconButton(
                                onPressed: ()
                                {
                                  viewModel.isPass =!viewModel.isPass;
                                  viewModel.icon = viewModel.isPass ? Icons.remove_red_eye_outlined : Icons.remove_outlined ;
                                  setState(() {});
                                }, icon: Icon(viewModel.icon)),
                          ),
                          const SizedBox(height: 35,),
                          CustomTextFormField(
                            hintText: "Phone Number",
                            controller: viewModel.phoneController,
                            validator: (x){
                              return "";
                            },
                            type: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 50,),
                          CustomButton(
                            onPressed: (){
                              viewModel.signUp();
                            },
                            text: "Login",
                          ),
                          const SizedBox(height: 10,),
                          TextButton(
                            onPressed: (){},
                            child: const Text(
                              "هل نسيت كلمة السر؟"
                              ,
                              style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Have an account ?"
                                ,
                                style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black
                                ),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                                },
                                child: const Text(
                                  "Sign in"
                                  ,
                                  style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
