import 'dart:math';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../controller/api_controller.dart';
import '../../../model/global/varibales.dart';
import '../../../model/utils/text_style/style_them.dart';
import '../../counter/controller/gems_controller.dart';

class ShuffleGame extends StatefulWidget {
  static const routeName = '/ShuffleGame';
  const ShuffleGame({super.key});

  @override
  State<ShuffleGame> createState() => _ShuffleGameState();
}

class _ShuffleGameState extends State<ShuffleGame> {
  final ApiController apiController = Get.put(ApiController());
  final GemsController gemsController = Get.put(GemsController());
  String selectedRandomImage = '';
  var cardFlipped = <bool>[].obs;
  List<dynamic> characterData = [].obs;
  List imageData = [];
  var wonImages = <String>[].obs;
  bool isShuffleButtonVisible = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var data = apiController.boys;
    setState(() {
      for (var character in data['Boys']) {
        imageData.add(character['image']);
      }
      imageData.shuffle(Random());
      characterData = imageData.take(9).toList();
      selectedRandomImage =
          characterData[Random().nextInt(characterData.length)];
      cardFlipped.value = List<bool>.filled(characterData.length, true);
    });
  }

  void shuffleData() {
    characterData.shuffle();
  }

  void startShuffle() {
    setState(() {
      isShuffleButtonVisible = false;
    });
    if (gemsController.remainingChances > 0) {
      var timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
        shuffleData();
        setState(() {});
      });
      Future.delayed(const Duration(seconds: 3), () {
        timer.cancel();
        cardFlipped.value = List<bool>.filled(characterData.length, false);
        setState(() {});
      });
      updateChances();
    } else {
      Get.back();
      Get.back();
    }
  }

  void updateChances() {
    gemsController.remainingChances--;
    Global.box.write('remainingChances', gemsController.remainingChances);
    setState(() {});
  }

  void resetGame() {
    fetchData();
    setState(() {
      isShuffleButtonVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        backgroundColor: AppTheme.appBar,
        centerTitle: true,
        title: Text(
          'Shuffle Game',
          style: AppTheme.whiteBig,
        ),
      ),
      body: characterData.isEmpty
          ? Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                color: Colors.white,
                size: Get.height * 0.1,
              ),
            )
          : Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: Get.height * 9,
                      width: Get.width * .9,
                      decoration: BoxDecoration(
                          // color: AppTheme.cont1,
                          image: const DecorationImage(
                              image: AssetImage('asset/images/white.PNG'),
                              fit: BoxFit.cover),
                          border: Border.all(color: Colors.white, width: 10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: CachedNetworkImage(
                          imageUrl: selectedRandomImage,
                          placeholder: (ctx, url) =>
                              const CupertinoActivityIndicator(
                            radius: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      // crossAxisSpacing: 5,
                      mainAxisSpacing: 3,
                      mainAxisExtent: 128,
                    ),
                    itemCount: characterData.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            final flipAnim =
                                Tween(begin: 1.0, end: 0.0).animate(animation);
                            return Transform(
                              transform: Matrix4.rotationY(pi * flipAnim.value),
                              alignment: Alignment.center,
                              child: child,
                            );
                          },
                          child: cardFlipped[index]
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    // color: AppTheme.cont1,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'asset/images/white.PNG'),
                                        fit: BoxFit.cover),
                                  ),
                                  height: Get.height * .14,
                                  width: Get.width * .30,
                                  child: CachedNetworkImage(
                                    imageUrl: characterData[index],
                                    height: Get.height * .18,
                                    fit: BoxFit.cover,
                                    placeholder: (ctx, url) =>
                                        const CupertinoActivityIndicator(
                                      radius: 20,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    String imageName = characterData[index];
                                    if (imageName.isNotEmpty) {
                                      cardFlipped[index] = true;
                                      if (imageName == selectedRandomImage) {
                                        Global.box.write('gems',
                                            gemsController.gemValue.value + 10);
                                        gemsController.gemValue.value =
                                            Global.box.read('gems').toInt() ??
                                                0;
                                        Global.box.write(
                                            'totalGems',
                                            gemsController.totalGems.value +
                                                10);
                                        gemsController.totalGems.value =
                                            Global.box.read('totalGems');
                                        showDialogBox(
                                          imageName,
                                          'You won 10 Gems...',
                                          10,
                                        );
                                      } else {
                                        showDialogBox(
                                          imageName,
                                          'Try Again...',
                                          0,
                                        );
                                      }
                                    }
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      // color: AppTheme.cont1,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'asset/images/white.PNG'),
                                          fit: BoxFit.cover),
                                    ),
                                    height: Get.height * .14,
                                    width: Get.width * .30,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
                if (isShuffleButtonVisible)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SizedBox(
                      height: 40,
                      child: GestureDetector(
                        onTap: () {
                          startShuffle();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.cont1,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                          height: Get.height * 0.04,
                          width: Get.width * 0.3,
                          child: Center(
                            child: Text(
                                'Shuffle (${gemsController.remainingChances} left)'),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }

  void showDialogBox(String imageUrl, String message, int randomIncrement) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: Get.height * 0.4,
          decoration: BoxDecoration(color: AppTheme.cont1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (imageUrl.isNotEmpty)
                Image.network(
                  imageUrl,
                  height: Get.height * 0.2,
                  fit: BoxFit.cover,
                ),
              Text(
                message,
                textAlign: TextAlign.center,
              ),
              if (randomIncrement > 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total collect $randomIncrement",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'asset/images/gems.png',
                      height: 20,
                    ),
                  ],
                ),
              GestureDetector(
                onTap: () {
                  resetGame();
                  Get.back();
                  if (gemsController.remainingChances == 0) {
                    Get.back();
                    if (imageUrl.isNotEmpty) {
                      wonImages.add(imageUrl);
                    }
                  }
                },
                child: Container(
                  height: Get.height * 0.04,
                  width: Get.width * 0.4,
                  decoration: BoxDecoration(
                    color: AppTheme.cont1,
                  ),
                  child: const Center(
                    child: Text('Ok'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
