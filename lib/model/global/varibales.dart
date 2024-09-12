import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';

class Global {
  static final GetStorage box = GetStorage();
  static List<dynamic> likedEmote = [];
  static dynamic wonCount;
  static final player = AudioPlayer();
  static String audio = 'asset/audio/mixkit-modern-technology-select-3124.wav';
  // static String bgAudio = 'asset/audio/ZXQNB4T-music-box.mp3';
  static bool audioVibrate = true;
}
