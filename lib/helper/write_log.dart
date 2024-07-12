
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class WriteLogFile{
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  static Future<File> get _logFile async {
    final path = await _localPath;
    return File('$path/log.txt');
  }
  static Future<File> writeLog(String log) async {
    final file = await _logFile;

    // Write the log to the file.
    return file.writeAsString('$log\n', mode: FileMode.append);
  }
  static Future<void> shareLogFile() async {
    try {
      final path = await _localPath;
      final file = XFile('$path/log.txt');

      if (await File(file.path).exists()) {
        Share.shareXFiles([file], text: 'Check out this log file');
      } else {
        print('Log file does not exist');
      }
    } catch (e) {
      print('Error sharing log file: $e');
    }
  }

}