import 'dart:async';

class PlayingService {
  // bool _isPlaying = false;

  final StreamController<bool> _playingStreamController =
      StreamController.broadcast();

  Stream<bool> get Playing => _playingStreamController.stream;

  set isPlaying(bool value) {
    _playingStreamController.add(value);
  }
}
