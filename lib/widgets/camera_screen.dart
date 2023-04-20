import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_tracker/screens/new_post.dart';

class CameraScreen extends StatefulWidget {

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  late File image;
  final picker = ImagePicker();

  void getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Center(
        child: CircularProgressIndicator()
      ); 
    } else {
      return Center(
        child: Column(
          children: [
            Image.file(image),
            FloatingActionButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => NewPost(image: image)));
              },
              child: Text(
                'Add Photo'
              )
            )
          ],
        )
      );
    }
  }
}