import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waste_tracker/screens/view_post.dart';
import 'package:waste_tracker/widgets/new_post_button.dart';
import 'package:waste_tracker/widgets/post_list_tile.dart';
import 'package:waste_tracker/widgets/wasteagram_app_bar.dart';

class FoodWasteList extends StatefulWidget {
  const FoodWasteList({Key? key}) : super(key: key);

  @override
  FoodWasteListState createState() => FoodWasteListState();
}

class FoodWasteListState extends State<FoodWasteList> {

  late bool imageLoading;

  @override
  void initState() {
    super.initState();
    imageLoading = false;
  }

  void imageLoadingToggle() async {
    setState( () {
      imageLoading ? imageLoading = false : imageLoading = true; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * .08),
        child: const WasteagramAppBar(header: 'Wasteagram'),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('posts').snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (imageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var post = snapshot.data!.docs[index];
                return Semantics(
                  button: true,
                  onTapHint: 'Select to view this post',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPost(post: post)));
                    },
                    child: PostListTile(post: post),
                  ),
                );
              }
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      floatingActionButton: Semantics(
        button: true,
        enabled: true,
        onTapHint: 'Choose an image from your gallery',
        child: NewPostButton(imageLoadingToggle: imageLoadingToggle)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
