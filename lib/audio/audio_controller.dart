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
      'audio/bgmusic.mp3',
      'audio/click.mp3',
      'audio/gameover.mp3',
      'audio/win.mp3',
    ]);
  }

  void playSound(String fileName) {
    FlameAudio.play(fileName); 
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