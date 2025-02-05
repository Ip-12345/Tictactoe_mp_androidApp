import 'dart:io';

import 'package:basico/Components/PrimaryButtonWithIcon.dart';
import 'package:basico/Configs/AssestsPath.dart';
import 'package:basico/Controller/AuthController.dart';
import 'package:basico/Controller/ProfileController.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    RxString imagePath = "".obs;
    TextEditingController nameController = TextEditingController();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(
                      () => imagePath == ""
                          ? Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40)),
                              child: const Icon(
                                Icons.add_a_photo_rounded,
                                size: 50,
                                color: Colors.grey,
                              ),
                            )
                          : Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                //color: Colors.red,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.file(File(imagePath.value),
                                    fit: BoxFit.cover),
                              ),
                            ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            imagePath.value = await profileController
                                .pickImage(ImageSource.gallery);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(20)),
                            child: SvgPicture.asset(IconsPath.galleryIcon,
                                width: 40),
                          ),
                        ),
                        SizedBox(height: 40),
                        InkWell(
                          onTap: () async {
                            imagePath.value = await profileController
                                .pickImage(ImageSource.camera);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: SvgPicture.asset(IconsPath.cameraIcon,
                                width: 40),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Enter your name'),
                ),
                SizedBox(height: 20),
                Text(
                  "You can change these details later  from profile page. don’t worry",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            Obx(() => profileController.isLoading.value
                ? CircularProgressIndicator()
                : PrimarybuttonWithIcon(
                    buttonText: 'Save',
                    onTap: () {
                      profileController.updateProfile(
                          nameController.text, imagePath.value);
                    },
                    iconPath: IconsPath.saveIcon))
          ],
        ),
      ),
    ));
  }
}
