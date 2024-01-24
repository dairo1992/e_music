import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:e_music/models/track_info_model.dart';
import 'package:e_music/providers/playing_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  final playingService = PlayingService();

  MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Track track = ModalRoute.of(context)!.settings.arguments as Track;
    final size = MediaQuery.of(context).size;
    // if(playingService.audioPlayer.isPlaying){}
    playingService.trackCurrent = track;
    playingService.loadTrack(track.id);
    // audioPlayer.open(Audio('assets/music/Invicto.mp3'),
    //     showNotification: true, autoStart: false);
    // audioPlayer.aut
    return Stack(
      children: [
        FadeInImage(
          placeholder: const AssetImage('assets/images/background.jpg'),
          image: NetworkImage(track.artwork.the1000X1000),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/images/background.jpg',
                fit: BoxFit.fitWidth);
          },
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.5),
                    Color(0xFF303151).withOpacity(1),
                    Color(0xFF303151).withOpacity(1),
                    // const Color.fromARGB(199, 168, 2, 2).withOpacity(1),
                    // const Color.fromARGB(255, 247, 3, 3).withOpacity(1),
                  ])),
              child: Container(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 45, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.pushReplacementNamed(context, 'home'),
                            child: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: size.height / 2.5,
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 23, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    track.user.handle,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.7,
                                    child: Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      track.title,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(Icons.favorite,
                                  color: Colors.red, size: 35)
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Slider(
                              min: 0,
                              max: 100,
                              value: 30,
                              onChanged: (value) {},
                              activeColor: Colors.white,
                              inactiveColor: Colors.white54,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("02:10",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      '0${track.duration.toString().substring(2)}:${track.duration.toString().substring(1)}',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.list,
                                  color: Colors.white,
                                  size: 32,
                                )),
                            const Icon(
                              CupertinoIcons.backward_end_fill,
                              color: Colors.white,
                              size: 32,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: StreamBuilder(
                                // stream: playingService.Playing,
                                builder: (BuildContext context,
                                    AsyncSnapshot<bool> snapshot) {
                                  return IconButton(
                                      // alignment: Alignment.center,
                                      padding: EdgeInsets.all(3),
                                      onPressed: () async {
                                        try {
                                          playingService.audioPlayer
                                              .playOrPause();
                                          //   playingService.audioPlayer
                                          //       .playOrPause();
                                          // playingService.isPlaying =
                                          //     playingService.audioPlayer
                                          //         .isPlaying.value;
                                        } catch (e) {
                                          print("Error al cargar music \n $e");
                                        }
                                        // await audioPlayer
                                        // .play('assets/music/Invicto.mp3');
                                      },
                                      icon: Icon(
                                        snapshot.data == null || snapshot.data!
                                            ? Icons.play_arrow_rounded
                                            : Icons.pause,
                                        color: Color(0xFF303151),
                                        size: 40,
                                      ));
                                }, stream: null,
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.forward_end_fill,
                              color: Colors.white,
                              size: 32,
                            ),
                            Icon(
                              Icons.download,
                              color: track.downloadable
                                  ? Colors.white
                                  : Colors.white30,
                              size: 32,
                            ),
                          ],
                        )
                      ]),
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
