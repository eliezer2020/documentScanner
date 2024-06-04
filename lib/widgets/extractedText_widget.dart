  import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

//SafeArea(child: textDisplayer())


Widget textDisplayer (File imagePath) {
   // ignore: unnecessary_null_comparison
   if( imagePath==null){
    return const Center(child: Text("No result"),);
   }else{
     return FutureBuilder(future: _extractText(imagePath!), 
     builder: (context, snapshot) {
return Text(snapshot.data ?? "");
     });
   }
  }
  
 
  Future<String?> _extractText(File file)async {
    final recognizer= TextRecognizer(script:TextRecognitionScript.latin);
    final inputImage= InputImage.fromFile(file);
    final extractedText= await recognizer.processImage(inputImage);
    final text = extractedText.text;
    recognizer.close();
    print("===text extracted====== : $text  =====");
    return text;


  }