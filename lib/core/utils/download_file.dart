import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';

Future<String?> downloadFile(String assetPath, String fileName) async {
  try {
    final byteData = await rootBundle.load(assetPath);

    final file = File("/storage/emulated/0/Download/$fileName");

    await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
    return file.path;
  } catch (ex) {
    log(ex.toString());
    return null;
  }
}
