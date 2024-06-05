import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/services/TextRecognizion_service.dart';

//SafeArea(child: textDisplayer())

Widget textDisplayer(File imagePath) {
  final TextrecognizionService trs = TextrecognizionService();

  ScrollController _scrollController = ScrollController();

  // ignore: unnecessary_null_comparison
  if (imagePath == null) {
    return const Center(
      child: Text("No result"),
    );
  } else {
    return Expanded(
      child: FutureBuilder(
          future: trs.extractText(imagePath),
          builder: (context, snapshot) {
            return Scrollbar(
              controller: _scrollController,
              thickness: 12,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 12.0),
                    child: Text(snapshot.data ?? "")),
              ),
            );
          }),
    );
  }
}
