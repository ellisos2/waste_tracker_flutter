import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_tracker/screens/new_post.dart';

class NewPostButton extends StatefulWidget {
  final void Function() imageLoadingToggle;

  const NewPostButton({super.key, required this.imageLoadingToggle});

  @override
  State<NewPostButton> createState() => _NewPostButtonState();
}

class _NewPostButtonState extends State<NewPostButton> {
  File? image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  // Choose an image from the gallery
  Future<void> getImage() async {
    widget.imageLoadingToggle();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    widget.imageLoadingToggle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.camera_alt),
      onPressed: () async {
        await getImage();
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewPost(image: image)));
      }
    );
  }
}
