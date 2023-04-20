import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:waste_tracker/widgets/text_large.dart';
import 'package:waste_tracker/widgets/text_medium.dart';
import 'package:waste_tracker/widgets/wasteagram_app_bar.dart';

class ViewPost extends StatelessWidget {

  final DateFormat entryDateFormat = DateFormat('MMMM d, y');
  final QueryDocumentSnapshot<Object?> post;

  ViewPost({super.key, required this.post});
  
  @override
  Widget build (BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * .08),
        child: const WasteagramAppBar(header: 'Wasteagram'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LargeText(text: entryDateFormat.format(post['date'].toDate())),
            CachedNetworkImage(
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: post['imageURL']
            ),
            LargeText(text: 'Leftover items: ${post['quantity'].toString()}'),
            MediumText(text: 'Location: ${post['latitude']}, ${post['longitude']}')
          ],
        ),
      )
    );
  }
}