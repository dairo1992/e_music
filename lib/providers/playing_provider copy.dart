// import 'dart:async';
// import 'dart:convert';
// import 'package:e_music/models/track_info_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';

// class PlayingService with ChangeNotifier {
//   String _baseUrl = "discoveryprovider3.audius.co";
//   String apiUrl = "v1/tracks/";

//   final audioPlayer = AssetsAudioPlayer();
//   // bool _isPlaying = false;

//   final StreamController<bool> _playingStreamController =
//       StreamController.broadcast();

//   final StreamController<Track> _trackInfoStreamController =
//       StreamController.broadcast();

//   Stream<bool> get Playing => _playingStreamController.stream;

//   set isPlaying(bool value) {
//     _playingStreamController.add(value);
//   }

//   getTrack() async {
//     final url = Uri.https(_baseUrl, apiUrl + 'QZV4Jl1', {'app_name': 'EMUSIC'});
//     final response = await http.get(url);
//     final responseData = Track.fromJson(jsonDecode(response.body));
//     _trackInfoStreamController.add(responseData);
//   }

//   // loadTrack(BuildContext context) async {
//   //   // print(responseData['data']['title']);
//   //   // final searchResponse = SearchResponse.fromJson(response.body);
//   //   // return searchResponse.results;
//   //   await getTrack();
//   //   notifyListeners();
//   //   try {
//   //     await audioPlayer.open(
//   //       Audio.network(
//   //           "https://audius-discovery-3.cultur3stake.com/v1/tracks/QZV4Jl1/stream?app_name=EMUSIC",
//   //           metas: Metas(
//   //             title: '',
//   //             artist: "Arcangel",
//   //             // image: MetasImage(
//   //             //     path: responseData['data']['artwork']['1000x1000'],
//   //             //     type: ImageType.network)
//   //           )),
//   //       showNotification: true,
//   //       autoStart: false,
//   //     );
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   //   // print('Nombre->${audioPlayer.getCurrentAudioArtist}');
//   //   // print('Nombre->${audioPlayer.isBuffering.value}');
//   //   ChangeNotifier();
//   //   print('****************************************************');
//   //   // print(currentPlayingsImage);
//   //   print('****************************************************');
//   //   Navigator.pushNamed(context, 'musicPage');
//   // }
// }
