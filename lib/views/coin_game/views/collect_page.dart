import 'package:bounce/bounce.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_convter/controller/api_controller.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import '../../../model/global/varibales.dart';
import '../../../model/utils/text_style/style_them.dart';
import '../../counter/controller/gems_controller.dart';

class Collect extends StatefulWidget {
  static const routeName = '/Collect';
  const Collect({super.key});

  @override
  CollectState createState() => CollectState();
}

class CollectState extends State<Collect> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(200, -270),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ApiController(),
        builder: (apiController) {
          return GetBuilder(
            init: GemsController(),
            builder: (gemsController) {
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
                  title: Text(
                    "Collect Gems",
                    style: AppTheme.whiteBig,
                  ),
                  centerTitle: true,
                ),
                body: Center(
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 350,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppTheme.cont2,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'asset/images/gems.png',
                                  height: 40,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(
                                  () => Text(
                                    '${gemsController.gemValue.value}',
                                    style: AppTheme.info1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 400,
                            width: 350,
                            alignment: Alignment.center,
                            // padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppTheme.cont1,
                            ),
                            child: Bounce(
                              onTap: () {
                                if (Global.audioVibrate == true) {
                                  Global.player.setAsset(Global.audio);
                                  Global.player.play();
                                } else {
                                  Vibration.vibrate(duration: 300);
                                }
                                if (gemsController.dailyGems.value > 0) {
                                  gemsController.collectGem();
                                  // gemsController.useDailyGem();
                                  setState(() {
                                    _isAnimating = true;
                                  });
                                  _animationController
                                      .forward(from: 0)
                                      .then((value) {
                                    setState(() {
                                      _isAnimating = false;
                                    });
                                  });
                                }
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: apiController.selectedAnswer.isEmpty
                                        ? Image.asset(
                                            'asset/images/noFilter.jpg')
                                        : CachedNetworkImage(
                                            imageUrl: apiController
                                                .selectedAnswer['image'],
                                            fit: BoxFit.contain,
                                            placeholder: (context, url) =>
                                                const CupertinoActivityIndicator(
                                              radius: 20,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      color: AppTheme.cont,
                                    ),
                                    child: apiController.selectedAnswer.isEmpty
                                        ? Text(
                                            'Random',
                                            style: AppTheme.details,
                                          )
                                        : Text(
                                            apiController
                                                .selectedAnswer['Name'],
                                            style: AppTheme.details,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => SizedBox(
                              width: 320,
                              child: Column(
                                children: [
                                  LinearProgressIndicator(
                                    value: gemsController.progress,
                                    backgroundColor: Colors.green,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    minHeight: 10,
                                  ),
                                  Text(
                                    '${gemsController.dailyGems.value}',
                                    style: AppTheme.info1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_isAnimating)
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Positioned(
                              top: 400 + _animation.value.dy,
                              left: 10,
                              child: child!,
                            );
                          },
                          child: _PlusOneIcon(),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

class _PlusOneIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      child: const Text(
        "+1",
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
