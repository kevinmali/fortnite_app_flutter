import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../controller/api_controller.dart';
import '../../../../../model/global/varibales.dart';
import '../../../../../model/utils/text_style/style_them.dart';
import '../../../../counter/controller/gems_controller.dart';

class FlipGame extends StatefulWidget {
  static const routeName = '/FlipGame';
  const FlipGame({
    super.key,
  });

  @override
  FlipGameState createState() => FlipGameState();
}

class FlipGameState extends State<FlipGame>
    with SingleTickerProviderStateMixin {
  final GemsController gemsController = Get.put(GemsController());
  final ApiController apiController = Get.put(ApiController());
  List<dynamic> characterData = [];
  List suffleList = [];
  late List<bool> cardFlipped;
  late List<bool> matchedCards;
  int? firstSelectedIndex;
  int? secondSelectedIndex;
  String? matchedImage;
  // late AnimationController _controller;
  late List<FlipCardController> flipCardControllers;

  @override
  void initState() {
    super.initState();
    fetchData();
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 5),
    // )..repeat();
  }

  Future<void> fetchData() async {
    List imageData = [];
    setState(() {
      // Fetch data for 'Boys'
      for (var character in apiController.boys['Boys']) {
        imageData.add(character['image']);
      }
      imageData.shuffle(Random());
      characterData = imageData.take(6).toList();

      suffle();
      // cardFlipped = [];
      // matchedCards = [];
      // flipCardControllers.clear();
      cardFlipped = List<bool>.filled(suffleList.length, false);
      // print(cardFlipped);
      matchedCards = List<bool>.filled(suffleList.length, false);
      flipCardControllers = List<FlipCardController>.generate(
        suffleList.length,
        (_) => FlipCardController(),
      );
    });
  }

  void suffle() {
    List<dynamic> combinedList = List.from(characterData)
      ..addAll(characterData);
    suffleList = List.from(combinedList);
    suffleList.shuffle();
  }

  void flipCard(int i) {
    if (matchedCards[i] || cardFlipped[i]) return;
    setState(() {
      if (firstSelectedIndex == null) {
        firstSelectedIndex = i;
        cardFlipped[i] = true;
      } else if (secondSelectedIndex == null && i != firstSelectedIndex) {
        secondSelectedIndex = i;
        cardFlipped[i] = true;

        if (suffleList[firstSelectedIndex!] !=
            suffleList[secondSelectedIndex!]) {
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              flipCardControllers[firstSelectedIndex!].toggleCard();
              flipCardControllers[secondSelectedIndex!].toggleCard();
              cardFlipped[firstSelectedIndex!] = false;
              cardFlipped[secondSelectedIndex!] = false;
              firstSelectedIndex = null;
              secondSelectedIndex = null;
            });
          });
        } else {
          matchedCards[firstSelectedIndex!] = true;
          matchedCards[secondSelectedIndex!] = true;
          firstSelectedIndex = null;
          secondSelectedIndex = null;
          // Future.delayed(const Duration(seconds: 1), () {
          //   showGameFinishedDialog();
          // });

          if (matchedCards.every((matched) => matched)) {
            Future.delayed(const Duration(seconds: 1), () {
              showGameFinishedDialog();
            });
          }
        }
      }
    });
  }

  void updateChances() {
    // print('updated first ::: ${gemsController.remainingFlip}');
    gemsController.remainingFlip--;
    Global.box.write('remainingFlip', gemsController.remainingFlip);
    gemsController.remainingFlip = Global.box.read('remainingFlip') ?? 3;
    if (gemsController.remainingFlip <= 0) {
      Get.back();
    } else {
      setState(() {});
    }
  }

  void showGameFinishedDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => Container(
        margin:
            const EdgeInsets.only(top: 220, left: 30, right: 30, bottom: 300),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppTheme.cont1, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You have matched the cards!',
              textAlign: TextAlign.center,
              style: AppTheme.info,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total collect 10",
                  style: AppTheme.info,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'asset/images/gems.png',
                  height: 20,
                ),
              ],
            ),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.black26,
                ),
              ),
              onPressed: () {
                // gemsController.totalGems.value =
                //     Global.box.read('totalGems') ?? 0;
                if (gemsController.remainingFlip > 0) {
                  Get.back();
                  updateChances();
                  // print(gemsController.remainingFlip);
                  flipAllCardsToFront();
                  restartGame();
                  Global.box.write('gems', gemsController.gemValue.value + 10);
                  gemsController.gemValue.value =
                      Global.box.read('gems').toInt() ?? 0;
                  Global.box
                      .write('totalGems', gemsController.totalGems.value + 10);
                  gemsController.totalGems.value = Global.box.read('totalGems');
                }
              },
              child: Text(
                'Tap To Collect',
                style: AppTheme.details,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void flipAllCardsToFront() {
    for (var controller in flipCardControllers) {
      if (controller.state?.isFront == false) {
        controller.toggleCard();
      }
    }
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  void restartGame() {
    setState(() {
      characterData.clear();
      suffleList.clear();
      firstSelectedIndex = null;
      secondSelectedIndex = null;
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'FlipGame',
          style: AppTheme.whiteBig,
        ),
        centerTitle: true,
        backgroundColor: AppTheme.appBar,
      ),
      body: characterData.isEmpty
          ? Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                color: Colors.white,
                size: Get.height * 0.1,
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.only(left: 7, right: 7),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 180,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: suffleList.length,
              itemBuilder: (ctx, index) {
                return FlipCard(
                  controller: flipCardControllers[index],
                  onFlip: () {
                    flipCard(index);
                  },
                  flipOnTouch:
                      !cardFlipped[index] && secondSelectedIndex == null,
                  front: Center(
                    child: Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 10,
                        ),
                        color: AppTheme.cont1,
                        image: const DecorationImage(
                          image: AssetImage('asset/images/noFilter.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "?",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  back: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.cont1,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 10,
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: suffleList[index],
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
