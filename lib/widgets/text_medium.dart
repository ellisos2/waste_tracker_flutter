import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final String text;
  
  const MediumText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

}