import 'package:be_helpful/ui/screens/auth/login/login_screen.dart';
import 'package:be_helpful/ui/utils/app_assets.dart';
import 'package:be_helpful/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = "StartScreen";
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
        image:DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppAssets.onboarding),
        ) ,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: const [0.3,0.9],
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.1),
              ]
          ),
        ),
        child:   Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
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
                      width: 100,
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
                const Spacer(),
                CustomButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  },
                  text: "Get Started",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
