import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/documentDetails_widget.dart';

Center mainBody(BuildContext context, File? imagePath) {
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
            onPressed: () {
              print("_cameraScan clicked");
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
