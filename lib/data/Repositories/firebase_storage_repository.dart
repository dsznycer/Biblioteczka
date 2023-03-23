import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FireStorage {
  final storage = FirebaseStorage.instance.ref();

  Future<String> updateUserProfilePhoto(String userId, File filePhoto) async {
    final userPhotoRef = storage.child('UserPhoto/$userId.jpeg');

    await userPhotoRef.putFile(filePhoto);

    return await userPhotoRef.getDownloadURL();
  }
}
