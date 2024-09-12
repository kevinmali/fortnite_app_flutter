import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/global/varibales.dart';
import '../../../model/utils/text_style/style_them.dart';
import '../controller/gems_controller.dart';

class ConvertGems extends StatelessWidget {
  static const routeName = '/ConvertGems';
  final GemsController controller = Get.put(GemsController());

  ConvertGems({super.key});

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
        title: Text(
          'R\$ Converter',
          style: AppTheme.whiteBig,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'asset/images/convertimage.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 80),
              Obx(
                () => Container(
                  height: Get.height * 0.2,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffE0E5B6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'asset/images/gems.png',
                            height: 40,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${controller.gems.value}',
                            style: AppTheme.info,
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        height: 30,
                        child: const Icon(
                          Icons.move_down,
                          size: 30,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'asset/images/dollar.png',
                            height: 40,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${controller.dollar.value.toStringAsFixed(3)} ',
                            style: AppTheme.info,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: Get.height * 0.08,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: controller.textEditingController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  // onChanged: (value) {
                  //   controller.updateGemAmount(value);
                  // },
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Global.box.write('count', controller.counter.value + 1);
                  controller.counter.value = Global.box.read('count');
                  FocusManager.instance.primaryFocus?.unfocus();
                  String gemText = controller.textEditingController.text;
                  if (gemText.isNotEmpty) {
                    controller.updateGemAmount(gemText);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: Get.height * 0.08,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Convert',
                    style: AppTheme.info1,
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
