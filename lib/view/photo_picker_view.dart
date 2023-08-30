import 'package:flutter/material.dart';
import 'package:flutter_video/view/widget/appbar_web.dart';
import 'package:flutter_video/view/widget/bottom_navigation_bar.dart';
import 'package:flutter_video/view/widget/drawer.dart';
import 'package:flutter_video/view/widget/photo_view/file_picker_button.dart';
import 'package:flutter_video/view/widget/photo_view/image_widget.dart';
import 'package:flutter_video/view/widget/photo_view/text_form_image_container.dart';



class PhotoPickerView extends StatefulWidget {
  const PhotoPickerView({Key? key}) : super(key: key);

  @override
  State<PhotoPickerView> createState() => _PhotoPickerViewState();
}

class _PhotoPickerViewState extends State<PhotoPickerView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1200) {
          return Scaffold(
            appBar: const AppbarWidget(topic: 'Photo Taker'),
            drawer: const NavigationRailDrawer(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Expanded(flex: 2, child: ImageWidget()),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 16.0, left: 16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const TextFormImageContainer(),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 32),
                                    width: 300,
                                    height: 100,
                                    child: const FilePickerButton(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth > 500) {
          return Scaffold(
              appBar: const AppbarWidget(topic: 'Photo Taker'),
              drawer: const NavigationRailDrawer(),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const ImageWidget(),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 16.0, left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const TextFormImageContainer(),
                                const SizedBox(
                                  height: 26,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 16),
                                  width: 300,
                                  height: 100,
                                  child: const FilePickerButton(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        } else {
          return Scaffold(
            appBar: AppbarWidget(topic: 'Photo Taker'),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const ImageWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 16.0, left: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              TextFormImageContainer(),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: const BottomNavigation(),
            floatingActionButton: Container(
              child: const FilePickerButton()),
          );
        }
      },
    );
  }
}
