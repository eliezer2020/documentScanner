import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/documentDetails_widget.dart';
import 'package:flutter_application_3/widgets/mainBody_widget.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(0, 114, 207, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'WMT scannerFiles'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: mainBody(context, imagePath),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            print("FileScan clicked");
            final ImagePicker _picker = ImagePicker();
            final XFile? selectedImage =
                await _picker.pickImage(source: ImageSource.gallery);
            print("image $selectedImage");
            if (selectedImage != null) {
              setState(() {
                imagePath = File(selectedImage.path);

                print("imagePath:: $imagePath");
              });
            } else {
              print("media is empty");
            }
          },
          label: const Text("open from files"),
          icon: const Icon(
            Icons.add,

            size: 24,
            //color: Color.fromARGB(139, 246, 254, 26),
          ),
          heroTag: "fromfiles",

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
