// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../model/utils/text_style/style_them.dart';
// import 'flip_game.dart';
//
// class FlipButton extends StatelessWidget {
//   const FlipButton({super.key});
//   static const routeName = '/FlipButton';
//   // final SpinController controllerS = Get.put(SpinController());
//
//   @override
//   Widget build(BuildContext context) {
//     // void showConfirmationDialog(int index) {
//     //   final int cost = _list[index].cost;
//     //   showDialog(
//     //     context: context,
//     //     builder: (BuildContext context) {
//     //       return AlertDialog(
//     //         backgroundColor: const Color(0xffCE49BF),
//     //         title: Column(
//     //           children: [
//     //             Text(
//     //               'Are you sure?',
//     //               style: AppTheme.details,
//     //             ),
//     //             SizedBox(
//     //               height: Get.height * 0.02,
//     //             ),
//     //             // Text(
//     //             //   'Total SuperCoin ${controllerS.superCoin}',
//     //             //   style: AppTheme.details,
//     //             // ),
//     //           ],
//     //         ),
//     //         content: Column(
//     //           mainAxisSize: MainAxisSize.min,
//     //           children: [
//     //             Text(
//     //               'Do you want to use $cost Super Coins to play the ${_list[index].name} level? ',
//     //               style: AppTheme.details,
//     //             ),
//     //           ],
//     //         ),
//     //         actions: <Widget>[
//     //           TextButton(
//     //             onPressed: () {
//     //               Get.back();
//     //             },
//     //             child: Container(
//     //               alignment: Alignment.center,
//     //               height: Get.height * 0.04,
//     //               width: Get.width * 0.16,
//     //               padding: const EdgeInsets.all(5),
//     //               decoration: const BoxDecoration(
//     //                 color: Colors.black54,
//     //                 borderRadius: BorderRadius.all(
//     //                   Radius.circular(20),
//     //                 ),
//     //               ),
//     //               child: Text(
//     //                 'No',
//     //                 style: AppTheme.whiteBig,
//     //               ),
//     //             ),
//     //           ),
//     //           TextButton(
//     //             onPressed: () {
//     //               Get.back();
//     //               // if (controllerS.superCoin.value >= cost) {
//     //               //   controllerS.superCoin.value -= cost;
//     //               //   Global.box.write('superCoin', controllerS.superCoin.value);
//     //                 Get.toNamed(FlipGame.routeName, arguments: {
//     //                   'title': _list[index].name,
//     //                   'img': _list[index].image,
//     //                 });
//     //               }
//     //               // else {
//     //               //   Get.snackbar(
//     //               //     'Insufficient Coins',
//     //               //     'You do not have enough super coins to play the ${_list[index].name} level ?',
//     //               //     snackPosition: SnackPosition.BOTTOM,
//     //               //     backgroundColor: Colors.purpleAccent.shade400,
//     //               //     colorText: Colors.white,
//     //               //   );
//     //               // }
//     //             },
//     //             child: Container(
//     //               alignment: Alignment.center,
//     //               height: Get.height * 0.04,
//     //               width: Get.width * 0.16,
//     //               padding: const EdgeInsets.all(5),
//     //               decoration: const BoxDecoration(
//     //                 color: Colors.black54,
//     //                 borderRadius: BorderRadius.all(
//     //                   Radius.circular(20),
//     //                 ),
//     //               ),
//     //               child: Text(
//     //                 'Yes',
//     //                 style: AppTheme.whiteBig,
//     //               ),
//     //             ),
//     //           ),
//     //         ],
//     //       );
//     //     },
//     //   );
//     // }
//
//     return Scaffold(
//       backgroundColor: AppTheme.background,
//       appBar: AppBar(
//         title: Text(
//           'Flip Card',
//           style: AppTheme.whiteBig,
//         ),
//         centerTitle: true,
//         leading: const BackButton(
//           color: Colors.white,
//         ),
//         backgroundColor: AppTheme.appBar,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.only(top: 50),
//         itemCount: _list.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Get.toNamed(FlipGame.routeName, arguments: {
//                 'title': _list[index].name,
//                 'img': _list[index].image,
//               });
//               // showConfirmationDialog(index);
//               // print(_list[index].name);
//               // print(_list[index].image);
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Stack(
//                 children: [
//                   Container(
//                     height: Get.height * 0.1,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: _list[index].primaryColor,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: const [
//                           BoxShadow(
//                               blurRadius: 4,
//                               color: Colors.black45,
//                               spreadRadius: 0.5,
//                               offset: Offset(3, 4))
//                         ]),
//                   ),
//                   Container(
//                     height: Get.height * 0.09,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: _list[index].secondaryColor,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: const [
//                           BoxShadow(
//                               blurRadius: 4,
//                               color: Colors.black12,
//                               spreadRadius: 0.3,
//                               offset: Offset(
//                                 5,
//                                 3,
//                               ))
//                         ]),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(
//                             child: Text(
//                           _list[index].name,
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               shadows: [
//                                 Shadow(
//                                   color: Colors.black26,
//                                   blurRadius: 2,
//                                   offset: Offset(1, 2),
//                                 ),
//                                 Shadow(
//                                     color: Colors.green,
//                                     blurRadius: 2,
//                                     offset: Offset(0.5, 2))
//                               ]),
//                         )),
//                         // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.center,
//                         //   crossAxisAlignment: CrossAxisAlignment.center,
//                         //   children: GenrateStar(_list[index].noOfstar),
//                         // )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   // List<Widget> GenrateStar(int no) {
//   //   List<Widget> _icons = [];
//   //   for (int i = 0; i < no; i++) {
//   //     _icons.insert(
//   //         i,
//   //         const Icon(
//   //           Icons.star,
//   //           color: Colors.yellow,
//   //         ));
//   //   }
//   //   return _icons;
//   // }
// }
//
// class Details {
//   String name;
//   String image;
//   Color primaryColor;
//   Color secondaryColor;
//   // int noOfStar;
//   // int cost;
//
//   Details({
//     required this.name,
//     required this.image,
//     required this.primaryColor,
//     required this.secondaryColor,
//     // required this.noOfStar,
//     // required this.cost,
//   });
// }
//
// List<Details> _list = [
//   Details(
//     name: "Boys",
//     primaryColor: AppTheme.cont2,
//     secondaryColor: AppTheme.cont1,
//     // noOfStar: 1,
//     // cost: 50,
//     image: 'asset/images/noFilter.jpg',
//   ),
//   // Details(
//   //   name: "Girls",
//   //   primaryColor: AppTheme.cont2,
//   //   secondaryColor: AppTheme.cont1,
//   //   // noOfStar: 2,
//   //   // cost: 100,
//   //   image: 'asset/images/Png.png',
//   // ),
//   // Details(
//   //   name: "Pet",
//   //   primaryColor: AppTheme.cont2,
//   //   secondaryColor: AppTheme.cont1,
//   //   // noOfStar: 3,
//   //   // cost: 150,
//   //   image: 'asset/images/SkeletonUnicornStandard.jpg',
//   // )
// ];
