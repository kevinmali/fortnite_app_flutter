// import 'dart:math';
//
// import 'package:flip_card/flip_card_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:gems_convter/views/counter/controller/gems_controller.dart';
// import 'package:get/get.dart';
//
// import '../../../../../controller/api_controller.dart';
// import '../../../../../model/global/varibales.dart';
// import '../../../../../model/utils/text_style/style_them.dart';
// import '../../../../home_pages/views/bottom_screen.dart';
//
// class Flip extends GetxController {
//   final GemsController gemsController = Get.find<GemsController>();
//   final ApiController apiController = Get.find<ApiController>();
//
//   late List<FlipCardController> flipCardControllers;
//   List<dynamic> characterData = [];
//   List suffleList = [];
//   int? firstSelectedIndex;
//   int? secondSelectedIndex;
//   late List<bool> cardFlipped;
//   late List<bool> matchedCards;
//
//   String? matchedImage;
//
//   @override
//   void onInit() {
//     fetchData();
//     initializeChances();
//     super.onInit();
//   }
//
//   void initializeChances() {
//     DateTime lastResetDate =
//         DateTime.tryParse(Global.box.read('lastResetDate') ?? '') ??
//             DateTime.now();
//     // print('last date :::::${lastResetDate}');
//     DateTime currentDate = DateTime.now();
//     // print('current date $currentDate');
//     if (lastResetDate.day != currentDate.day ||
//         lastResetDate.month != currentDate.month ||
//         lastResetDate.year != currentDate.year) {
//       // Reset chances for a new day
//       gemsController.remainingFlip = 3;
//       Global.box.write('remainingFlip', gemsController.remainingFlip);
//       Global.box.write('lastResetDate', currentDate.toIso8601String());
//     } else {
//       // Load remaining chances
//       gemsController.remainingFlip = Global.box.read('remainingFlip') ?? 3;
//     }
//     update();
//   }
//
//   void updateChances() {
//     // print('updated first ::: ${gemsController.remainingFlip}');
//     gemsController.remainingFlip--;
//     Global.box.write('remainingFlip', gemsController.remainingFlip);
//     gemsController.remainingFlip = Global.box.read('remainingFlip') ?? 3;
//     if (gemsController.remainingFlip <= 0) {
//       Get.toNamed(BottomPage.routeName);
//     } else {
//       update();
//     }
//   }
//
//   void showGameFinishedDialog(BuildContext context) {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (ctx) => Container(
//         margin:
//             const EdgeInsets.only(top: 220, left: 30, right: 30, bottom: 300),
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//             color: AppTheme.cont1, borderRadius: BorderRadius.circular(10)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'You have matched the cards!',
//               textAlign: TextAlign.center,
//               style: AppTheme.info,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Total collect 10",
//                   style: AppTheme.info,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(width: 10),
//                 Image.asset(
//                   'asset/images/gems.png',
//                   height: 20,
//                 ),
//               ],
//             ),
//             TextButton(
//               style: const ButtonStyle(
//                 backgroundColor: MaterialStatePropertyAll(
//                   Colors.black26,
//                 ),
//               ),
//               onPressed: () {
//                 // gemsController.totalGems.value =
//                 //     Global.box.read('totalGems') ?? 0;
//                 if (gemsController.remainingFlip > 0) {
//                   Get.back();
//                   updateChances();
//                   // print(gemsController.remainingFlip);
//                   flipAllCardsToFront();
//                   restartGame();
//                   Global.box.write('gems', gemsController.gemValue.value + 10);
//                   gemsController.gemValue.value =
//                       Global.box.read('gems').toInt() ?? 0;
//                   Global.box
//                       .write('totalGems', gemsController.totalGems.value + 10);
//                   gemsController.totalGems.value = Global.box.read('totalGems');
//                   update();
//                 }
//               },
//               child: Text(
//                 'Tap To Collect',
//                 style: AppTheme.details,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void flipAllCardsToFront() {
//     for (var controller in flipCardControllers) {
//       if (controller.state?.isFront == false) {
//         controller.toggleCard();
//       }
//       update();
//     }
//   }
//
//   Future<void> fetchData() async {
//     List imageData = [];
//     // Fetch data for 'Boys'
//     print('api call ${apiController.boys}');
//     for (var character in apiController.boys['Boys']) {
//       imageData.add(character['image']);
//       update();
//     }
//     imageData.shuffle(Random());
//     characterData = imageData.take(6).toList();
//
//     suffle();
//
//     cardFlipped = List<bool>.filled(suffleList.length, false);
//
//     matchedCards = List<bool>.filled(suffleList.length, false);
//
//     flipCardControllers = List<FlipCardController>.generate(
//       suffleList.length,
//       (_) => FlipCardController(),
//     );
//     update();
//   }
//
//   void suffle() {
//     List<dynamic> combinedList = List.from(characterData)
//       ..addAll(characterData);
//     suffleList = List.from(combinedList);
//     suffleList.shuffle();
//     update();
//   }
//
//   void flipCard(int i, BuildContext context) {
//     if (matchedCards[i] || cardFlipped[i]) return;
//     if (firstSelectedIndex == null) {
//       firstSelectedIndex = i;
//       cardFlipped[i] = true;
//     } else if (secondSelectedIndex == null && i != firstSelectedIndex) {
//       secondSelectedIndex = i;
//       cardFlipped[i] = true;
//       update();
//       if (suffleList[firstSelectedIndex!] != suffleList[secondSelectedIndex!]) {
//         Future.delayed(const Duration(seconds: 1), () {
//           flipCardControllers[firstSelectedIndex!].toggleCard();
//           flipCardControllers[secondSelectedIndex!].toggleCard();
//           cardFlipped[firstSelectedIndex!] = false;
//           cardFlipped[secondSelectedIndex!] = false;
//           firstSelectedIndex = null;
//           secondSelectedIndex = null;
//         });
//       } else {
//         matchedCards[firstSelectedIndex!] = true;
//         matchedCards[secondSelectedIndex!] = true;
//         firstSelectedIndex = null;
//         secondSelectedIndex = null;
//         // Future.delayed(const Duration(seconds: 1), () {
//         //   showGameFinishedDialog();
//         // });
//
//         if (matchedCards.every((matched) => matched)) {
//           Future.delayed(const Duration(seconds: 1), () {
//             showGameFinishedDialog(context);
//           });
//         }
//       }
//       update();
//     }
//     update();
//   }
//
//   void restartGame() {
//     characterData.clear();
//     suffleList.clear();
//     firstSelectedIndex = null;
//     secondSelectedIndex = null;
//     fetchData();
//   }
// }
