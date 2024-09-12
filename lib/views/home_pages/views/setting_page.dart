import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import '../../../model/global/varibales.dart';
import '../../../model/utils/text_style/style_them.dart';
import '../controller/setting_controller.dart';
import 'info_details.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  static const routeName = '/SettingPage';
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AllData(context: context),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppTheme.background,
            appBar: AppBar(
              backgroundColor: AppTheme.appBar,
              title: Text(
                'Setting',
                style: AppTheme.whiteBig,
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Global.audioVibrate == true) {
                        Global.player.setAsset(Global.audio);
                        Global.player.play();
                      } else {
                        Vibration.vibrate(duration: 300);
                      }
                      Get.toNamed(InfoData.routeName);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.center,
                      height: Get.height * 0.1,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                          color: AppTheme.cont2,
                          border: Border.all(width: 2, color: Colors.white24),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Info This Game",
                            style: AppTheme.whiteBig,
                          ),
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: Get.height * 0.04,
                            color: Colors.white24,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.center,
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                        color: AppTheme.cont2,
                        border: Border.all(width: 2, color: Colors.white24),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Sound",
                          style: AppTheme.whiteBig,
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Switch(
                          activeColor: Colors.white,
                          focusColor: Colors.white24,
                          value: Global.audioVibrate,
                          onChanged: (val) {
                            if (Global.audioVibrate == true) {
                              Vibration.vibrate(duration: 300);
                            } else {
                              Global.player.setAsset(Global.audio);
                              Global.player.play();
                            }
                            Global.audioVibrate = val;
                            Global.box.write('audioVibrate', val);
                            controller.update();
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (Global.audioVibrate == true) {
                        Global.player.setAsset(Global.audio);
                        Global.player.play();
                      } else {
                        Vibration.vibrate(duration: 300);
                      }
                      String shareUr = 'https://clashhero.in/support/index.php';
                      controller.url(shareUr);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.center,
                      height: Get.height * 0.1,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white24),
                          color: AppTheme.cont2,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "contactUs",
                            style: AppTheme.whiteBig,
                          ),
                          Icon(
                            Icons.contact_mail,
                            size: Get.height * 0.06,
                            color: Colors.white24,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (Global.audioVibrate == true) {
                        Global.player.setAsset(Global.audio);
                        Global.player.play();
                      } else {
                        Vibration.vibrate(duration: 300);
                      }
                      String polUr = 'https://clashhero.in/privacy.php';
                      controller.url(polUr);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.center,
                      height: Get.height * 0.1,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                          color: AppTheme.cont2,
                          border: Border.all(width: 2, color: Colors.white24),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Privacy Polish",
                            style: AppTheme.whiteBig,
                          ),
                          Icon(
                            Icons.info,
                            size: Get.height * 0.06,
                            color: Colors.white24,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (Global.audioVibrate == true) {
                        Global.player.setAsset(Global.audio);
                        Global.player.play();
                      } else {
                        Vibration.vibrate(duration: 300);
                      }
                      controller.onWillPop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.center,
                      height: Get.height * 0.1,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                          color: AppTheme.cont2,
                          border: Border.all(width: 2, color: Colors.white24),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "ExitApp",
                            style: AppTheme.whiteBig,
                          ),
                          Icon(
                            Icons.exit_to_app,
                            size: Get.height * 0.06,
                            color: Colors.white24,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
