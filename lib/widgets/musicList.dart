import 'package:e_music/models/track_info_model.dart';
import 'package:e_music/providers/playing_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicList extends StatelessWidget {
  // final List<Track> tracks;
  // final int index;
  // final String name;
  // final String artist;
  // final String duration;
  const MusicList({
    super.key,
    // required this.tracks,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final playingService = Provider.of<PlayingService>(context);
    return SingleChildScrollView(
      child: Column(
        children: List.generate(playingService.trackList.length, (i) {
          return Container(
            width: size.width,
            margin: const EdgeInsets.only(top: 10, right: 12, left: 5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
                color: const Color(0xFF30314D),
                borderRadius: BorderRadius.circular(10)),
            child: playingService.trackList.isNotEmpty
                ? Row(
                    children: [
                      Text((i + 1).toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          // await playingService.getTrack();
                          Navigator.pushNamed(context, 'musicPage',
                              arguments: playingService.trackList[i]);
                          // await playingService.loadTrack(context);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.6,
                              child: Text(playingService.trackList[i].title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.7,
                                  child: Text(
                                      playingService.trackList[i].user.name
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Icon(
                          Icons.play_arrow_sharp,
                          size: 25,
                          color: Color(0xFF31314F),
                        ),
                      )
                    ],
                  )
                : CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}


// 3107483255

// 6 camaras wifi