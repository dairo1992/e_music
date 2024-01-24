import 'package:e_music/widgets/musicList.dart';
import 'package:flutter/material.dart';

class PlayListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color(0xFF303151).withOpacity(0.6),
          const Color(0xFF303151).withOpacity(0.6),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios,
                          color: Colors.white, size: 30),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.more_vert,
                          color: Colors.white, size: 30),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: size.width * 0.5,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    "assets/images/caratulaAlbum.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Text("Sr Santos",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Pistas",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ))
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 170,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Play all",
                              style: TextStyle(
                                  color: Color(0xFF30314D),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.play_arrow_rounded,
                              size: 40, color: Color(0xFF30314D))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 170,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Color(0xFF30314D),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Shuffle",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.shuffle, size: 25, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // SizedBox(
              //   width: size.width,
              //   height: size.height * 0.4,
              //   child: ListView.builder(
              //     itemCount: 120,
              //     itemBuilder: (context, i) {
              //       return MusicList(
              //         artist: 'Arcangel Feat Bad Bunny',
              //         duration: '04:35',
              //         index: i,
              //         name: 'La Jumpa',
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        )),
      ),
    );
  }
}
