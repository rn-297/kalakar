import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kalakar/controller/auth_page_controller.dart';
import 'package:kalakar/data/local_database/login_table.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:kalakar/views/splash/splash_screen.dart';

class HiveService {
  static const String _boxName = 'loginBox';

  static Future<void> saveLoginData(LoginTable loginData) async {
    final box = await Hive.openBox<LoginTable>(_boxName);
    await box.put('loginData', loginData);
  }

  static Future<LoginTable?> getLoginData() async {
    final box = await Hive.openBox<LoginTable>(_boxName);
    return box.get('loginData');
  }

  static Future<void> deleteLoginData() async {
    final box = await Hive.openBox<LoginTable>(_boxName);
    await box.delete('loginData');
    Get.delete<AuthPageController>();
    Get.offAll(SplashScreenPage());
  }
  static Future<void> editLoginData(LoginTable updatedLoginData) async {
    try {
      final box = await Hive.openBox<LoginTable>(_boxName);
      final existingData = box.get('loginData');

      if (existingData != null) {
        // Overwrite the existing data with updated values
        await box.put('loginData', updatedLoginData);
        print("Login data updated successfully.");
      } else {
        print("No existing login data found to update.");
      }
    } catch (e) {
      print("Error editing login data: $e");
    }
  }

  }
