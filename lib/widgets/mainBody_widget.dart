import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/documentDetails_widget.dart';
import 'package:image_picker/image_picker.dart';

Center mainBody(
    BuildContext context, File? imagePath, Function callbackSetState) {
  return Center(
    // Center is a layout widget. It takes a single child and positions it
    // in the middle of the parent.
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Select one option:',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        FloatingActionButton.extended(
            onPressed: () async {
              print("Camera scan clicked");
              final ImagePicker _picker = ImagePicker();
              final XFile? selectedImage =
                  await _picker.pickImage(source: ImageSource.gallery);
              print("image $selectedImage");
              if (selectedImage != null) {
                imagePath = File(selectedImage.path);
                callbackSetState(imagePath);
                print("imagePath:: $imagePath");
              } else {
                print("media is empty");
              }
            },
            tooltip: 'SCAN',
            label: const Text("camera scanner"),
            heroTag: "fromCamera",
            icon: const Icon(
              Icons.flip_camera_ios,
              size: 24,
            )),
        if (imagePath != null)
          Center(
              child: Image.file(
            imagePath!,
            width: 200,
          )),
        if (imagePath != null)
          CupertinoButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DocumentDetails(imagePath!)));
            },
            child: const Text('Click Extracted Document'),
          ),
      ],
    ),
  );
}
