import 'package:flutter/material.dart';
import 'package:flutter_video/view/widget/bottom_navigation_bar.dart';
import 'package:flutter_video/view/widget/drawer.dart';
import 'package:flutter_video/view/widget/video_view/video_container.dart';
import 'package:flutter_video/view/widget/video_view/video_player_screen.dart';
import 'package:flutter_video/view/widget/video_view/mobil_video_container.dart';

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
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: const VideoPlayerScreen(
                      height: 280,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                    child: Text('')
                  )
                ],
              ),
            ),
            bottomNavigationBar: const BottomNavigation(),
          );
        } else if (constraints.maxWidth < 601) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('data'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VideoPlayerScreen(
                      height: 380,
                    ),
                    //MobilVideoContainer(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomNavigation(),
          );
        } else if (constraints.maxWidth < 800) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('data'),
            ),
            drawer: const NavigationRailDrawer(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const VideoPlayerScreen(
                        height: 450,
                      ),
                    ),
                    //MobilVideoContainer(),
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth < 1000) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('data'),
            ),
            drawer: const NavigationRailDrawer(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const VideoPlayerScreen(
                        height: 560,
                      ),
                    ),
                    //MobilVideoContainer(),
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth < 1130) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('data'),
            ),
            drawer: const NavigationRailDrawer(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                    //MobilVideoContainer(),
                  ],
                ),
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('data'),
            ),
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
            ),
          );
        }
      },
    );
  }
}