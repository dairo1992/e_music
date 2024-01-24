import 'dart:async';
import 'dart:convert';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:http/http.dart' as http;
import 'package:e_music/models/track_info_model.dart';
import 'package:flutter/material.dart';

class PlayingService extends ChangeNotifier {
  // audius-discovery-3.cultur3stake.com/v1/tracks/search?query=yonaguni&app_name=EXAMPLEAPP
  final String _baseUrl = "discoveryprovider3.audius.co";
  final String _streamTrack = "https://dn2.monophonic.digital/v1/tracks";
  late Track trackCurrent;
  List<Track> trackList = [];
  List<Track> searchTrackList = [];
  bool _isplaying = false;
  // bool _isPlaying = false;
  final audioPlayer = AssetsAudioPlayer();

  bool get isPlaying => _isplaying;
  set isPlaying(bool value) {
    _isplaying = value;
    notifyListeners();
  }

  final StreamController<List<Track>> _suggestionStreamController =
      StreamController.broadcast();

  Stream<List<Track>> get suggestionStream =>
      _suggestionStreamController.stream;

  Future<String> _getJsonData(
      {required String endPoint, String? query = ''}) async {
    Uri url;
    if (query!.isNotEmpty) {
      url = Uri.https(_baseUrl, endPoint, {'query': query});
    } else {
      url = Uri.https(_baseUrl, endPoint);
    }
    final response = await http.get(url);
    return response.body;
  }

  getTracks(String value) async {
    final jsonData =
        await _getJsonData(endPoint: 'v1/tracks/search', query: value);
    Iterable i = json.decode(jsonData)['data'];
    trackList = List<Track>.from(i.map((e) => Track.fromJson(e)));
    notifyListeners();
  }

  loadTrack(String url) async {
    audioPlayer.stop();
    try {
      await audioPlayer.open(
        Audio.network(
            // "https://cdns-preview-3.dzcdn.net/stream/c-34825e06538acf70d8c43cfca1788081-3.mp3",
            'https://blockdaemon-audius-discovery-02.bdnodes.net/v1/tracks/$url/stream?app_name=EMUSIC',
            metas: Metas(
                title: trackCurrent.title,
                artist: trackCurrent.user.handle,
                image: MetasImage(
                    path: trackCurrent.artwork.the480X480,
                    type: ImageType.network))),
        showNotification: true,
        autoStart: false,
      );
      // isPlaying = true;
    } catch (e) {
      print(e);
    }
  }
}
