import 'package:basico/Components/PrimaryButtonWithIcon.dart';
import 'package:basico/Configs/AssestsPath.dart';
import 'package:basico/Controller/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('TIC TAC TOE',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).colorScheme.primary)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('With Multiplayer',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary)),
                ],
              ),
            ],
          ),
          SvgPicture.asset(
            IconsPath.logoIcon,
            width: 200,
          ),
          Column(
            children: [
              PrimarybuttonWithIcon(
                  buttonText: "Single Player",
                  onTap: () {
                    Get.toNamed("/singlePlayer");
                  },
                  iconPath: IconsPath.userIcon),
              SizedBox(height: 30),
              PrimarybuttonWithIcon(
                  buttonText: "Multi Player",
                  onTap: () {
                    Get.toNamed('/room');
                  },
                  iconPath: IconsPath.usersIcon),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20)),
                  child: SvgPicture.asset(IconsPath.infoIcon, width: 40),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20)),
                  child: SvgPicture.asset(IconsPath.gameIcon, width: 40),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20)),
                  child: SvgPicture.asset(IconsPath.githubIcon, width: 40),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20)),
                  child: SvgPicture.asset(IconsPath.youtubeIcon, width: 40),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
