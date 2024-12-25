import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileHelper {
  factory FileHelper() {
    return _singleton;
  }

  FileHelper._internal();

  static final FileHelper _singleton = FileHelper._internal();

  Future<List<File>> pickImages({bool allowMultiple = true}) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: allowMultiple,
      );

      if (result != null) {
        final selectedImages = result.files.map((file) => File(file.path!)).toList();
        return selectedImages;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint('pickImages: $e');
      return [];
    }
  }

  Future<int> getFileSizeInBytes(String filePath) async {
    final file = File(filePath);
    if (file.existsSync()) {
      return file.length();
    } else {
      throw Exception('File not found');
    }
  }

  Future<String> getFileSizeInMB(String filePath) async {
    final sizeInBytes = await getFileSizeInBytes(filePath);
    final sizeInMB = sizeInBytes / (1024 * 1024);
    return '${sizeInMB.toStringAsFixed(2)} MB';
  }
}
