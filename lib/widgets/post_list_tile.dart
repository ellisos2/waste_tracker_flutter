import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostListTile extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> post;
  final DateFormat entryDateFormat = DateFormat('MMMM d, y');
  
  PostListTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        entryDateFormat.format(post['date'].toDate()),
        style: Theme.of(context).textTheme.bodyMedium
      ),
      trailing: Text(
        post['quantity'].toString(),
        style: Theme.of(context).textTheme.bodyMedium
      )
    );
  }

}