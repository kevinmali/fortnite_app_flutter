import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/controller/api_controller.dart';
import 'package:fortnite_app/controller/map_controller.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:fortnite_app/views/game_screen/game_details.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GamePage extends StatelessWidget {
  static const routeName = '/GamePage';

  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ApiController(),
      builder: (controller) {
        return GetBuilder(
            init: MapController(),
            builder: (mapController) {
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
                    'Game',
                    style: AppTheme.info1,
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                ),
                body: (controller.game.isEmpty)
                    ? Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.game.length,
                        itemBuilder: (ctx, i) {
                          bool isEven = i % 2 == 0;
                          return GestureDetector(
                            onTap: () {
                              mapController.incrementViews();
                              mapController.incrementLikes(
                                  '${controller.game[i]['id']}');
                              mapController
                                  .fetchRandomData(controller.game[i]['id']);
                              mapController.update();
                              Get.toNamed(
                                GameDetails.routeName,
                                arguments: controller.game[i],
                              );
                            },
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              width: Get.width,
                              height: Get.height * 0.18,
                              margin: const EdgeInsets.only(bottom: 10),
                              // padding: const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                              ),
                              child: Stack(
                                children: [
                                  if (isEven) ...[
                                    _buildTextColumn(controller, i,
                                        alignment: CrossAxisAlignment.start),
                                    _buildImageContainer(
                                      controller,
                                      i,
                                      alignment: Alignment.centerRight,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(80),
                                        bottomLeft: Radius.circular(80),
                                      ),
                                    ),
                                  ] else ...[
                                    _buildImageContainer(
                                      controller,
                                      i,
                                      alignment: Alignment.centerLeft,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(80),
                                        bottomRight: Radius.circular(80),
                                      ),
                                    ),
                                    _buildTextColumn(
                                      controller,
                                      i,
                                      alignment: CrossAxisAlignment.end,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              );
            });
      },
    );
  }

  Widget _buildTextColumn(ApiController controller, int i,
      {required CrossAxisAlignment alignment}) {
    return Align(
      alignment: alignment == CrossAxisAlignment.start
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: alignment,
        children: [
          Text(
            controller.game[i]['id'].toString().length > 16
                ? controller.game[i]['id'].toString().substring(0, 16)
                : controller.game[i]['id'].toString(),
            textAlign: alignment == CrossAxisAlignment.start
                ? TextAlign.left
                : TextAlign.right,
            style: AppTheme.name1,
          ),
          Text(
            controller.game[i]['name'].toString().length > 15
                ? controller.game[i]['name'].toString().substring(0, 15)
                : controller.game[i]['name'].toString(),
            textAlign: alignment == CrossAxisAlignment.start
                ? TextAlign.left
                : TextAlign.right,
            style: AppTheme.name1,
          ),
          Text(
            '${controller.game[i]['gameType']}',
            textAlign: alignment == CrossAxisAlignment.start
                ? TextAlign.left
                : TextAlign.right,
            style: AppTheme.name1,
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(ApiController controller, int i,
      {required Alignment alignment, required borderRadius}) {
    return Align(
      alignment: alignment,
      child: Container(
        width: Get.width * 0.5,
        height: Get.height * 0.18,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.white24,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: CachedNetworkImage(
            imageUrl: '${controller.game[i]['image']}',
            fit: BoxFit.cover,
            height: Get.height * 0.18,
            placeholder: (context, url) => const CupertinoActivityIndicator(
              radius: 5,
              color: Colors.white,
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
          ),
        ),
      ),
    );
  }
}
