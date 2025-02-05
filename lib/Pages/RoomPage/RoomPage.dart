import 'package:basico/Components/PrimaryButton.dart';
import 'package:basico/Configs/AssestsPath.dart';
import 'package:basico/Controller/RoomController.dart';
import 'package:basico/Pages/LobbyPage/LobbyPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController roomId = TextEditingController();
    RoomController roomController = Get.put(RoomController());
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(IconsPath.backIcon),
                    ),
                    SizedBox(width: 15),
                    Text("Play With Private Room",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Enter Private Code And Join With Your Friend',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: roomId,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.primaryContainer,
                      filled: true,
                      hintText: 'Enter Code Here',
                      hintStyle: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none)),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => roomController.isLoading.value
                      ? CircularProgressIndicator()
                      : Primarybutton(
                          buttonText: "Join Now",
                          onTap: () {
                            if (roomId.text.isNotEmpty) {
                              roomController.joinRoom(roomId.text);
                            }
                          }),
                ),
                SizedBox(
                  height: 80,
                ),
                Text('Create private room',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
                Spacer(),
                Obx(
                  () => roomController.isLoading.value
                      ? CircularProgressIndicator()
                      : Primarybutton(
                          buttonText: "Create room",
                          onTap: () {
                            //Get.toNamed('/lobby');
                            roomController.createRoom();
                          }),
                )
              ],
            ),
          ),
        ));
  }
}
