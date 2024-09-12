import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fortnite_app/routes/routes.dart' as r;

import 'views/home_screen/splash_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

bool isIpad = false;
bool isSmallDevice = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      isIpad = true;
    } else if (MediaQuery.of(context).size.width < 420) {
      isSmallDevice = true;
    }
    return GetMaterialApp(
      onGenerateRoute: r.Route.onpageroute,
      debugShowCheckedModeBanner: false,
      title: 'Gems',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
