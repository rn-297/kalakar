import 'dart:io';

import 'package:get/get.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class FileController extends GetxController {
  String filePath = "";
  String fileType = "";
  String appBarName = "";

  downloadFile(String folderPath, String filename, String url) async {
    print("here 1$folderPath");
    String targetPath = await getTargetPath(folderPath, filename);
    print("targetPath $targetPath");
    if (File(targetPath).existsSync()) {
      File(targetPath).delete();
    }
    var bytes = await http.readBytes(Uri.parse(url));
    File(targetPath).writeAsBytesSync(bytes);
    print("done");
  }

  viewFile(String folderPath, String filename, String appbarName,
      String fileType) async {
    String targetPath = await getTargetPath(folderPath, filename);
    filePath = targetPath;
    appBarName = appbarName;
    this.fileType = fileType;
    print(filePath);
    Get.toNamed(RouteHelper.fileViewer);
  }

  viewFile1(String filename, String appbarName, String fileType) {
    filePath = filename;
    appBarName = appbarName;
    this.fileType = fileType;

    print(filePath);
    Get.toNamed(RouteHelper.fileViewer);
  }

  Future<String> getTargetPath(String targetFolder, String fileName) async {
    try {
      var dir;
      if (Platform.isIOS) {
        dir = await getApplicationDocumentsDirectory();
      } else if (Platform.isAndroid) {
        dir = await getExternalStorageDirectory();
      }
      print(dir.path);
      // final dir = await getExternalStorageDirectories();

      final targetPath = '${dir.path}/${targetFolder}/$fileName';
      print("targetPath $targetPath");
      if (!await Directory("${dir.path}/${targetFolder}").exists()) {
        await Directory("${dir.path}/${targetFolder}")
            .create(recursive: true)
            .then((Directory directory) {
          // print('Path of New Dir: ' + directory.path);
        });
        // print('Directory created');
      } else {
        // print('directory already present');
      }

      return targetPath;
    } catch (e) {
      print(e);
      return "";
    }
  }
}
