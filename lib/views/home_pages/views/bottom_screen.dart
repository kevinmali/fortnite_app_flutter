import 'package:flutter/material.dart';
import 'package:gems_convter/views/collection_page/views/collection_page.dart';
import 'package:gems_convter/views/home_pages/views/home_page.dart';
import 'package:gems_convter/views/home_pages/views/setting_page.dart';
import 'package:vibration/vibration.dart';
import '../../../model/global/varibales.dart';
import '../../../model/utils/text_style/style_them.dart';
import '../../list_pages/views/list_title.dart';
import '../../list_pages/views/total_all.dart';

class BottomPage extends StatefulWidget {
  static const routeName = '/BottomPage';

  const BottomPage({super.key});

  @override
  BottomPageState createState() => BottomPageState();
}

class BottomPageState extends State<BottomPage> {
  int _selectedIndex = 2;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      const ListProgress(),
      const ListData(),
      HomePage(),
      const CollectionPage(),
      const SettingPage(),
    ];
  }

  void _onItemTapped(int index) {
    if (Global.audioVibrate == true) {
      Global.player.setAsset(Global.audio);
      Global.player.play();
    } else {
      Vibration.vibrate(duration: 300);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.black,
        // fixedColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'See All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: 'Skins',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
