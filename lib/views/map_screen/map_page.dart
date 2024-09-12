import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/controller/api_controller.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:fortnite_app/views/map_screen/map_details.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MapPage extends StatelessWidget {
  static const routeName = '/MapPage';
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ApiController(),
        builder: (controller) {
          return Scaffold(
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
                'Map',
                style: AppTheme.info1,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: controller.map.isEmpty
                ? Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.white,
                      size: Get.height * 0.12,
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.map.length,
                    // padding: EdgeInsets.all(10),
                    itemBuilder: (ctx, i) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            MapDetails.routeName,
                            arguments: controller.map[i],
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3),
                            // image: const DecorationImage(
                            //   image: AssetImage(
                            //       'asset/images/weapons_images/Classic Background.JPG'),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: controller.map[i]['url'],
                                height: 120,
                                placeholder: (context, url) =>
                                    const CupertinoActivityIndicator(
                                  radius: 5,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    '${controller.map[i]['releaseDate']}',
                                    style: AppTheme.info1,
                                  ),
                                  Text(
                                    '${controller.map[i]['patchVersion']}',
                                    style: AppTheme.whiteBig,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.forward,
                                    color: AppTheme.cont2,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
          );
        });
  }
}
