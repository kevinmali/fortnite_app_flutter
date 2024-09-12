import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_convter/controller/api_controller.dart';
import 'package:gems_convter/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

import '../../../model/global/varibales.dart';
import 'collection_details.dart';

class CollectionPage extends StatelessWidget {
  static const routeName = '/CollectionPage';
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ApiController(),
        builder: (controller) {
          // print(controller.correctAnswers[0]);
          controller.correctAnswers = Global.box.read('correctAnswers') ?? [];
          return Scaffold(
            backgroundColor: AppTheme.background,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: AppTheme.appBar,
              title: Text(
                'Collection',
                style: AppTheme.whiteBig,
              ),
              centerTitle: true,
            ),
            body: controller.correctAnswers.isEmpty
                ? Center(
                    child: Text(
                      'No Collection',
                      style: AppTheme.info1,
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      mainAxisExtent: Get.height * 0.24,
                    ),
                    itemCount: controller.correctAnswers.length,
                    itemBuilder: (ctx, i) {
                      // print(controller.correctAnswers.length);
                      return Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppTheme.cont1,
                          border: Border.all(
                            color: controller.selectedIndex.value == i
                                ? Colors.green
                                : Colors.white24,
                            width: controller.selectedIndex.value == i ? 3 : 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (Global.audioVibrate == true) {
                                    Global.player.setAsset(Global.audio);
                                    Global.player.play();
                                  } else {
                                    Vibration.vibrate(duration: 300);
                                  }
                                  controller.selectAnswer(
                                      controller.correctAnswers[i], i);
                                },
                                child: Hero(
                                  tag: controller.correctAnswers[i]['image'],
                                  child: CachedNetworkImage(
                                    imageUrl: controller.correctAnswers[i]
                                        ['image'],
                                    height: 140,
                                    placeholder: (context, url) =>
                                        const CupertinoActivityIndicator(
                                      radius: 20,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (Global.audioVibrate == true) {
                                  Global.player.setAsset(Global.audio);
                                  Global.player.play();
                                } else {
                                  Vibration.vibrate(duration: 300);
                                }
                                controller.selectAnswer(
                                    controller.correctAnswers[i], i);
                                Get.toNamed(CollectionDetails.routeName,
                                    arguments: controller.correctAnswers[i]);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 2, left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(18),
                                    bottomLeft: Radius.circular(18),
                                  ),
                                  color: AppTheme.cont,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      controller.correctAnswers[i]['Name']
                                                  .length <=
                                              8
                                          ? '${controller.correctAnswers[i]['Name']}'
                                          : controller.correctAnswers[i]['Name']
                                              .toString()
                                              .substring(0, 8),
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.details,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
          );
        });
  }
}
