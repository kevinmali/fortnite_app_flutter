import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_convter/controller/api_controller.dart';
import 'package:gems_convter/views/skins_game/views/pet_game.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import '../../../model/global/varibales.dart';
import '../../../model/utils/text_style/style_them.dart';
import '../../coin_game/views/collect_page.dart';
import '../../coin_game/views/flip_page/views/flip_game.dart';
import '../../coin_game/views/shuffle_game.dart';
import '../../counter/controller/gems_controller.dart';
import '../../counter/views/convert_daily.dart';
import '../../counter/views/convert_gems.dart';
import '../../counter/views/convert_us.dart';
import '../../skins_game/views/boys_game.dart';
import '../../skins_game/views/girl_game.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';

  HomePage({super.key});
  final GemsController gemsController = Get.put(GemsController());
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.appBar,
        title: Text("Home", style: AppTheme.whiteBig),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Image.asset('asset/images/gems.png', height: 20),
              const SizedBox(width: 5),
              Obx(
                () => Text('${gemsController.gemValue.value}',
                    style: AppTheme.details),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      if (gemsController.selectedImageUrl.isEmpty)
                        const CircleAvatar(
                          radius: 40,
                          child: Text("image"),
                        )
                      else
                        CircleAvatar(
                          radius: 40,
                          child: CachedNetworkImage(
                            imageUrl: gemsController.selectedImageUrl.value,
                            height: 60,
                            // fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CupertinoActivityIndicator(
                              radius: 20,
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        gemsController.name.value,
                        style: AppTheme.info1,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          if (Global.audioVibrate == true) {
                            Global.player.setAsset(Global.audio);
                            Global.player.play();
                          } else {
                            Vibration.vibrate(duration: 300);
                          }
                          gemsController.editNameDialog(context);
                          gemsController.update();
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SizedBox(
                child: Column(
                  children: [
                    _buildHeader('Counters'),
                    const SizedBox(height: 10),
                    _buildConversionOptions(
                        ['Daily Counter', 'Gems to us', 'Us to gems']),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Column(
                  children: [
                    _buildHeader('Coin Games'),
                    const SizedBox(height: 10),
                    _buildConversionOptionsContainer(
                      ['Daily Gems', 'Flip Game', 'Shuffle Game'],
                      [
                        'asset/images/play.jpg',
                        'asset/images/price.jpg',
                        'asset/images/shuffle.jpg',
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: Column(
                  children: [
                    _buildHeader('Get Skins Games'),
                    const SizedBox(height: 10),
                    _buildConversionOptionsContainer(
                      ['Price 100', 'Price 150', 'Price 200'],
                      [
                        'asset/images/boys.jpeg',
                        'asset/images/girl.jpeg',
                        'asset/images/pet.jpeg',
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Row(
      children: [
        Text('$title ', style: AppTheme.info1),
        const Icon(Icons.arrow_forward, size: 30, color: Colors.white),
      ],
    );
  }

  Widget _buildConversionOptions(List<String> options) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: options.map((option) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                if (Global.audioVibrate == true) {
                  Global.player.setAsset(Global.audio);
                  Global.player.play();
                } else {
                  Vibration.vibrate(duration: 300);
                }
                if (option == 'Daily Counter') {
                  Get.toNamed(DailyConvert.routeName)?.then(
                    (value) {
                      gemsController.textEditingController.clear();
                      gemsController.dollar.value = 0.0;
                      gemsController.tBc.value = 0;
                      gemsController.oBc.value = 0;
                      gemsController.bClub.value = 0;
                    },
                  );
                } else if (option == 'Gems to us') {
                  Get.toNamed(ConvertGems.routeName)?.then(
                    (value) {
                      gemsController.textEditingController.clear();
                      gemsController.dollar.value = 0.0;
                      gemsController.gems.value = 0;
                    },
                  );
                } else if (option == 'Us to gems') {
                  Get.toNamed(ConvertUs.routeName)?.then(
                    (value) {
                      gemsController.textEditingController.clear();
                      gemsController.gems.value = 0;
                      gemsController.dollar.value = 0.0;
                    },
                  );
                }
              },
              child: CircleAvatar(
                backgroundColor: Colors.white24,
                radius: 55,
                child: Image.asset('asset/images/convertimage.png'),
              ),
            ),
            Text(
              option,
              style: AppTheme.seeMore,
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildConversionOptionsContainer(
      List<String> options, List<String> imgPaths) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(options.length, (index) {
        return GestureDetector(
          onTap: () {
            if (Global.audioVibrate == true) {
              Global.player.setAsset(Global.audio);
              Global.player.play();
            } else {
              Vibration.vibrate(duration: 300);
            }
            if (options[index] == 'Price 100' &&
                gemsController.gemValue.value >= 100) {
              // gemsController.gemValue.value - 100;
              if (gemsController.skinGames.value < 20) {
                Global.box.write('gems', gemsController.gemValue.value - 100);
                Global.box.write('skin', gemsController.skinGames.value + 1);
                gemsController.skinGames.value = Global.box.read('skin');
                // print(gemsController.skinGames.value);
                Get.toNamed(BoysSkin.routeName)?.then(
                  (value) {
                    gemsController.gemValue.value = Global.box.read('gems');
                    // gemsController.skinGames.value = Global.box.read('skin');
                  },
                );
              } else {
                Get.snackbar('Collect Your Task', 'You Complete 20 Match!',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.white24,
                    colorText: Colors.white);
              }
            } else if (options[index] == 'Daily Gems') {
              Get.toNamed(Collect.routeName,
                  arguments: apiController.correctAnswers.isEmpty
                      ? null
                      : apiController.correctAnswers[0]);
            } else if (options[index] == 'Flip Game') {
              gemsController.remainingFlip =
                  Global.box.read('remainingFlip') ?? 3;
              if (gemsController.remainingFlip > 0) {
                Get.toNamed(FlipGame.routeName);
              } else {
                Get.snackbar('No More Chances', 'You can try again tomorrow!',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white);
              }
            } else if (options[index] == 'Shuffle Game') {
              gemsController.remainingChances =
                  Global.box.read('remainingChances') ?? 3;
              if (gemsController.remainingChances > 0) {
                Get.toNamed(ShuffleGame.routeName);
              } else {
                Get.snackbar('No More Chances', 'You can try again tomorrow!',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white);
              }
            } else if (options[index] == 'Price 150' &&
                gemsController.gemValue.value >= 150) {
              if (gemsController.skinGames.value < 20) {
                Global.box.write('skin', gemsController.skinGames.value + 1);
                gemsController.skinGames.value = Global.box.read('skin');
                Global.box.write('gems', gemsController.gemValue.value - 150);
                Get.toNamed(GirlSkin.routeName)?.then(
                  (value) {
                    gemsController.gemValue.value = Global.box.read('gems');
                    // gemsController.skinGames = Global.box.read('skin');
                  },
                );
              } else {
                Get.snackbar('Collect Your Task', 'You Complete 20 Match!',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.white24,
                    colorText: Colors.white);
              }
            } else if (options[index] == 'Price 200' &&
                gemsController.gemValue.value >= 200) {
              // gemsController.gemValue.value - 100;
              if (gemsController.skinGames.value < 20) {
                Global.box.write('gems', gemsController.gemValue.value - 200);
                Global.box.write('skin', gemsController.skinGames.value + 1);
                gemsController.skinGames.value = Global.box.read('skin');
                // print(gemsController.skinGames.value);
                Get.toNamed(PetSkin.routeName)?.then(
                  (value) {
                    gemsController.gemValue.value = Global.box.read('gems');
                    // gemsController.skinGames.value = Global.box.read('skin');
                  },
                );
              } else {
                Get.snackbar('Collect Your Task', 'You Complete 20 Match!',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.white24,
                    colorText: Colors.white);
              }
            } else {
              Get.snackbar(
                '${gemsController.gemValue.value}',
                'Play A Game Total ${options[index]} Gems',
                colorText: Colors.white,
              );
            }
          },
          child: Column(
            children: [
              Container(
                height: 125,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imgPaths[index],
                    height: 102,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(options[index], style: AppTheme.seeMore),
            ],
          ),
        );
      }),
    );
  }
}
