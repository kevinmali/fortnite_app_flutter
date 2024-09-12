import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/controller/map_controller.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';

class StickerData extends StatelessWidget {
  static const routeName = '/StickerData';
  const StickerData({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic stickerData = Get.arguments;
    // print(stickerData);
    return GetBuilder(
        init: MapController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppTheme.cont,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.cont2,
                ),
              ),
              title: Text(
                'Sticker Data',
                style: AppTheme.info1,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: Get.width * 0.7,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.cont2)),
                    child: CachedNetworkImage(
                      imageUrl: '$stickerData',
                      fit: BoxFit.cover,
                      height: Get.height * 0.3,
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(
                        radius: 5,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.saveNetworkImage(stickerData);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height * 0.04,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            border: Border.all(width: 2, color: AppTheme.cont2),
                          ),
                          child: Text(
                            'Download',
                            style: AppTheme.info,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.shareImage(stickerData);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height * 0.04,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            border: Border.all(width: 2, color: AppTheme.cont2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Share',
                                style: AppTheme.name1,
                              ),
                              const Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
