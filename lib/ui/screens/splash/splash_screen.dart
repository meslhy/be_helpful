import 'package:be_helpful/ui/screens/splash/start_screen.dart';
import 'package:be_helpful/ui/utils/app_assets.dart';
import 'package:be_helpful/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), (){
      Navigator.pushReplacementNamed(context, StartScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.splashIcon),
                fit: BoxFit.fitWidth
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(

                    image: DecorationImage(
                      image: AssetImage(AppAssets.handshake),

                    )
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                width: 120,
                height: 100,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.nameIcon),

                    )
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
