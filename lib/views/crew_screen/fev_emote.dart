import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/views/crew_screen/sticker.data.dart';
import 'package:get/get.dart';
import '../../../model/global/varibales.dart';
import '../../../model/utils/text_style/style_them.dart';

class FevEmote extends StatefulWidget {
  const FevEmote({super.key});
  static const routeName = '/FevEmote';

  @override
  State<FevEmote> createState() => _FevEmoteState();
}

class _FevEmoteState extends State<FevEmote> {
  @override
  Widget build(BuildContext context) {
    // Global.likedCharacters = Global.box.read('likedCharacters') ?? [];
    return Scaffold(
      backgroundColor: AppTheme.cont,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 26,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Fev Emote',
          style: AppTheme.whiteText,
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 250,
        ),
        itemCount: Global.likedEmote.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(StickerData.routeName,
                  arguments: Global.likedEmote[i]);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white60),
                // image: const DecorationImage(
                //   image: AssetImage(
                //     "asset/images/character_images/character1.png",
                //   ),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CachedNetworkImage(
                    imageUrl: Global.likedEmote[i],
                    placeholder: (context, url) =>
                        const CupertinoActivityIndicator(
                      radius: 5,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
