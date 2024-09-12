import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vibration/vibration.dart';
import '../../../model/global/varibales.dart';
import '../../../model/utils/text_style/style_them.dart';
import '../../counter/controller/gems_controller.dart';

class ListProgress extends StatelessWidget {
  static const routeName = '/ListProgress';
  const ListProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GemsController>(
      init: GemsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppTheme.background,
          appBar: AppBar(
            backgroundColor: AppTheme.appBar,
            title: Text(
              'Quests',
              style: AppTheme.whiteBig,
            ),
            centerTitle: true,
            actions: [
              Row(
                children: [
                  Image.asset('asset/images/gems.png', height: 20),
                  const SizedBox(width: 5),
                  Obx(
                    () => Text('${controller.gemValue.value}',
                        style: AppTheme.details),
                  ),
                ],
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      if (controller.selectedImageUrl.isEmpty)
                        const CircleAvatar(
                          radius: 30,
                          child: Text("image"),
                        )
                      else
                        Obx(
                          () => CircleAvatar(
                            radius: 40,
                            child: CachedNetworkImage(
                              imageUrl: controller.selectedImageUrl.value,
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
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => Text(
                          controller.name.value,
                          style: AppTheme.info1,
                        ),
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
                          print('click');
                          controller.editNameDialog(context);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.grey,
                        ),
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
                    if (controller.clickTap.value >= 1000) {
                      Global.box
                          .write('gems', controller.gemValue.value + 1500);
                      controller.gemValue.value = Global.box.read('gems');
                      controller.clickTap.value = 0;
                      Global.box.write('clickTap', controller.clickTap.value);
                      controller.clickTap.value = Global.box.read('clickTap');
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.cont,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'asset/images/play.jpg',
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Clicks in click',
                                style: AppTheme.whiteBig,
                              ),
                              Obx(
                                () => LinearPercentIndicator(
                                  lineHeight: 14.0,
                                  percent: controller.clickTap.value / 1000,
                                  backgroundColor: Colors.grey[200]!,
                                  barRadius: const Radius.circular(5),
                                  progressColor: Colors.green,
                                  center: Text(
                                    "${(controller.clickTap.value)}/1000",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Text(
                          '+1500',
                          style: AppTheme.greenText,
                        ),
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
                    if (controller.skinGames.value >= 20) {
                      Global.box.write('gems', controller.gemValue.value + 500);
                      controller.gemValue.value = Global.box.read('gems');
                      controller.skinGames.value = 0;
                      Global.box.write('skin', controller.skinGames.value);

                      controller.skinGames.value = Global.box.read('skin');
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.cont,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white60,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'asset/images/noFilter.jpg',
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Play Skin Game',
                                style: AppTheme.whiteBig,
                              ),
                              Obx(
                                () => LinearPercentIndicator(
                                  lineHeight: 14,
                                  barRadius: const Radius.circular(5),
                                  percent: controller.skinGames.value / 20,
                                  backgroundColor: Colors.grey[200]!,
                                  progressColor: Colors.green,
                                  center: Text(
                                    "${(controller.skinGames.value)}/20",
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '+500',
                          style: AppTheme.greenText,
                        ),
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
                    if (controller.counter.value >= 40) {
                      Global.box.write('gems', controller.gemValue.value + 200);
                      controller.gemValue.value = Global.box.read('gems');
                      controller.counter.value = 0;
                      Global.box.write('count', controller.counter.value);

                      controller.counter.value = Global.box.read('count');
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.cont,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black26,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'asset/images/convertimage.png',
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Count 40 Times',
                                style: AppTheme.whiteBig,
                              ),
                              Obx(
                                () => LinearPercentIndicator(
                                  lineHeight: 14,
                                  barRadius: const Radius.circular(5),
                                  percent: controller.counter.value /
                                      40, // Adjust max value as needed
                                  backgroundColor: Colors.grey[200]!,
                                  progressColor: Colors.green,
                                  center: Text(
                                    "${(controller.counter.value)}/40",
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '+200',
                          style: AppTheme.greenText,
                        ),
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
                    if (controller.totalGems.value >= 1000) {
                      Global.box
                          .write('gems', controller.gemValue.value + 1000);
                      controller.gemValue.value = Global.box.read('gems');
                      controller.totalGems.value = 0;
                      Global.box.write('totalGems', controller.totalGems.value);
                      controller.totalGems.value = Global.box.read('totalGems');
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppTheme.cont,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'asset/images/gems.png',
                            height: 60,
                            width: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ' Collect Gem',
                                style: AppTheme.whiteBig,
                              ),
                              Obx(
                                () => LinearPercentIndicator(
                                  lineHeight: 16.0,
                                  percent: controller.totalGems.value / 1000,
                                  backgroundColor: Colors.grey[200]!,
                                  barRadius: const Radius.circular(5),
                                  progressColor: Colors.green,
                                  center: Text(
                                    "${(controller.totalGems.value)}/1000",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Text(
                          '+1000',
                          style: AppTheme.greenText,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
