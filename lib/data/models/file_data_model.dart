import 'dart:typed_data';

class FileData {
  String path;
  String type;
  Uint8List? imageData;
  int? documentId;

  FileData({
    required this.path,
    required this.type,
    this.imageData=null,
    this.documentId = 0,
  });
}
