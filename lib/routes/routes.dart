import 'package:flutter/material.dart';
import 'package:gems_convter/views/coin_game/views/collect_page.dart';
import 'package:gems_convter/views/counter/views/convert_daily.dart';
import 'package:gems_convter/views/list_pages/views/total_all.dart';
import 'package:gems_convter/views/skins_game/views/pet_game.dart';
import '../views/coin_game/views/flip_page/views/flip_game.dart';
import '../views/coin_game/views/shuffle_game.dart';
import '../views/collection_page/views/collection_details.dart';
import '../views/collection_page/views/collection_page.dart';
import '../views/counter/views/convert_gems.dart';
import '../views/counter/views/convert_us.dart';
import '../views/home_pages/views/home_page.dart';
import '../views/home_pages/views/bottom_screen.dart';
import '../views/home_pages/views/info_details.dart';
import '../views/home_pages/views/setting_page.dart';
import '../views/home_pages/views/splash_screen.dart';
import '../views/list_pages/views/list_title.dart';
import '../views/skins_game/views/boys_game.dart';
import '../views/skins_game/views/girl_game.dart';

class Route {
  static MaterialPageRoute onpageroute(settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
      case BottomPage.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const BottomPage());
      case HomePage.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomePage(),
        );
      case SettingPage.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SettingPage());
      case InfoData.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const InfoData());

      case Collect.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Collect());

      case ConvertUs.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ConvertUs());
      case ConvertGems.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ConvertGems());
      // case FlipButton.routeName:
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => const FlipButton());
      case FlipGame.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const FlipGame());
      case ShuffleGame.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ShuffleGame());
      case BoysSkin.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => BoysSkin());
      case GirlSkin.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => GirlSkin());
      case PetSkin.routeName:
        return MaterialPageRoute(settings: settings, builder: (_) => PetSkin());
      case CollectionPage.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const CollectionPage());
      case CollectionDetails.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => CollectionDetails());
      case ListData.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ListData());
      case ListProgress.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ListProgress());
      case DailyConvert.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DailyConvert());

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Material(
            child: Center(
              child: Text("404 page not founded"),
            ),
          ),
        );
    }
  }
}
