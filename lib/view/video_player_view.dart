import 'package:flutter/material.dart';
import 'package:flutter_video/view/widget/appbar_web.dart';
import 'package:flutter_video/view/widget/bottom_navigation_bar.dart';
import 'package:flutter_video/view/widget/drawer.dart';
import 'package:flutter_video/view/widget/video_view/video_container.dart';
import 'package:flutter_video/view/widget/video_view/video_player_screen.dart';
import 'package:flutter_video/view/widget/video_view/mobil_video_container.dart';


class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 430) {
          return buildMobil();
        } else if (constraints.maxWidth < 601) {
          return buildTablet(320);
        } else if (constraints.maxWidth < 800) {
          return buildTablet( 450);
        } else if (constraints.maxWidth < 1000) {
          return buildTablet( 560);
        } else if (constraints.maxWidth < 1250) {
          return buildTablet( 600);
        } else if (constraints.maxWidth < 1600) {
          return buildWeb(650, 1120, 560);
        } else {
          return buildWeb(800, 1370, 750);
        }
      },
    );
  }

  Scaffold buildMobil() {
    return Scaffold(
          appBar: const AppbarWidget(topic: 'Video Player'),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const VideoPlayerScreen(
                    height: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                  child: MobilVideoContainer(),
                )
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavigation(),
        );
  }



  Scaffold buildTablet( double containerHeight) {
    return Scaffold(
          appBar: const AppbarWidget(topic: 'Video Player'),
          drawer: const NavigationRailDrawer(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: VideoPlayerScreen(
                    height: containerHeight,
                  ),
                ),
                MobilVideoContainer(),
              ],
            ),
          ),
        );
  }

  Scaffold buildWeb(double containerHeight, double containerWidth, double videoContainerHeight) {
    return Scaffold(
          appBar: const AppbarWidget(topic: 'Video Player'),
          drawer: const NavigationRailDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: containerWidth,
                        child: VideoPlayerScreen(
                          height: containerHeight,
                        ),
                      ),
                      Expanded(
                          child: VideoContainer(
                        height: videoContainerHeight,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
