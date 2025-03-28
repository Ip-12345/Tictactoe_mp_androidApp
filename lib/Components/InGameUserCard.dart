import 'package:basico/Configs/AssestsPath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InGameUserCard extends StatelessWidget {
  final String icon;
  final String name;
  final String imageUrl;
  const InGameUserCard(
      {super.key,
      required this.icon,
      required this.name,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: w / 2.6,
          height: 140,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer, //white
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              SizedBox(height: 60),
              Text(name, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [SizedBox(height: 6), SvgPicture.asset(icon)],
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: -40,
            left: w / 2.6 / 2 - 40,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 3),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ))
      ],
    );
  }
}
