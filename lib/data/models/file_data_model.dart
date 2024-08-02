import 'dart:typed_data';

class FileData {
  String path;
  String type;
  // Uint8List? imageData;
  int? documentId;

  FileData({
    required this.path,
    required this.type,
    // required this.imageData,
    this.documentId = 0,
  });
}
