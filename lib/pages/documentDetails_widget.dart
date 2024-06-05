import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/extractedText_widget.dart';

enum PopupList { itemOne, itemTwo }

class DocumentDetails extends StatelessWidget {
  final File imagePath;

  const DocumentDetails(this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<PopupList>>[
                      const PopupMenuItem<PopupList>(
                        value: PopupList.itemOne,
                        child: Text('send as SQL'),
                      ),
                      const PopupMenuItem<PopupList>(
                        value: PopupList.itemTwo,
                        child: Text('send as CSV'),
                      )
                    ])
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Document Details'),
        ),
        body: Flex(
          direction: Axis.horizontal,
          children: [textDisplayer(imagePath)],
        ));
  }
}
