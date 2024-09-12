import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortnite_app/controller/map_controller.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:fortnite_app/views/crew_screen/sticker.data.dart';
import 'package:get/get.dart';
import '../../model/global/varibales.dart';

class SeeMorePage extends StatelessWidget {
  static const routeName = '/SeeMorePage';
  final List items;
  final String category;

  const SeeMorePage({super.key, required this.items, required this.category});

  @override
  Widget build(BuildContext context) {
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
                category,
                style: AppTheme.info1,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                String emote =
                    items[index]['item']['images']['icon'].toString();
                bool isFev = Global.likedEmote.contains(emote);

                return GestureDetector(
                  onTap: () {
                    Get.toNamed(StickerData.routeName, arguments: emote);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors
                          .primaries[index % Colors.primaries.length].shade300,
                      border: Border.all(color: Colors.white),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            isFev
                                ? Global.likedEmote.remove(emote)
                                : Global.likedEmote.add(emote);
                            controller.update();
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isFev ? Colors.red : Colors.white,
                          ),
                        ),
                        Center(
                          child: CachedNetworkImage(
                            imageUrl: emote,
                            height: 100,
                            placeholder: (context, url) =>
                                const CupertinoActivityIndicator(radius: 5),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error_outline),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, top: 5),
                            padding: EdgeInsets.only(
                                top: 2, bottom: 2, left: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white24,
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Text(
                              'Next',
                              style: AppTheme.name1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
