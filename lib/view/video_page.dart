import 'package:flutter/material.dart';
import 'package:flutter_video/utils/map.dart';
import 'package:flutter_video/view/widget/bottom_navigation_bar.dart';
import 'package:flutter_video/view/widget/drawer.dart';
import 'package:flutter_video/view/widget/video_container.dart';
import 'package:flutter_video/view/widget/video_player_screen.dart';

/* class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Butterfly Video'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: VideoPlayerScreen(
                        videoCoordinats: DummyData.dummyData,
                        secondValue: DummyData.secondValues,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    const Expanded(child: VideoContainer())
                  ],
                ),
              ),
            ],
          ),
        ));
  }
} */

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 430) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('data'),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    child: const VideoPlayerScreen(
                      height: 210,
                    ),
                  ),
                  VideoContainer(
                    height: 400,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const BottomNavigation(),
          );
        }else if (constraints.maxWidth < 601) {
          return Scaffold(
            appBar: AppBar(
              title: Text('data'),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 500,
                    child: const VideoPlayerScreen(
                      height: 290,
                    ),
                  ),
                  VideoContainer(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        } 
        else if (constraints.maxWidth < 1000) {
          return Scaffold(
            appBar: AppBar(
              title: Text('data'),
            ),
            drawer: const NavigationRailDrawer(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 800,
                    child: const VideoPlayerScreen(
                      height: 450,
                    ),
                  ),
                  VideoContainer(),
                ],
              ),
            ),
          );
        } else if (constraints.maxWidth < 1200) {
          return Scaffold(
            appBar: AppBar(
              title: Text('data'),
            ),
            drawer: const NavigationRailDrawer(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 1100,
                    child: const VideoPlayerScreen(
                      height: 650,
                    ),
                  ),
                  VideoContainer(),
                ],
              ),
            ),
          );
        } else if (constraints.maxWidth < 1600) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('data'),
            ),
            drawer: const NavigationRailDrawer(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: 1000,
                        child: const VideoPlayerScreen(
                          height: 700,
                        ),
                      ),
                      Expanded(

                        child: VideoContainer(
                          height: 560,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('data'),
            ),
            drawer: const NavigationRailDrawer(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 900,
                        width: 1370,
                        child: const VideoPlayerScreen(
                          height: 900,
                        ),
                      ),
                      Expanded(
                          child: VideoContainer(
                        height: 750,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
