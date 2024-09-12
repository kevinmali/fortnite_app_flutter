import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import '../../../model/global/varibales.dart';
import '../../../model/utils/text_style/style_them.dart';
import '../../counter/controller/gems_controller.dart';

class ListData extends StatelessWidget {
  static const routeName = '/ListData';
  const ListData({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GemsController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppTheme.background,
            appBar: AppBar(
              backgroundColor: AppTheme.appBar,
              title: Text(
                'Stats',
                style: AppTheme.whiteBig,
              ),
              centerTitle: true,
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
                  Container(
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
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total Clicks',
                              style: AppTheme.whiteBig,
                            ),
                            Obx(
                              () => Text(
                                '${controller.clickTap.value}',
                                style: AppTheme.whiteBig,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total Skin Game',
                              style: AppTheme.whiteBig,
                            ),
                            Obx(
                              () => Text(
                                '${controller.skinGames.value}',
                                style: AppTheme.whiteBig,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total Counter',
                              style: AppTheme.whiteBig,
                            ),
                            Obx(
                              () => Text(
                                '${controller.counter.value}',
                                style: AppTheme.whiteBig,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                            'asset/images/gems.png',
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Collected Gems',
                              style: AppTheme.whiteBig,
                            ),
                            Obx(
                              () => Text(
                                '${controller.totalGems.value}',
                                style: AppTheme.whiteBig,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
