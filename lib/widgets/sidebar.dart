import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyclone/controllers/hover_controller.dart';
import 'package:spotifyclone/data/button_list.dart';
import 'package:spotifyclone/data/menu_list.dart';
import 'package:spotifyclone/data/playlist_list.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key key,
    @required HoverController hoverController,
  })  : _hoverController = hoverController,
        super(key: key);

  final HoverController _hoverController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 240.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.music_note),
                    backgroundColor: Colors.white,
                    radius: 18,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Youfy.',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Main Menu List
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: menuItems.length,
              itemBuilder: (ctx, index) => GetBuilder<HoverController>(
                init: _hoverController,
                builder: (controller) => MouseRegion(
                  onHover: (_) {
                    controller.changeMenuHoverIndex(index);
                  },
                  onExit: (_) {
                    controller.changeMenuHoverIndex(-1);
                  },
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 6.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: index == 0 ? Colors.grey.withOpacity(0.2) : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(menuItems[index].icon),
                        SizedBox(width: 12),
                        Text(
                          menuItems[index].title,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: index == 0
                                  ? Colors.white
                                  : index == controller.menuHoverIndex
                                      ? Colors.white
                                      : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24),

            //Playlist Menu List
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: menuButtons.length,
              itemBuilder: (ctx, index) => GetBuilder<HoverController>(
                init: _hoverController,
                builder: (controller) => MouseRegion(
                  onHover: (_) {
                    controller.changeButtonHoverIndex(index);
                  },
                  onExit: (_) {
                    controller.changeButtonHoverIndex(-1);
                  },
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            gradient: menuButtons[index].backgroundColor,
                          ),
                          child: Icon(
                            menuButtons[index].icon,
                            size: 16,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          menuButtons[index].title,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: index == controller.buttonsHoverIndex ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.4),
            ),

            //Playlists List
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: playlists.length,
              itemBuilder: (ctx, index) => GetBuilder<HoverController>(
                init: _hoverController,
                builder: (controller) => MouseRegion(
                  onHover: (_) {
                    controller.changePlaylistHoverIndex(index);
                  },
                  onExit: (_) {
                    controller.changePlaylistHoverIndex(-1);
                  },
                  cursor: SystemMouseCursors.click,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      playlists[index].name,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: index == controller.playlistHoverIndex ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
