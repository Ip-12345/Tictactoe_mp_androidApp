import 'package:basico/Components/PrimaryButtonWithIcon.dart';
import 'package:basico/Configs/AssestsPath.dart';
import 'package:basico/Controller/AuthController.dart';
import 'package:basico/Pages/RoomPage/RoomPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLoading = false.obs;
    Authcontroller authcontroller = Get.put(Authcontroller());
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconsPath.logoIcon,
                width: 200,
              )
            ],
          ),
          SizedBox(height: 30),
          Text(
            'Welcome',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text('Please sign in to continue',
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 200),
          PrimarybuttonWithIcon(
              buttonText: 'Sign in with Google',
              onTap: () {
                authcontroller.login();
              },
              iconPath: IconsPath.googleIcon)
        ],
      ),
    ));
  }
}
