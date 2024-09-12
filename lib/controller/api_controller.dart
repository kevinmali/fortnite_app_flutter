import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  var apiWeapon = [];
  List name = [];
  var map = [];
  var vehicle = [];
  var crew = [];
  var isLand = [];
  var skin = [];
  var game = [];
  @override
  void onInit() {
    apiWeapons();
    apiMap();
    apiVehicle();
    apiCrew();
    apiIsland();
    apiSkin();
    apiGame();
    super.onInit();
  }

  void apiWeapons() async {
    var url = Uri.parse('https://fortniteapi.io/v1/loot/list?lang=en');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'c833fc89-a410e1d8-67351125-bcc21983',
    });
    var data = json.decode(utf8.decode(response.bodyBytes));
    var temp = data['weapons'];
    temp.forEach((element) {
      if (!name.contains(element['name'])) {
        name.add(element['name']);
        apiWeapon.add(element);
      }
    });

    // print('apiwepon $apiWeapon');
    update();
  }

  void apiMap() async {
    var url = Uri.parse('https://fortniteapi.io/v1/maps/list');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'c833fc89-a410e1d8-67351125-bcc21983',
    });
    var data = json.decode(utf8.decode(response.bodyBytes));
    map = data['maps'];
    // print('map :::  ${jsonEncode(map)}');
    update();
  }

  void apiVehicle() async {
    var url = Uri.parse('https://fortniteapi.io/v2/game/vehicles');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'c833fc89-a410e1d8-67351125-bcc21983',
    });
    var data = json.decode(utf8.decode(response.bodyBytes));
    var temp = data['vehicles'];
    temp.forEach((element) {
      if (!name.contains(element['name'])) {
        name.add(element['name']);
        vehicle.add(element);
      }
    });
    update();
  }

  void apiCrew() async {
    var url = Uri.parse('https://fortniteapi.io/v2/crew/history?lang=en');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'c833fc89-a410e1d8-67351125-bcc21983',
    });
    var data = json.decode(utf8.decode(response.bodyBytes));
    crew = data['history'];
    // print('crew :::  ${jsonEncode(crew)}');
    update();
  }

  void apiIsland() async {
    var url = Uri.parse('https://fortniteapi.io/v1/creative/featured');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'c833fc89-a410e1d8-67351125-bcc21983',
    });
    var data = json.decode(utf8.decode(response.bodyBytes));
    isLand = data['featured'];
    // print('island :::  ${jsonEncode(isLand)}');
    update();
  }

  void apiSkin() async {
    var url = Uri.parse('https://fortniteapi.io/v2/items/list?lang=en');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'c833fc89-a410e1d8-67351125-bcc21983',
    });
    var data = json.decode(utf8.decode(response.bodyBytes));
    skin = data['items'];
    // print('skin :::  ${jsonEncode(skin[1])}');
    update();
  }

  void apiGame() async {
    var url = Uri.parse('https://fortniteapi.io/v1/game/modes?lang=en');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'c833fc89-a410e1d8-67351125-bcc21983',
    });
    var data = json.decode(utf8.decode(response.bodyBytes));
    game = data['modes'];
    // print('game :::  ${jsonEncode(game)}');
    update();
  }
}
