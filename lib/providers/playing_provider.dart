import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class PlayingService with ChangeNotifier {
  String _baseUrl = "audius-discovery-3.cultur3stake.com";
  String apiUrl = "v1/tracks";
  final audioPlayer = AssetsAudioPlayer();
  // bool _isPlaying = false;

  final StreamController<bool> _playingStreamController =
      StreamController.broadcast();

  Stream<bool> get Playing => _playingStreamController.stream;

  set isPlaying(bool value) {
    _playingStreamController.add(value);
  }

  loadTrack() async {
    final url = Uri.https(_baseUrl, apiUrl, {
      'q':
          'permalink=/frvncomusic/arcangel-bad-bunny-la-jumpa-frvnco-techno-remix&app_name=EXAMPLEAPP'
    });
    final response = await http.get(url);
    // final searchResponse = SearchResponse.fromJson(response.body);
    // return searchResponse.results;
    try {
      await audioPlayer.open(
          Audio.network(
              "https://audius-discovery-3.cultur3stake.com/v1/tracks/QZV4Jl1/stream?app_name=EMUSIC"),
          showNotification: true,
          autoStart: false);
    } catch (e) {
      print(e);
    }
    print('Nombre->${audioPlayer.getCurrentAudioArtist}');
    print('Nombre->${audioPlayer.isBuffering.value}');
    ChangeNotifier();
  }
}
