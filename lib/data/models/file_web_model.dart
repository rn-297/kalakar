import 'dart:typed_data';

class FileDataWeb {
  String path;
  String name;
  String extension;
  Uint8List? imageData;
  int? documentId;
  String type;

  FileDataWeb({
    required this.path,
    required this.name,
    required this.type,

    required this.extension,
    required this.imageData,
    this.documentId = 0,
  });
}