import 'package:flutter/material.dart';
import 'package:gems_convter/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';

class InfoData extends StatelessWidget {
  static const routeName = '/InfoData';
  const InfoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.appBar,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Game Details',
          style: AppTheme.whiteBig,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: Get.height * 0.04,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white60,
                    Colors.white12,
                  ],
                ),
              ),
              child: Text(
                'Counters',
                style: AppTheme.info,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.white24,
                ),
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Counter',
                    style: AppTheme.info1,
                  ),
                  Text(
                    'You Write number and click on Convert button all Convert Gems...',
                    style: AppTheme.details,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Gems To US',
                    style: AppTheme.info1,
                  ),
                  Text(
                    'Write a number in Box And click on Convert Button and This Gems convert in US',
                    style: AppTheme.details,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'US To Gems',
                    style: AppTheme.info1,
                  ),
                  Text(
                    'Write a number in Box And click on Convert Button and This US convert in Gems',
                    style: AppTheme.details,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: Get.height * 0.04,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white60,
                    Colors.white12,
                  ],
                ),
              ),
              child: Text(
                'Coin Games',
                style: AppTheme.info,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.white24,
                ),
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Gems',
                    style: AppTheme.info1,
                  ),
                  Text(
                    'Daily 500 Gems , Collected Gems only Tap Tap and Collected one gems in One Tap...',
                    style: AppTheme.details,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Flip Game',
                    style: AppTheme.info1,
                  ),
                  Text(
                    'Daily 3 chance and you matched all card won 10 gems...',
                    style: AppTheme.details,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Shuffle Game',
                    style: AppTheme.info1,
                  ),
                  Text(
                    'Daily Give only 3 chance , If this is a card-flipping or memory-style game, the player might have to match avatars in the grid by flipping them over or selecting pairs. if match pairs found. you will win 50 gems...',
                    style: AppTheme.details,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: Get.height * 0.04,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white60,
                    Colors.white12,
                  ],
                ),
              ),
              child: Text(
                'Counters',
                style: AppTheme.info,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.white24,
                ),
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price 100',
                    style: AppTheme.info1,
                  ),
                  Text(
                    'click a game and show one image and four options of name you click one write name and won this character in collection page , if you play one game minus in 100 gems',
                    style: AppTheme.details,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Price 150',
                    style: AppTheme.info1,
                  ),
                  Text(
                    'click a game and show one image and four options of name you click one write name and won this character in collection page, if you play one game minus in 150 gems',
                    style: AppTheme.details,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Price 200',
                    style: AppTheme.info1,
                  ),
                  Text(
                    'click a game and show one image and four options of name you click one write name and won this character in collection page , if you play one game minus in 200 gems',
                    style: AppTheme.details,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
