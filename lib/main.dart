import 'package:be_helpful/data/utils/shared_utils.dart';
import 'package:be_helpful/ui/screens/auth/forget_pass/otp/otp_screen.dart';
import 'package:be_helpful/ui/screens/auth/forget_pass/send_otp/send_otp_screen.dart';
import 'package:be_helpful/ui/screens/auth/login/login_screen.dart';
import 'package:be_helpful/ui/screens/auth/signup/signup_screen.dart';
import 'package:be_helpful/ui/screens/home/home_screen.dart';
import 'package:be_helpful/ui/screens/splash/splash_screen.dart';
import 'package:be_helpful/ui/screens/splash/start_screen.dart';
import 'package:be_helpful/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'domain/di/di.dart';

void main()async{
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await SharedPrefsUtils().getToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: AppTheme.lightTheme,
     routes: {
       HomeScreen.routeName:(context) => const HomeScreen(),
       SplashScreen.routeName:(context) => const SplashScreen(),
       StartScreen.routeName:(context) => const StartScreen(),
       LoginScreen.routeName:(context) => const LoginScreen(),
       SignUpScreen.routeName:(context) => const SignUpScreen(),
       SendOtpScreen.routeName:(context) => const SendOtpScreen(),
       VerificationOTPScreen.routeName:(context) => const VerificationOTPScreen(),
     },
      initialRoute: SplashScreen.routeName,
    );
  }
}

