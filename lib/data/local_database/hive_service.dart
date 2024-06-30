import 'package:hive/hive.dart';
import 'package:kalakar/data/local_database/login_table.dart';

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
  }
}
