import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:waste_tracker/models/food_waste_post.dart';
import 'package:waste_tracker/widgets/text_medium.dart';

class NewPostForm extends StatefulWidget {
  final File? image;
  const NewPostForm({
    super.key,
    required this.image
  });
  
  @override
  _NewPostFormState createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {
  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData locationData;
  final DateFormat entryDateFormat = DateFormat('MMMM d, y');
  final formKey = GlobalKey<FormState>();
  final wasteController = TextEditingController();
  final FocusNode focusWaste = FocusNode();
  final FoodWastePost foodWastePost = FoodWastePost();

  @override
  void initState() {
    super.initState();
    foodWastePost.date = DateTime.now();
    retrieveLocation();
  }

  @override
  void dispose() {
    wasteController.dispose();
    focusWaste.dispose();
    super.dispose();
  }

  // Get the location from the device
  void retrieveLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    foodWastePost.latitude = locationData.latitude.toString();
    foodWastePost.longitude = locationData.longitude.toString();
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .02),
            child: Center(
              child: MediumText(text: entryDateFormat.format(DateTime.now()))
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
            child: Image.file(
              widget.image!,
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width * 1
            )
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * .02),
            child: Semantics(
              textField: true,
              focusable: true,
              label: 'Number of wasted items',
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Number of wasted items',
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                focusNode: focusWaste,
                controller: wasteController,
                onTap: () => focusWaste.requestFocus(),
                onSaved: (value) {
                  foodWastePost.leftoverItems = int.parse(wasteController.text);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Try entering an amount above.';
                  }
                  return null;
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .05,
              left: MediaQuery.of(context).size.width * .04,
              right: MediaQuery.of(context).size.width * .04,
            ),
            height: MediaQuery.of(context).size.height * .15,
            child: Semantics(
              button: true,
              enabled: true,
              onTapHint: 'Save post and upload to the cloud',
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    final storageReference = FirebaseStorage.instance.ref().child(Path.basename(widget.image!.path));
                    await storageReference.putFile(widget.image!);
                    foodWastePost.imageUrl = await storageReference.getDownloadURL();

                    FirebaseFirestore.instance
                      .collection('posts')
                      .add({
                        'date': foodWastePost.date,
                        'quantity': foodWastePost.leftoverItems,
                        'latitude': foodWastePost.latitude,
                        'longitude': foodWastePost.longitude,
                        'imageURL': foodWastePost.imageUrl
                      });
                    Navigator.of(context).pop(context);
                  }
                },
                child: const Icon(
                  Icons.cloud_upload,
                  size: 56,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }

}