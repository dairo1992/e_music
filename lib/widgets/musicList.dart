import 'package:flutter/material.dart';

class MusicList extends StatelessWidget {
  final int index;
  final String name;
  final String artist;
  final String duration;
  const MusicList(
      {super.key,
      required this.index,
      required this.name,
      required this.artist,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          margin: const EdgeInsets.only(top: 10, right: 12, left: 5),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
              color: const Color(0xFF30314D),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Text((index + 1).toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, 'musicPage'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.5,
                          child: Text(artist,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16,
                              )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("-",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 25,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(duration,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                            )),
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
          ),
        ),
      ],
    );
  }
}
