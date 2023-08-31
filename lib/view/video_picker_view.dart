import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_video/view/widget/appbar_web.dart';
import 'package:flutter_video/view/widget/bottom_navigation_bar.dart';
import 'package:flutter_video/view/widget/drawer.dart';
import 'package:flutter_video/view/widget/photo_view/file_picker_button.dart';
import 'package:flutter_video/view/widget/photo_view/text_form_image_container.dart';
import 'package:flutter_video/view/widget/video_picker_view/video_picker_player_screen.dart';
import 'package:flutter_video/view/widget/video_view/video_container.dart';
import 'package:flutter_video/view/widget/video_view/video_player_screen.dart';

import '../view_model/image_handling_view_model.dart';

class VideoPickerPlayerView extends ConsumerWidget {
  const VideoPickerPlayerView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    child: const VideoPickerPlayerScreen(
                      height: 280,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                      child: Text(''))
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
                    const VideoPickerPlayerScreen(
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
                      child: const VideoPickerPlayerScreen(
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
                      child: const VideoPickerPlayerScreen(
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
                      child: const VideoPickerPlayerScreen(
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
                          child: const VideoPickerPlayerScreen(
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 790,
                          width: 1370,
                          child: const VideoPickerPlayerScreen(
                            height: 790,
                          ),
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const TextFormImageContainer(),
                            const SizedBox(height: 75,),
                            Container(
                              width: 300,
                              height: 100,
                              child: FilePickerButton(
                                onPressed: () async {
                                  //File Picker
                                  
                                },
                              ),
                            )
                          ],
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
