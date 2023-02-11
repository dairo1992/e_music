import 'package:flutter/material.dart';

class PlayList extends StatelessWidget {
  final String urlImage;
  final String albumName;
  final int cantSongs;
  final int yearAlbum;

  const PlayList(
      {super.key,
      required this.urlImage,
      required this.albumName,
      required this.cantSongs,
      required this.yearAlbum});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 10, right: 10, left: 2),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: const Color(0xFF30314F),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, 'playListPage'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  children: [
                    Image.asset(
                      urlImage,
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.42,
                          child: Text(albumName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${cantSongs.toString()} Songs',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      yearAlbum.toString(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    // const Spacer(),
                    Icon(Icons.more_vert,
                        color: Colors.white.withOpacity(0.6), size: 30)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
