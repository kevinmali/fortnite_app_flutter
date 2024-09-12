import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';
import '../../../model/global/varibales.dart';
import '../../../model/utils/text_style/style_them.dart';

class AllData extends GetxController {
  Future<void> url(String link) async {
    if (!await launchUrl(
      Uri.parse(link),
    )) {
      throw Exception('Could not launch ');
    }
  }

  @override
  void onInit() {
    Global.audioVibrate = Global.box.read('audioVibrate') ?? true;
    // TODO: implement onInit
    super.onInit();
  }

  final BuildContext context;
  AllData({required this.context});
  Future<bool> onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => Center(
            child: Container(
              height: Get.height * 0.2,
              width: Get.width * 0.9,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24, width: 2),
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
                // color: Colors.white60,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Are you sure?',
                    style: AppTheme.whiteBig,
                  ),
                  Text(
                    'Do you want to exit the app?',
                    style: AppTheme.whiteBig,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (Global.audioVibrate == true) {
                            Global.player.setAsset(Global.audio);
                            Global.player.play();
                          } else {
                            Vibration.vibrate(duration: 300);
                          }
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          'No',
                          style: AppTheme.info,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Global.player.setAsset(Global.audio);
                          Global.player.play();
                          Navigator.pop(exit(0));
                        },
                        child: Text(
                          'Yes',
                          style: AppTheme.info,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )) ??
        false;
  }
}
