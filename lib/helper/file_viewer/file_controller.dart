import 'dart:io';

import 'package:get/get.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class FileController extends GetxController {
  String filePath = "";

  downloadFile(String folderPath, String url) async {
    String targetPath = await getTargetPath(folderPath, url.split("/").last);
    if (!File(targetPath).existsSync()) {
      var bytes = await http.readBytes(Uri.parse(url));
      File(targetPath).writeAsBytesSync(bytes);
    }
  }

  viewFile(String folderPath, String filename) async {
    String targetPath = await getTargetPath(folderPath, filename);
    filePath = targetPath;
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
      // print(dir.path);
      // final dir = await getExternalStorageDirectories();

      final targetPath = '${dir.absolute.path}${targetFolder}$fileName';
      // print("targetPath $targetPath");
      if (!await Directory("${dir.absolute.path}${targetFolder}").exists()) {
        await Directory("${dir.absolute.path}${targetFolder}")
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
      // print(e);
      return "";
    }
  }
}
