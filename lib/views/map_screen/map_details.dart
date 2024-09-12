import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../controller/map_controller.dart';
import '../../model/utils/text_style/style_them.dart';

class MapDetails extends StatelessWidget {
  static const routeName = '/MapDetails';
  MapDetails({super.key});
  final mapData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MapController(),
        builder: (controller) {
          return (mapData == null)
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: Get.height * 0.12,
                  ),
                )
              : Scaffold(
                  backgroundColor: AppTheme.appBar,
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
                      'Map Detail',
                      style: AppTheme.info1,
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Transform.scale(
                        scale: controller.scale,
                        child: InteractiveViewer(
                          panEnabled: false,
                          child: CachedNetworkImage(
                            width: Get.width,
                            fit: BoxFit.fill,
                            imageUrl: "${mapData['urlPOI']}",
                            errorWidget: (context, url, error) => const Center(
                                child: Icon(Icons.error,
                                    color: Colors.white, size: 25)),
                            placeholder: (context, url) => const Center(
                                child: CupertinoActivityIndicator(
                                    color: Colors.white, radius: 10)),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.zoom_in,
                              size: 36,
                              color: Color(0xffE2CBA6),
                            ),
                            onPressed: controller.zoomIn,
                          ),
                          GestureDetector(
                            onTap: () {
                              String map = mapData['urlPOI'];
                              controller.saveNetworkImage(map);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: Get.height * 0.04,
                              width: Get.width * 0.3,
                              decoration: BoxDecoration(
                                color: AppTheme.cont2.withOpacity(0.8),
                                // color: const Color(0xff9DDE8B),
                                // boxShadow: const [
                                //   BoxShadow(
                                //       spreadRadius: 3,
                                //       blurRadius: 5,
                                //       color: Colors.white),
                                // ],
                                border:
                                    Border.all(width: 2, color: Colors.white),
                              ),
                              child: Text(
                                'Download',
                                style: AppTheme.info,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.zoom_out,
                              size: 36,
                              color: Color(0xffE2CBA6),
                            ),
                            onPressed: controller.zoomOut,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        });
  }
}
