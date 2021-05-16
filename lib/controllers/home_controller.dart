import 'package:get/state_manager.dart';
import 'package:spotifyclone/data/model/Playlist.dart';
import 'package:spotifyclone/data/repo/api_repo.dart';

class HomeController extends GetxController {
  var res;
  final apiRepo = ApiRepo();
  List<PlaylistM> homePlaylists = [];

  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }

  void getHomeData() async {
    var playlistsToFetch = [
      {'slag': 'Bollywood Hits', 'id': 'RDCLAK5uy_n9Fbdw7e6ap-98_A-8JYBmPv64v-Uaq1g'},
      {
        'slag': 'Latest',
        'id': 'RDCLAK5uy_ksEjgm3H_7zOJ_RHzRjN1wY-_FFcs7aAU',
      },
      {
        'slag': 'Top 100 India',
        'id': 'PL4fGSI1pDJn40WjZ6utkIuj2rNg-7iGsq',
      },
      {
        'slag': 'Top 100 India',
        'id': 'PL4fGSI1pDJn40WjZ6utkIuj2rNg-7iGsq',
      },
      {
        'slag': 'Top 100 India',
        'id': 'PL4fGSI1pDJn40WjZ6utkIuj2rNg-7iGsq',
      }
    ];

    await Future.forEach(playlistsToFetch, (list) async {
      PlaylistM playlist = await apiRepo.getPlaylistItems(list['id'], 10);
      playlist.title = list['slag'];
      homePlaylists.add(playlist);
    });
    update();
  }
}
