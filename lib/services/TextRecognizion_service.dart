import 'dart:io';

import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
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
  Future<String> extractFromCamera() async {
    final docOpts = DocumentScannerOptions(
        documentFormat: DocumentFormat.jpeg,
        mode: ScannerMode.filter,
        pageLimit: 1);

    final docScanner = DocumentScanner(options: docOpts);
    DocumentScanningResult docResult = await docScanner.scanDocument();
    String docResultFromImage = docResult.images[0];
    print("docResultFromImage : $docResultFromImage");
    return docResultFromImage;
  }
}
