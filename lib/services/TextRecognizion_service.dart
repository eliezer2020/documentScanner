import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TextrecognizionService {
//image to text
  Future<String?> extractText(File file) async {
    final recognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final inputImage = InputImage.fromFile(file);
    final extractedText = await recognizer.processImage(inputImage);
    final text = extractedText.text;
    recognizer.close();
    print("===text extracted====== : $text  =====");
    return text;
  }

//document to text
}
