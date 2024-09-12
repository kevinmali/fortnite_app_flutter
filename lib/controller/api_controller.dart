import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/global/varibales.dart';

class ApiController extends GetxController {
  var selectedAnswer = {}.obs;
  var selectedIndex = (-1).obs;

  String collection = '';
  RxString selectedOption = ''.obs;
  Rx isCorrect = Rx(null);
  List correctAnswers = [];
  RxInt wrongAttempts = 0.obs;

  Map boys = {};
  RxString correctName = ''.obs;
  RxString correctImage = ''.obs;
  var correctData = {};
  RxList<String> options = <String>[].obs;

  Map girl = {};
  RxString correctNames = ''.obs;
  RxString correctImages = ''.obs;
  var correctDataS = {};
  RxList<String> option = <String>[].obs;

  Map pet = {};
  RxString correctNameP = ''.obs;
  RxString correctImageP = ''.obs;
  var correctDataP = {};
  RxList<String> optionP = <String>[].obs;

  @override
  void onInit() {
    girlsApi();
    boysApi();
    petsApi();
    super.onInit();
  }

  void selectAnswer(Map answer, int index) {
    selectedAnswer.value = answer;
    selectedIndex.value = index;
    update();
  }

//Boys
  void boysApi() async {
    var url = Uri.parse(
        'https://coinspinmaster.com/viral/iosapp/Mali/roblox_counter/boys.json');
    var response = await http.get(url);
    var data = json.decode(utf8.decode(response.bodyBytes));
    boys = data;
    _generateRandomSelection();
    update();
  }

  void _generateRandomSelection() {
    final random = Random();
    final randomIndex = random.nextInt(boys['Boys'].length);
    correctName.value = boys['Boys'][randomIndex]['Name'];
    correctImage.value = boys['Boys'][randomIndex]['image'];
    correctData = boys['Boys'][randomIndex];

    options.value = [
      correctName.value,
      for (int i = 0; i < 3; i++)
        boys['Boys'][random.nextInt(boys['Boys'].length)]['Name']
    ]..shuffle();
  }

  void checkAnswer(String selected) {
    selectedOption.value = selected;
    isCorrect.value = selected == correctName.value;
    if (isCorrect.value == true) {
      bool isAlreadyAdded =
          correctAnswers.any((answer) => answer['Name'] == correctData['Name']);
      if (!isAlreadyAdded) {
        correctAnswers.add(correctData);
        Global.box.write('correctAnswers', correctAnswers);
      } else {
        Get.snackbar('You Won', 'Already collectd');
      }
    } else {
      wrongAttempts.value++;
    }
    update();
  }

//Girl
  void girlsApi() async {
    var url = Uri.parse(
        'https://coinspinmaster.com/viral/iosapp/Mali/roblox_counter/girl.json');
    var response = await http.get(url);
    var data = json.decode(utf8.decode(response.bodyBytes));
    girl = data;
    _generateRandomSelections();
    update();
  }

  void _generateRandomSelections() {
    final random = Random();
    final randomIndex = random.nextInt(girl['Girls'].length);
    correctNames.value = girl['Girls'][randomIndex]['Name'];
    correctImages.value = girl['Girls'][randomIndex]['image'];
    correctDataS = girl['Girls'][randomIndex];

    option.value = [
      correctNames.value,
      for (int i = 0; i < 3; i++)
        girl['Girls'][random.nextInt(girl['Girls'].length)]['Name']
    ]..shuffle();
  }

  void checkAnswers(String selected) {
    selectedOption.value = selected;
    isCorrect.value = selected == correctNames.value;
    if (isCorrect.value == true) {
      bool isAlreadyAdded = correctAnswers
          .any((answer) => answer['Name'] == correctDataS['Name']);
      if (!isAlreadyAdded) {
        correctAnswers.add(correctDataS);
        Global.box.write('correctAnswers', correctAnswers);
      } else {
        Get.snackbar('You Won', 'Already collectd');
      }
    } else {
      wrongAttempts.value++;
    }
    update();
  }

// PET
  void petsApi() async {
    var url = Uri.parse(
        'https://coinspinmaster.com/viral/iosapp/Mali/roblox_counter/pet.json');
    var response = await http.get(url);
    var data = json.decode(utf8.decode(response.bodyBytes));
    pet = data;
    _generateRandomSelectionP();
    update();
  }

  void _generateRandomSelectionP() {
    final random = Random();
    final randomIndex = random.nextInt(pet['Pet'].length);
    correctNameP.value = pet['Pet'][randomIndex]['Name'];
    correctImageP.value = pet['Pet'][randomIndex]['image'];
    correctDataP = pet['Pet'][randomIndex];

    optionP.value = [
      correctNameP.value,
      for (int i = 0; i < 3; i++)
        pet['Pet'][random.nextInt(pet['Pet'].length)]['Name']
    ]..shuffle();
  }

  void checkAnswerP(String selected) {
    selectedOption.value = selected;
    isCorrect.value = selected == correctNameP.value;
    if (isCorrect.value == true) {
      bool isAlreadyAdded = correctAnswers
          .any((answer) => answer['Name'] == correctDataP['Name']);
      if (!isAlreadyAdded) {
        correctAnswers.add(correctDataP);
        Global.box.write('correctAnswers', correctAnswers);
      } else {
        Get.snackbar('You Won', 'Already collectd');
      }
    } else {
      wrongAttempts.value++;
    }
    update();
  }

  void resetSelection() {
    selectedOption.value = '';
    isCorrect.value = null;
    _generateRandomSelection();
    _generateRandomSelections();
    _generateRandomSelectionP();
    update();
  }
}
