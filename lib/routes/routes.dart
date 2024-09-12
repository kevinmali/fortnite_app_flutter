import 'package:flutter/material.dart';
import 'package:fortnite_app/views/game_screen/game_page.dart';
import 'package:fortnite_app/views/home_screen/home_page.dart';

import '../views/Vehicle_screen/vehicle_details.dart';
import '../views/Vehicle_screen/vehicle_page.dart';
import '../views/crew_screen/crew_charcater_data.dart';
import '../views/crew_screen/crew_details.dart';
import '../views/crew_screen/crew_page.dart';
import '../views/crew_screen/fev_emote.dart';
import '../views/crew_screen/next_button.dart';
import '../views/crew_screen/sticker.dart';
import '../views/crew_screen/sticker.data.dart';
import '../views/game_screen/game_details.dart';
import '../views/home_screen/splash_screen.dart';
import '../views/island_screen/island_page.dart';
import '../views/island_screen/land_details.dart';
import '../views/map_screen/map_details.dart';
import '../views/map_screen/map_page.dart';
import '../views/skin_screen/skin_details.dart';
import '../views/skin_screen/skin_page.dart';
import '../views/weapons_screen/weapon_details.dart';
import '../views/weapons_screen/weapon_page.dart';

class Route {
  static MaterialPageRoute onpageroute(settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SplashScreen());

      case HomePage.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => HomePage());
      case WeaponPage.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => WeaponPage());
      case WeaponDetails.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => WeaponDetails());
      case MapPage.routeName:
        return MaterialPageRoute(settings: settings, builder: (_) => MapPage());
      case MapDetails.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => MapDetails());

      case VehiclePage.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const VehiclePage());
      case VehicleDetails.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => VehicleDetails());
      case CrewScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const CrewScreen());
      case CrewDetails.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => CrewDetails(
                  crewData: settings.arguments as dynamic,
                ));
      case CrewData.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => CrewData());

      case StickerPage.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => StickerPage());

      case StickerData.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => StickerData());

      case SeeMorePage.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => SeeMorePage(
                  items: [],
                  category: '',
                ));

      case FevEmote.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => FevEmote());

      case IsLand.routeName:
        return MaterialPageRoute(settings: settings, builder: (_) => IsLand());

      case LandDetails.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => LandDetails());

      case SkinsPage.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SkinsPage());
      case SkinDetails.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SkinDetails());

      case GamePage.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => GamePage());

      case GameDetails.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => GameDetails());

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
