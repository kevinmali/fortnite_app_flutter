import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:fortnite_app/views/game_screen/game_page.dart';
import 'package:fortnite_app/views/map_screen/map_page.dart';
import 'package:get/get.dart';
import '../../controller/api_controller.dart';
import '../Vehicle_screen/vehicle_page.dart';
import '../crew_screen/sticker.dart';
import '../island_screen/island_page.dart';
import '../skin_screen/skin_page.dart';
import '../weapons_screen/weapon_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';
  HomePage({super.key});
  final List name = [
    'Weapon',
    'Maps',
    'Vehicle',
    'Sticker',
    'Island',
    'Skins',
    'Game'
  ];
  final List image = [
    'asset/images/home_images/Candy Corn LMG.PNG',
    'asset/images/home_images/map.png',
    'asset/images/home_images/Nitro Fang.PNG',
    'asset/images/home_images/stickers.PNG',
    'asset/images/home_images/land.png',
    'asset/images/home_images/skin.PNG',
    'asset/images/home_images/game.PNG'
  ];
  final List backImage = [
    'asset/images/home_images/Rectangle 12.png',
    'asset/images/home_images/Rectangle 7.png',
    'asset/images/home_images/Rectangle 11.png',
    'asset/images/home_images/Rectangle 9.png',
    'asset/images/home_images/Rectangle 11.png',
    'asset/images/home_images/Rectangle 7.png',
    'asset/images/home_images/Rectangle 12.png'
  ];
  final List lineImage = [
    'asset/images/home_images/Rectangle 13.png',
    'asset/images/home_images/Rectangle 14.png',
    'asset/images/home_images/Rectangle 15.png',
    'asset/images/home_images/Rectangle 16.png',
    'asset/images/home_images/Rectangle 15.png',
    'asset/images/home_images/Rectangle 14.png',
    'asset/images/home_images/Rectangle 13.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ApiController(),
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'asset/images/home_images/Beast Boy Background.PNG'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
              backgroundColor: AppTheme.cont,
              appBar: AppBar(
                title: Text(
                  'HomePage',
                  style: AppTheme.info1,
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
              ),
              body: ListView.builder(
                // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                // ),
                padding: const EdgeInsets.symmetric(vertical: 40),
                itemCount: name.length,
                itemBuilder: (context, i) {
                  // print(controller.apiWeapon[i]['images']['background']);
                  return name.isEmpty
                      ? SizedBox(
                          child: Text(
                            "no data$i",
                            style: AppTheme.info1,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            // Get.toNamed("/CrewPage");
                            if (i == 0) {
                              // print('click i $i');
                              Get.toNamed(WeaponPage.routeName);
                            } else if (i == 1) {
                              // print('click i $i');
                              Get.toNamed(MapPage.routeName);
                            } else if (i == 2) {
                              // print('click i $i');
                              Get.toNamed(VehiclePage.routeName);
                            } else if (i == 3) {
                              // print('click i $i');
                              Get.toNamed(StickerPage.routeName);
                            } else if (i == 4) {
                              // print('click i $i');
                              Get.toNamed(IsLand.routeName);
                            } else if (i == 5) {
                              // print('click i $i');
                              Get.toNamed(SkinsPage.routeName);
                            } else if (i == 6) {
                              // print('click i $i');
                              Get.toNamed(GamePage.routeName);
                            }
                          },
                          child: AnimationConfiguration.staggeredList(
                            position: i,
                            duration: const Duration(milliseconds: 1600),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      lineImage[i],
                                      height: 4,
                                      width: Get.width,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 2, bottom: 20),
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      alignment: Alignment.center,
                                      height: Get.height * 0.08,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        // borderRadius:
                                        //     BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            '${backImage[i]}',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        // border: Border.all(
                                        //   color: AppTheme.cont2,
                                        //   width: 2,
                                        // ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(image[i]),
                                          Text(
                                            name[i],
                                            style: AppTheme.info1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                },
              )),
        );
      },
    );
  }
}
