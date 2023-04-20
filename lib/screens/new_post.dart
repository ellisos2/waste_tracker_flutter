import 'dart:io';
import 'package:flutter/material.dart';
import 'package:waste_tracker/widgets/wasteagram_app_bar.dart';
import 'package:waste_tracker/widgets/new_post_form.dart';

class NewPost extends StatelessWidget {
  static const routeName = 'addEntry';
  final File? image;
  
  const NewPost({
    super.key,
    required this.image
  });

  @override
  Widget build (BuildContext context) {
    if (image == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * .08),
          child: WasteagramAppBar(header: 'New Post'),
        ),
        body: Center(
          child: NewPostForm(image: image)
        ),
      );
    }
  }
}