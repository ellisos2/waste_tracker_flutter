import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final String text;
  
  const LargeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

}