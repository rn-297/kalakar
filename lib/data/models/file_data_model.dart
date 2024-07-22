import 'dart:typed_data';

class FileData {
  String path;
  String type;
  Uint8List? imageData;

  FileData({
    required this.path,
    required this.type,
    required this.imageData,
  });
}