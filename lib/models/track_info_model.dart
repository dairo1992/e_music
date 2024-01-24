// To parse this JSON data, do
//
//     final trackInfo = trackInfoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Track trackInfoFromJson(String str) => Track.fromJson(json.decode(str));

String trackInfoToJson(Track data) => json.encode(data.toJson());

class Track {
  Track({
    required this.artwork,
    required this.description,
    required this.genre,
    required this.id,
    required this.trackCid,
    required this.mood,
    required this.releaseDate,
    required this.remixOf,
    required this.repostCount,
    required this.favoriteCount,
    required this.tags,
    required this.title,
    required this.user,
    required this.duration,
    required this.downloadable,
    required this.playCount,
    required this.permalink,
    required this.isStreamable,
  });

  Artwork artwork;
  String description;
  String genre;
  String id;
  String trackCid;
  String mood;
  String releaseDate;
  RemixOf remixOf;
  int repostCount;
  int favoriteCount;
  dynamic tags;
  String title;
  User user;
  int duration;
  bool downloadable;
  int playCount;
  String permalink;
  bool isStreamable;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        artwork: Artwork.fromJson(json["artwork"]),
        description: json["description"] ?? '',
        genre: json["genre"] ?? '',
        id: json["id"] ?? '',
        trackCid: json["track_cid"] ?? '',
        mood: json["mood"] ?? '',
        releaseDate: json["release_date"] ?? '',
        remixOf: RemixOf.fromJson(json["remix_of"]),
        repostCount: json["repost_count"] ?? 0,
        favoriteCount: json["favorite_count"] ?? 0,
        tags: json["tags"] ?? '',
        title: json["title"] ?? '',
        user: User.fromJson(json["user"]),
        duration: json["duration"] ?? 0,
        downloadable: json["downloadable"] ?? false,
        playCount: json["play_count"] ?? 0,
        permalink: json["permalink"] ?? '',
        isStreamable: json["is_streamable"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "artwork": artwork.toJson(),
        "description": description,
        "genre": genre,
        "id": id,
        "track_cid": trackCid,
        "mood": mood,
        "release_date": releaseDate,
        "remix_of": remixOf.toJson(),
        "repost_count": repostCount,
        "favorite_count": favoriteCount,
        "tags": tags,
        "title": title,
        "user": user.toJson(),
        "duration": duration,
        "downloadable": downloadable,
        "play_count": playCount,
        "permalink": permalink,
        "is_streamable": isStreamable,
      };
}

class Artwork {
  Artwork({
    required this.the150X150,
    required this.the480X480,
    required this.the1000X1000,
  });

  String the150X150;
  String the480X480;
  String the1000X1000;

  factory Artwork.fromJson(Map<String, dynamic> json) => Artwork(
        the150X150: json["150x150"],
        the480X480: json["480x480"],
        the1000X1000: json["1000x1000"],
      );

  Map<String, dynamic> toJson() => {
        "150x150": the150X150,
        "480x480": the480X480,
        "1000x1000": the1000X1000,
      };
}

class RemixOf {
  RemixOf({
    required this.tracks,
  });

  dynamic tracks;

  factory RemixOf.fromJson(Map<String, dynamic> json) => RemixOf(
        tracks: json["tracks"],
      );

  Map<String, dynamic> toJson() => {
        "tracks": tracks,
      };
}

class User {
  User({
    required this.albumCount,
    required this.artistPickTrackId,
    required this.bio,
    this.coverPhoto,
    required this.followeeCount,
    required this.followerCount,
    required this.doesFollowCurrentUser,
    required this.handle,
    required this.id,
    required this.isVerified,
    required this.location,
    required this.name,
    required this.playlistCount,
    required this.profilePicture,
    required this.repostCount,
    required this.trackCount,
    required this.isDeactivated,
    required this.ercWallet,
    required this.splWallet,
    required this.supporterCount,
    required this.supportingCount,
  });

  int albumCount;
  int artistPickTrackId;
  String bio;
  CoverPhoto? coverPhoto;
  int followeeCount;
  int followerCount;
  bool doesFollowCurrentUser;
  String handle;
  String id;
  bool isVerified;
  String location;
  String name;
  int playlistCount;
  Artwork profilePicture;
  int repostCount;
  int trackCount;
  bool isDeactivated;
  String ercWallet;
  String splWallet;
  int supporterCount;
  int supportingCount;

  factory User.fromJson(Map<String, dynamic> json) => User(
        albumCount: json["album_count"],
        artistPickTrackId: json["artist_pick_track_id"] != null
            ? int.parse(json["artist_pick_track_id"])
            : 0,
        bio: json["bio"] != null ? json["bio"] : '',
        coverPhoto: CoverPhoto.fromJson(
            json["cover_photo"] ?? {'the640X': '', 'the2000X': ''}),
        followeeCount: json["followee_count"],
        followerCount: json["follower_count"],
        doesFollowCurrentUser: json["does_follow_current_user"],
        handle: json["handle"],
        id: json["id"],
        isVerified: json["is_verified"],
        location: json["location"] != null ? json["location"] : '',
        name: json["name"],
        playlistCount: json["playlist_count"],
        profilePicture: Artwork.fromJson(json["profile_picture"]),
        repostCount: json["repost_count"],
        trackCount: json["track_count"],
        isDeactivated: json["is_deactivated"],
        ercWallet: json["erc_wallet"],
        splWallet: json["spl_wallet"],
        supporterCount: json["supporter_count"],
        supportingCount: json["supporting_count"],
      );

  Map<String, dynamic> toJson() => {
        "album_count": albumCount,
        "artist_pick_track_id": artistPickTrackId,
        "bio": bio,
        "cover_photo": coverPhoto!.toJson(),
        "followee_count": followeeCount,
        "follower_count": followerCount,
        "does_follow_current_user": doesFollowCurrentUser,
        "handle": handle,
        "id": id,
        "is_verified": isVerified,
        "location": location,
        "name": name,
        "playlist_count": playlistCount,
        "profile_picture": profilePicture.toJson(),
        "repost_count": repostCount,
        "track_count": trackCount,
        "is_deactivated": isDeactivated,
        "erc_wallet": ercWallet,
        "spl_wallet": splWallet,
        "supporter_count": supporterCount,
        "supporting_count": supportingCount,
      };
}

class CoverPhoto {
  CoverPhoto({
    required this.the640X,
    required this.the2000X,
  });

  String the640X;
  String the2000X;

  factory CoverPhoto.fromJson(Map<String, dynamic> json) => CoverPhoto(
        the640X: json["640x"] ?? '',
        the2000X: json["2000x"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "640x": the640X,
        "2000x": the2000X,
      };
}
