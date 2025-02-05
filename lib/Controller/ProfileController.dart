import 'dart:convert';
import 'dart:io';

import 'package:basico/Configs/Messages.dart';
import 'package:basico/Models/UserModel.dart';
import 'package:basico/Pages/HomePage/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final store = FirebaseStorage.instance;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getUserDetails() async {
    await db.collection("users").doc(auth.currentUser!.uid).get().then((value) {
      user.value = UserModel.fromJson(value.data()!);
    });
  }

  Future<void> updateProfile(String name, String imagePath) async {
    isLoading.value = true;
    try {
      if (imagePath != '' && name != '') {
        final uploadedImageUrl = await uploadToCloudinary(imagePath);

        if (auth.currentUser == null) {
          throw Exception("User is not authenticated.");
        }

        var newUser = UserModel(
          id: auth.currentUser!.uid,
          name: name,
          image: uploadedImageUrl,
          email: auth.currentUser!.email,
          totalWins: "0",
        );

        await db
            .collection("users")
            .doc(auth.currentUser!.uid)
            .set(newUser.toJson())
            .then((_) => print("Firestore write successful"))
            .catchError((error) => print("Firestore write error: $error"));
        successMessage('Profile Updated');
        Get.offAll(HomePage());
      } else {
        print('Please fill all the fields');
      }
    } catch (e) {
      print(e);
      errorMessage('Profile Update Failed');
    }
    isLoading.value = false;
  }

  Future<String> uploadToCloudinary(String imagePath) async {
    if (imagePath.isEmpty) {
      print("Image path is empty");
      return "";
    }

    try {
      String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';
      String uploadPreset = 'file-upload-ttt';

      if (cloudName.isEmpty || uploadPreset.isEmpty) {
        print("Cloudinary configuration is missing");
        return "";
      }

      var uri =
          Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");

      File file = File(imagePath);
      var fileBytes = await file.readAsBytes();

      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile.fromBytes(
        'file',
        fileBytes,
        filename: file.path.split('/').last,
      );

      request.files.add(multipartFile);
      request.fields['upload_preset'] = uploadPreset;

      var response = await request.send();

      var responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(responseBody);
        String? uploadedImageUrl = jsonResponse['secure_url'];
        if (uploadedImageUrl == null) {
          throw Exception("Image URL not found in response");
        }
        print("Image uploaded successfully: $uploadedImageUrl");
        return uploadedImageUrl;
      } else {
        print("Upload failed with status: ${response.statusCode}");
        print("Response body: $responseBody");
        return "";
      }
    } catch (e) {
      print("Error during upload: $e");
      return "";
    }
  }

  Future<String> uploadFileToFirebase(String imagePath) async {
    final path = "files/${imagePath}";
    final file = File(imagePath);
    if (imagePath != "") {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = await uploadTask.ref.getDownloadURL();
        print(downloadImageUrl);
        return downloadImageUrl;
      } catch (ex) {
        print(ex);
        return "";
      }
    } else
      return "";
  }

  Future<String> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      return image.path;
    } else {
      return "";
    }
  }
}
