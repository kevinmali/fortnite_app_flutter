import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_convter/controller/api_controller.dart';
import 'package:gems_convter/model/global/varibales.dart';
import 'package:gems_convter/views/collection_page/views/collection_page.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../model/utils/text_style/style_them.dart';
import '../../counter/controller/gems_controller.dart';

class BoysSkin extends StatelessWidget {
  static const routeName = '/BoysSkin';
  BoysSkin({super.key});
  final GemsController gemsController = Get.put(GemsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ApiController(),
      builder: (controller) {
        controller.correctAnswers = Global.box.read('correctAnswers') ?? [];
        // print(controller.correctAnswers);
        return Scaffold(
          backgroundColor: AppTheme.background,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            backgroundColor: AppTheme.appBar,
            title: Text('Boy Skin', style: AppTheme.whiteBig),
            centerTitle: true,
          ),
          body: (controller.boys['Boys'] == null)
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: Get.height * 0.08,
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => Container(
                            width: 350,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppTheme.cont1,
                            ),
                            child: controller.isCorrect.value == true
                                ? CachedNetworkImage(
                                    imageUrl: controller.correctImage.value,
                                    height: 300,
                                    placeholder: (ctx, url) =>
                                        const CupertinoActivityIndicator(
                                      radius: 20,
                                    ),
                                  )
                                : ColorFiltered(
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcATop,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: controller.correctImage.value,
                                      height: 300,
                                      placeholder: (ctx, url) =>
                                          const CupertinoActivityIndicator(
                                        radius: 20,
                                      ),
                                    ),
                                  ),
                          )),
                      Obx(() => Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: controller.isCorrect.value == false
                                ? GestureDetector(
                                    onTap: () {
                                      // print(controller.wrongAttempts.value);
                                      gemsController.gemValue.value =
                                          Global.box.read('gems');
                                      if (gemsController.gemValue.value < 100) {
                                        Get.back();
                                        controller.resetSelection();
                                      } else {
                                        if (gemsController.skinGames < 20) {
                                          controller.resetSelection();
                                          Global.box.write(
                                              'gems',
                                              gemsController.gemValue.value -
                                                  100);
                                          gemsController.gemValue.value =
                                              Global.box.read('gems');
                                          Global.box.write(
                                              'skin',
                                              gemsController.skinGames.value +
                                                  1);
                                          gemsController.skinGames.value =
                                              Global.box.read('skin');
                                        } else {
                                          Get.back();
                                          Get.back();
                                          controller.resetSelection();
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 350,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppTheme.cont2,
                                      ),
                                      child: Text(
                                        'Try Again',
                                        style: AppTheme.info1,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.options.length,
                                    itemBuilder: (ctx, i) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.checkAnswer(
                                              controller.options[i]);
                                          if (controller.isCorrect.value ==
                                              true) {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 500), () {
                                              Get.back();
                                              controller.resetSelection();
                                              Get.snackbar('You Won This Game',
                                                  'Check Collection Page',
                                                  onTap: (val) {
                                                Get.toNamed(
                                                    CollectionPage.routeName);
                                              });
                                            });
                                          }
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          height: 80,
                                          width: 350,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: controller.selectedOption
                                                    .value.isEmpty
                                                ? AppTheme.cont2
                                                : controller.selectedOption
                                                            .value ==
                                                        controller.options[i]
                                                    ? (controller
                                                            .isCorrect.value
                                                        ? Colors.green
                                                        : Colors.red)
                                                    : AppTheme.cont2,
                                          ),
                                          child: Text(
                                            controller.options[i],
                                            style: AppTheme.details,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          )),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
