import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_convter/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import '../../../controller/api_controller.dart';
import '../../../model/global/varibales.dart';

class GemsController extends GetxController {
  var name = 'UserName'.obs;
  var selectedImageUrl = ''.obs;
  var selectedIndex = (-1).obs;
  var remainingChances = 3;
  int remainingFlip = 3;
  var dollar = 0.0.obs;
  var gems = 0.obs;
  var dailyGems = 500.obs;
  var clickTap = 0.obs;
  var totalGems = 0.obs;
  var skinGames = 0.obs;
  var counter = 0.obs;
  var gemValue = 100.obs;
  var bClub = 0.obs;
  var tBc = 0.obs;
  var oBc = 0.obs;

  TextEditingController textEditingController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final ApiController apiController = Get.put(ApiController());

  @override
  void onInit() {
    super.onInit();
    gemValue.value = Global.box.read('gems') ?? 100;
    dailyGems.value = Global.box.read('daily') ?? 500;
    clickTap.value = Global.box.read('clickTap') ?? 0;
    totalGems.value = Global.box.read('totalGems') ?? 0;
    skinGames.value = Global.box.read('skin') ?? 0;
    counter.value = Global.box.read('count') ?? 0;
    remainingChances = Global.box.read('remainingChances') ?? 3;
    remainingFlip = Global.box.read('remainingFlip') ?? 3;
    apiController.correctAnswers = Global.box.read('correctAnswers') ?? [];
    selectedImageUrl.value = Global.box.read('selectedImageUrl') ?? '';
    name.value = Global.box.read('userName') ?? 'Enter Name';
    _checkAndResetDailyGems();
    // checkAndResetDailyShuffle();
  }

  void _checkAndResetDailyGems() {
    DateTime now = DateTime.now();

    String todayKey = _dateKey(now);

    String lastReset = Global.box.read('lastReset') ?? '';
    if (lastReset != todayKey) {
      dailyGems.value = 500;
      remainingChances = 3;
      remainingFlip = 3;
      Global.box.write('daily', dailyGems.value);
      Global.box.write('remainingChances', remainingChances);
      Global.box.write('remainingFlip', remainingFlip);
      Global.box.write('lastReset', todayKey);
    }
  }

  String _dateKey(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  void collectGem() {
    if (dailyGems.value > 0) {
      gemValue.value += 1;
      clickTap.value += 1;
      totalGems.value += 1;
      dailyGems.value -= 1;
      Global.box.write('gems', gemValue.value);
      Global.box.write('clickTap', clickTap.value);
      Global.box.write('totalGems', totalGems.value);
      Global.box.write('daily', dailyGems.value);
    }
  }

  // void useDailyGem() {
  //   if (dailyGems.value > 0) {
  //     dailyGems.value -= 1;
  //     Global.box.write('daily', dailyGems.value);
  //   }
  // }

  double get progress => (500 - dailyGems.value) / 500;

  void updateDollarAmount(String value) {
    double dollars = double.tryParse(value) ?? 0.0;
    dollar.value = dollars;
    gems.value = (dollars * 80).toInt();
  }

  void updateDollarDaily(String value) {
    double dollars = double.tryParse(value) ?? 0.0;
    dollar.value = dollars;
    bClub.value = (dollars * 15).toInt();
  }

  void updateDollarTBc(String value) {
    double dollars = double.tryParse(value) ?? 0.0;
    dollar.value = dollars;
    tBc.value = (dollars * 33).toInt();
  }

  void updateDollarOBc(String value) {
    double dollars = double.tryParse(value) ?? 0.0;
    dollar.value = dollars;
    oBc.value = (dollars * 73).toInt();
  }

  void updateGemAmount(String value) {
    int gem = int.tryParse(value) ?? 0;
    gems.value = gem;
    dollar.value = gem / 80.0;
  }

  void editNameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: apiController.correctAnswers.isEmpty
              ? SizedBox(
                  child: Text(
                    'Add Collection',
                    style: AppTheme.info,
                  ),
                )
              : SizedBox(
                  width: 200,
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: apiController.correctAnswers.length,
                    itemBuilder: (ctx, i) {
                      return GestureDetector(
                        onTap: () {
                          selectedIndex.value = i; // Set the selected index
                          selectedImageUrl.value =
                              apiController.correctAnswers[i]
                                  ['image']; // Store the selected image URL
                        },
                        child: Obx(
                          () => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedIndex.value == i
                                    ? Colors.grey
                                    : Colors.transparent,
                                width: 5,
                              ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: apiController.correctAnswers[i]
                                  ['image'],
                              // height: selectedIndex.value == i ? 120 : 60,
                              // fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  const CupertinoActivityIndicator(radius: 20),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          content: TextFormField(
            cursorColor: Colors.black,
            controller: nameController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter Your Name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                if (Global.audioVibrate == true) {
                  Global.player.setAsset(Global.audio);
                  Global.player.play();
                } else {
                  Vibration.vibrate(duration: 300);
                }
              },
              child: Text(
                'No',
                style: AppTheme.info,
              ),
            ),
            TextButton(
              onPressed: () {
                final enteredName = nameController.text.trim();
                if (enteredName.isNotEmpty) {
                  Global.box.write('userName', enteredName);
                  name.value = enteredName;
                  update();
                }
                if (selectedImageUrl.value.isNotEmpty) {
                  Global.box.write('selectedImageUrl', selectedImageUrl.value);
                  update();
                }
                Get.back();
              },
              child: Text(
                "Save",
                style: AppTheme.info,
              ),
            ),
          ],
        );
      },
    );
    update();
  }
}
