import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:just_audio/just_audio.dart';

part 'audio_service.g.dart';

@riverpod
AudioPlayer player(PlayerRef ref) {
  return AudioPlayer();
}

final _container = ProviderContainer();

final audioPlayer = _container.read(playerProvider);

@riverpod
class AudioService extends _$AudioService {
  @override
  FutureOr<void> build() {}
}

Future<void> playSound(
  String audioPath, {
  bool isLoop = false,
  double volume = 1,
}) async {
  await stopSound();

  audioPlayer.setAsset(audioPath);
  audioPlayer.setLoopMode(isLoop ? LoopMode.one : LoopMode.off);
  audioPlayer.play();
  audioPlayer.setVolume(volume);
}

Future<void> stopSound() async {
  audioPlayer.stop();
}

Future<void> pauseSound() async {
  audioPlayer.pause();
}

Future<void> resumeSound() async {
  audioPlayer.play();
}
