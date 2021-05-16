import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyclone/controllers/home_controller.dart';
import 'package:spotifyclone/controllers/hover_controller.dart';
import 'package:spotifyclone/widgets/sidebar.dart';

class HomeScreen extends StatelessWidget {
  final HoverController _hoverController = Get.find<HoverController>();
  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: Stack(
        children: [
          Row(
            children: [
              SideBar(hoverController: _hoverController),

              //Scren
              Expanded(
                child: Container(
                  height: double.infinity,
                  child: GetBuilder<HomeController>(
                    init: _homeController,
                    builder: (controller) => ListView.builder(
                      itemCount: controller.homePlaylists.length,
                      itemBuilder: (ctx, index) => Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.homePlaylists[index].title,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Container(
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.homePlaylists[index].items.length,
                                itemBuilder: (ctx, i) => Container(
                                  width: 180.0,
                                  margin: EdgeInsets.only(right: 24.0),
                                  padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF181818),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(3),
                                          child: Image.network(
                                            controller.homePlaylists[index].items[i].snippet.thumbnails.maxres != null ? controller.homePlaylists[index].items[i].snippet.thumbnails.maxres.url : 'https://image.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12.0),
                                        child: Text(
                                          controller.homePlaylists[index].items[i].snippet.title,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 12.0),
                                        child: Text(
                                          controller.homePlaylists[index].items[i].snippet.videoOwnerChannelTitle,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              height: 90.0,
              color: Color(0xFF181818),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300.0,
                    child: GetBuilder(
                      init: _homeController,
                      builder: (controller) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            _homeController.homePlaylists[0].items[0].snippet.thumbnails.maxres.url,
                            height: 55,
                            width: 55,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 12.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _homeController.homePlaylists[0].items[0].snippet.title.substring(0, 25) + '...',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                _homeController.homePlaylists[0].items[0].snippet.videoOwnerChannelTitle,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 300.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.shuffle,
                                color: Colors.grey,
                              ),
                              Icon(
                                Icons.skip_previous,
                                color: Colors.grey,
                              ),
                              CircleAvatar(
                                radius: 16.0,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.skip_next,
                                color: Colors.grey,
                              ),
                              Icon(
                                Icons.repeat,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 600.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '0:00',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 11.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Slider(
                                  inactiveColor: Colors.grey[700],
                                  activeColor: Colors.grey,
                                  onChanged: (v) {},
                                  value: 2.0,
                                  max: 10.0,
                                  mouseCursor: MouseCursor.defer,
                                ),
                              ),
                              Text(
                                '3:46',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 11.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 300.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.volume_up,
                          color: Colors.grey,
                        ),
                        Slider(
                          inactiveColor: Colors.grey[700],
                          activeColor: Colors.grey,
                          onChanged: (v) {},
                          value: 2.0,
                          max: 10.0,
                          mouseCursor: MouseCursor.defer,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
