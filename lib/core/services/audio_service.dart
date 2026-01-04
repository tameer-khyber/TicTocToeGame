import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class AudioService extends GetxService {
  late AudioPlayer _player;
  final RxBool isMuted = false.obs;

  @override
  void onInit() {
    super.onInit();
    _player = AudioPlayer();
    // Preload sounds for lower latency
    _player.setSource(AssetSource('audio/click.mp3'));
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
  }

  Future<void> playClick() async {
    await playMove();
  }

  Future<void> playMove() async {
    if (isMuted.value) return;
    try {
      final player = AudioPlayer(); 
      // Using click.mp3 as it seems to be the valid file provided for interaction
      await player.play(AssetSource('audio/click.mp3')); 
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }

  Future<void> playWin() async {
    if (isMuted.value) return;
    try {
      final player = AudioPlayer();
      await player.play(AssetSource('audio/win.mp3'));
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }
  
    Future<void> playDraw() async {
    if (isMuted.value) return;
    try {
      final player = AudioPlayer();
      await player.play(AssetSource('audio/draw.mp3'));
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }
}
