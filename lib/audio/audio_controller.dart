// Audio controller made with <3 by Jimwel Valdez.

import 'package:flame_audio/flame_audio.dart';

class AudioController {
  bool isMuted = true;

  void mute(bool v) {
    if (v) {
      isMuted = true;
    }
    else {
      isMuted = false;
    }
  }

  Future<void> initialize() async {
    // Preload audio files to avoid lag
    await FlameAudio.audioCache.loadAll([
      'bgmusic.mp3',
      'click.mp3',
      'gameover.mp3',
      'win.mp3',
    ]);
  }

  void playSound(String fileName) {
    FlameAudio.play(fileName, volume: 0.7); 
  }

  void startMusic() {
    FlameAudio.bgm.play('bgmusic.mp3');
  }

  void stopMusic() {
    FlameAudio.bgm.stop();
  }

  void pauseMusic() {
    FlameAudio.bgm.pause();
  }

  void resumeMusic() {
    FlameAudio.bgm.resume();
  }
}