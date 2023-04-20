import 'package:flutter/material.dart';

class WasteagramAppBar extends StatelessWidget {
  final String header;
  
  const WasteagramAppBar({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * .08,
      centerTitle: true,
      title: Text(
        header,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

}