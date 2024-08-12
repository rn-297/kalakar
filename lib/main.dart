import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/artist_profile_controller.dart';
import 'package:kalakar/controller/auth_page_controller.dart';
import 'package:kalakar/controller/file_controller.dart';
import 'package:kalakar/controller/profile_controller.dart';
import 'package:kalakar/controller/settings_controller.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/data/local_database/login_table.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LoginTableAdapter());
  await Hive.openBox<LoginTable>("loginBox");
  // final appDocumentDir = await getApplicationDocumentsDirectory();
  Get.lazyPut(() => SettingsController());
  Get.lazyPut(() => AuthPageController());
  Get.lazyPut(() => ProfileController());
  Get.lazyPut(() => FileController());
  Get.put(SettingsController());
  Get.lazyPut(() => ArtistProfileController());
  Get.put(ArtistProfileController());
  Get.put(AuthPageController());
  Get.put(ProfileController());
  Get.put(FileController());


  Get.lazyPut(() => RequirementController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 800),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Kalakar',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                // This is the theme of your application.
                //
                // TRY THIS: Try running your application with "flutter run". You'll see
                // the application has a purple toolbar. Then, without quitting the app,
                // try changing the seedColor in the colorScheme below to Colors.green
                // and then invoke "hot reload" (save your changes or press the "hot
                // reload" button in a Flutter-supported IDE, or press "r" if you used
                // the command line to start the app).
                //
                // Notice that the counter didn't reset back to zero; the application
                // state is not lost during the reload. To reset the state, use hot
                // restart instead.
                //
                // This works for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                fontFamily: "Lato"),
            getPages: RouteHelper.routes,
            initialRoute: RouteHelper.splash,
          );
        });
  }
}
