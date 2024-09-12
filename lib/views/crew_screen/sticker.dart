import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/controller/api_controller.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';
import 'fev_emote.dart';
import 'next_button.dart';

class StickerPage extends StatelessWidget {
  static const routeName = '/StickerPage';
  const StickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Character',
      'Backpack',
      'Pickaxe',
      'LoadingScreen',
      'Music',
      'Wrap',
      'Glider'
    ];
    final Map<String, String> typeMap = {
      'Character': 'outfit',
      'Backpack': 'backpack',
      'Pickaxe': 'pickaxe',
      'LoadingScreen': 'loadingscreen',
      'Music': 'music',
      'Wrap': 'wrap',
      'Glider': 'glider',
    };
    return GetBuilder<ApiController>(
      init: ApiController(),
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
              'Sticker',
              style: AppTheme.info1,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(FevEmote.routeName);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 35,
                ),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, categoryIndex) {
              String category = categories[categoryIndex];
              String typeId = typeMap[category]!;
              List allItems = controller.crew
                  .expand((crew) => crew['rewards'].where(
                      (reward) => reward['item']['type']['id'] == typeId))
                  .toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        SeeMorePage(
                          items: allItems,
                          category: category,
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(category, style: AppTheme.name1),
                        Text(
                          'Next',
                          style: AppTheme.name1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.crew.length,
                      itemBuilder: (context, crewIndex) {
                        List items = controller.crew[crewIndex]['rewards']
                            .where((reward) =>
                                reward['item']['type']['id'] == typeId)
                            .toList();
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (ctx, index) {
                            dynamic emote = items[index]['item']['images']
                                    ['icon']
                                .toString();
                            // bool isFev = Global.likedEmote.contains(emote);
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  SeeMorePage(
                                    items: allItems,
                                    category: category,
                                  ),
                                );
                              },
                              child: Container(
                                height: 80,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors
                                      .primaries[
                                          index % Colors.primaries.length]
                                      .shade300,
                                  border: Border.all(color: Colors.white),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: '$emote',
                                  height: 60,
                                  placeholder: (context, url) =>
                                      const CupertinoActivityIndicator(
                                    radius: 5,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error_outline),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
// IconButton(
//   onPressed: () {
//     isFev
//         ? Global.likedEmote.remove(emote)
//         : Global.likedEmote.add(emote);
//     controller.update();
//   },
//   icon: Icon(
//     Icons.favorite,
//     color:
//         isFev ? Colors.red : Colors.white,
//     size: 26,
//   ),
// ),
