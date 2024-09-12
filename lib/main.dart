import 'package:flutter/material.dart';
import 'package:gems_convter/views/home_pages/views/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gems_convter/routes/routes.dart' as r;
// import 'package:just_audio/just_audio.dart';

// import 'model/global/varibales.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // Global.player.setAsset(Global.bgAudio);
  // Global.player.setLoopMode(LoopMode.one);
  // Global.player.play();
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
      home: const SplashScreen(),
    );
  }
}
