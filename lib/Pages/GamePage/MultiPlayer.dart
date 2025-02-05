import 'package:basico/Components/InGameUserCard.dart';
import 'package:basico/Configs/AssestsPath.dart';
import 'package:basico/Controller/MultiPlayerController.dart';
import 'package:basico/Models/RoomModel.dart';
import 'package:confetti/confetti.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math';

class MultiPlayerPage extends StatelessWidget {
  final String roomId;
  const MultiPlayerPage({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    //var playValue = ["", "", "", "", "", "", "", "", ""];
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    MultiPlayerController multiPlayerController =
        Get.put(MultiPlayerController());

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: SvgPicture.asset(IconsPath.voiceIcon),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                  child: StreamBuilder(
                      stream: multiPlayerController.getRoomDetails(roomId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          RoomModel? roomData = snapshot.data;
                          var playValue = roomData!.gameValue!;
                          return Column(
                            children: [
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      InGameUserCard(
                                        icon: IconsPath.xxIcon,
                                        name: roomData!.player1!.name!,
                                        imageUrl: roomData!.player1!.image!,
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(IconsPath.winIcon),
                                            SizedBox(width: 10),
                                            Text(
                                                "WON : ${roomData!.player1!.totalWins!}")
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InGameUserCard(
                                        icon: IconsPath.oIcon,
                                        name: roomData!.player2!.name!,
                                        imageUrl: roomData!.player2!.image!,
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(IconsPath.winIcon),
                                            SizedBox(width: 10),
                                            Text(
                                                "WON : ${roomData!.player2!.totalWins!}")
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              DottedBorder(
                                borderType: BorderType.RRect,
                                color: Theme.of(context).colorScheme.primary,
                                strokeWidth: 2,
                                dashPattern: [10, 10],
                                radius: Radius.circular(20),
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: w,
                                  height: w - 33,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: GridView.builder(
                                      itemCount: 9,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3),
                                      itemBuilder: ((context, index) {
                                        return InkWell(
                                          onTap: () {
                                            multiPlayerController.updateData(
                                                roomId,
                                                playValue,
                                                index,
                                                roomData!.isXTurn!,
                                                roomData);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(0.5),
                                            decoration: BoxDecoration(
                                                color: playValue?[index] == 'X'
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                    : playValue?[index] == 'O'
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .secondary
                                                        : playValue?[index] ==
                                                                ''
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .primaryContainer
                                                            : Theme.of(context)
                                                                .colorScheme
                                                                .primaryContainer,
                                                borderRadius: index == 0
                                                    ? const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20))
                                                    : index == 2
                                                        ? const BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    20))
                                                        : index == 6
                                                            ? const BorderRadius.only(
                                                                bottomLeft:
                                                                    Radius.circular(
                                                                        20))
                                                            : index == 8
                                                                ? const BorderRadius
                                                                    .only(
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            20))
                                                                : const BorderRadius
                                                                    .only()),
                                            child: Center(
                                                child: playValue?[index] == 'X'
                                                    ? SvgPicture.asset(
                                                        IconsPath.xxIcon,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primaryContainer,
                                                        width: 45,
                                                      )
                                                    : playValue?[index] == 'O'
                                                        ? SvgPicture.asset(
                                                            IconsPath.oIcon,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primaryContainer,
                                                            width: 50,
                                                          )
                                                        : playValue?[index] ==
                                                                ''
                                                            ? SizedBox()
                                                            : SizedBox()),
                                          ),
                                        );
                                      })),
                                ),
                              ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      decoration: BoxDecoration(
                                          color: roomData.isXTurn == 'true'
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: roomData.isXTurn == 'true'
                                          ? Row(
                                              children: [
                                                SvgPicture.asset(
                                                    IconsPath.xxIcon,
                                                    width: 30,
                                                    color: Colors.white),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Turn",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                  ),
                                                )
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                SvgPicture.asset(
                                                    IconsPath.oIcon,
                                                    width: 30,
                                                    color: Colors.white),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Turn",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                  ),
                                                )
                                              ],
                                            )),
                                ],
                              )
                            ],
                          );
                        } else {
                          return Text('No data');
                        }
                      })),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: multiPlayerController.confettiController,
          shouldLoop: false,
          blastDirection: pi / 2,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Colors.green,
            Colors.deepPurple
          ],
          gravity: 0.01,
          emissionFrequency: 0.05,
        )
      ],
    );
  }
}
