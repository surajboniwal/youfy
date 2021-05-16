import 'package:dio/dio.dart';
import 'package:spotifyclone/data/model/Playlist.dart';

class ApiRepo {
  static const BASE_URL = 'www.googleapis.com';

  getPlaylistItems(playlistId, maxResults) async {
    var response = await Dio().get(
        'https://www.googleapis.com/youtube/v3/playlistItems',
        queryParameters: {
          'key': 'AIzaSyDIpu9Lk8yikaPOb-QgDKq-Zsllb5Xs4eg',
          'playlistId': playlistId,
          'part': 'id,snippet',
          'maxResults': maxResults
        });
    Playlist playlist = Playlist.fromJson(response.data);
    return playlist;
  }
}
