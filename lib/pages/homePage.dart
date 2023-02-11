import 'package:flutter/material.dart';
import 'package:e_music/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 6,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xFF303151).withOpacity(0.6),
            const Color(0xFF303151).withOpacity(0.6),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.sort_rounded,
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
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("Hola",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text("Que desea escuchar hoy?",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 20, bottom: 5),
                    child: Container(
                      height: 50,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: const Color(0xFF31314F),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            height: 50,
                            width: size.width * 0.6,
                            child: TextFormField(
                                decoration: InputDecoration(
                              hintText: "Buscar",
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                              border: InputBorder.none,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.search_rounded,
                              color: Colors.white.withOpacity(0.5),
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const TabBar(
                      isScrollable: true,
                      labelStyle: TextStyle(fontSize: 18),
                      indicator: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 3, color: Color(0xFF899CCF)))),
                      tabs: [
                        Tab(
                          text: "Music",
                        ),
                        Tab(
                          text: "Playlist",
                        ),
                        Tab(
                          text: "Favorites",
                        ),
                        Tab(
                          text: "New",
                        ),
                        Tab(
                          text: "Collection",
                        ),
                        Tab(
                          text: "Trending",
                        ),
                      ]),
                  Flexible(
                      child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: 120,
                        itemBuilder: (context, i) {
                          return MusicList(
                            artist: 'Arcangel Feat Bad Bunny',
                            duration: '04:35',
                            index: i,
                            name: 'La Jumpa',
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 120,
                        itemBuilder: (context, i) {
                          return const PlayList(
                            urlImage: 'assets/images/caratulaAlbum.png',
                            albumName:
                                'Sr Santos Sr Santos Sr Santos Sr Santos',
                            cantSongs: 30,
                            yearAlbum: 2022,
                          );
                        },
                      ),
                      Container(
                        color: Colors.yellow,
                      ),
                      Container(
                        color: Colors.green,
                      ),
                      Container(
                        color: Colors.white,
                      ),
                      Container(
                        color: Colors.black,
                      ),
                    ],
                  ))
                ],
              ),
            ))),
      ),
    );
  }
}
