import 'package:get/state_manager.dart';

class HoverController extends GetxController {
  int menuHoverIndex = -1;
  int buttonsHoverIndex = -1;
  int playlistHoverIndex = -1;

  changeMenuHoverIndex(int index) {
    menuHoverIndex = index;
    update();
  }

  changeButtonHoverIndex(int index) {
    buttonsHoverIndex = index;
    update();
  }

  changePlaylistHoverIndex(int index) {
    playlistHoverIndex = index;
    update();
  }
}
