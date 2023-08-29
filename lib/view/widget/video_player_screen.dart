import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_video/model/object_detectio_model.dart';
import 'package:flutter_video/view/widget/bounding_box.dart';
import 'package:video_player/video_player.dart';

import '../../view_model/object_detection_view_model.dart';

class VideoPlayerScreen extends StatefulWidget {
  final double? height;
  const VideoPlayerScreen({super.key, this.height});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _phenikaaVideoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _phenikaaVideoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _phenikaaVideoPlayerController.initialize();

    // Use the controller to loop the video.
    _phenikaaVideoPlayerController.setLooping(false);
  }

  @override
  void dispose() {
    // Pause the video before disposing of the VideoPlayerController to stop playback.
    _phenikaaVideoPlayerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Consumer(
      builder: (context, ref, child) {
        List<VideoModel> x = ref.watch(videoProvider.notifier).state;
        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: widget.height!
            ),

            child: Stack(
              children: [
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          // If the VideoPlayerController has finished initialization, use
                          // the data it provides to limit the aspect ratio of the video.
                          AspectRatio(
                            aspectRatio:
                                _phenikaaVideoPlayerController.value.aspectRatio,
                            // Use the VideoPlayer widget to display the video.
                            child: VideoPlayer(_phenikaaVideoPlayerController),
                          ),
                          // show the video progress & scrubbing by touch event on it
                          VideoProgressIndicator(
                            _phenikaaVideoPlayerController,
                            allowScrubbing: true,
                            padding: EdgeInsets.zero,
                            colors: const VideoProgressColors(
                              backgroundColor: Color(0xFF243771),
                              playedColor: Colors.red,
                              bufferedColor: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const SizedBox(width: 2),
                              InkWell(
                                onTap: () {
                                  if (_phenikaaVideoPlayerController
                                      .value.isPlaying) {
                                    _phenikaaVideoPlayerController.pause();
                                  } else {
                                    _phenikaaVideoPlayerController.play();
                                  }
                                },
                                child: ValueListenableBuilder<VideoPlayerValue>(
                                  valueListenable: _phenikaaVideoPlayerController,
                                  builder: (_, _videoPlayerValue, __) {
                                    return Icon(
                                      _videoPlayerValue.isPlaying
                                          ? Icons.pause_circle_outline_rounded
                                          : Icons.play_circle_outline_rounded,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 2),
                              InkWell(
                                onTap: () {
                                  _phenikaaVideoPlayerController
                                      .seekTo(const Duration(seconds: 0));
                                  _phenikaaVideoPlayerController.pause();
                                },
                                child: const Icon(Icons.stop_circle_outlined),
                              ),
                              const SizedBox(width: 2),
                              // render duration video with current position / total video duration
                              ValueListenableBuilder<VideoPlayerValue>(
                                valueListenable: _phenikaaVideoPlayerController,
                                builder: (_, _videoPlayerValue, __) {
                                  return Text(
                                    "00:${_videoPlayerValue.position.inSeconds.toString().padLeft(2, '0')}",
                                  );
                                },
                              ),
                              Text(
                                " / 00:${_phenikaaVideoPlayerController.value.duration.inSeconds.toString()}",
                              ),
                              const Spacer(),
                              //render Volume button
                              InkWell(
                                onTap: () {
                                  if (_phenikaaVideoPlayerController
                                          .value.volume ==
                                      0.0) {
                                    _phenikaaVideoPlayerController.setVolume(1.0);
                                  } else {
                                    _phenikaaVideoPlayerController.setVolume(0.0);
                                  }
                                },
                                child: ValueListenableBuilder<VideoPlayerValue>(
                                  valueListenable: _phenikaaVideoPlayerController,
                                  builder: (_, _videoPlayerValue, __) {
                                    return Icon(
                                      _videoPlayerValue.volume == 0.0
                                          ? Icons.volume_off_outlined
                                          : Icons.volume_up_outlined,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 2),
                            ],
                          ),
                        ],
                      );
                    } else {
                      // If the VideoPlayerController is still initializing, show a
                      // loading spinner.
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 2),
                        child: const CircularProgressIndicator(
                          color: Color(0xFF243771),
                        ),
                      );
                    }
                  },
                ),
                ValueListenableBuilder<VideoPlayerValue>(
                  valueListenable: _phenikaaVideoPlayerController,
                  builder: (_, _videoPlayerValue, __) {
                    if (_videoPlayerValue.position.inSeconds == x[i].second) {
                      if (i == x.length - 1) {
                        i = 0;
                      } else {
                        debugPrint(i.toString());
                        ++i;
                        return BoundingBox(
                          x[i - 1].object,
                          widget.height!,
                          MediaQuery.of(context).size.width,
                        );
                      }
                      debugPrint('calisti1');
                      debugPrint(i.toString());
                      return BoundingBox(
                        x[x.length - 1].object,
                        widget.height!,
                        MediaQuery.of(context).size.width,
                      );
                    } else {
                      debugPrint('calisti2');
                      return Container();
                    }
                  },
                ),
                /* BoundingBox(
                  widget.videoCoordinats,
                  1000,
                  1280,
                  1080,
                  1920,
                ), */
              ],
            ),
          ),
        );
      },
    );
  }
}

/* 
ValueListenableBuilder<VideoPlayerValue>(
          valueListenable: _phenikaaVideoPlayerController,
          builder: (_, _videoPlayerValue, __) {
            if (_videoPlayerValue.position.inSeconds ==
                widget.secondValue[i]) {
              if (i == widget.secondValue.length - 1) {
                i = 0;
              } else {
                i++;
              }
              debugPrint(widget.videoCoordinats[i].toString());
              return BoundingBox(
                widget.videoCoordinats[i],
                700,
                600,
                height,
                width,
              );
            } else {
              return Container();
            }
          },
        ), */


        /* ValueListenableBuilder<VideoPlayerValue>(
          valueListenable: _phenikaaVideoPlayerController,
          builder: (_, _videoPlayerValue, __) {
            if (i == widget.secondValue.length - 1) {
              i = 0;
            } else {
              if (_videoPlayerValue.position.inSeconds ==
                  widget.secondValue[i]) {
                    i++;
                debugPrint(i.toString());
                return BoundingBox(
                  widget.videoCoordinats[i-1],
                  700,
                  600,
                  height,
                  width,
                );
              } else {
                return Container();
              }
            }
            return Container();
          },
        ), */



        /* ValueListenableBuilder<VideoPlayerValue>(
                valueListenable: _phenikaaVideoPlayerController,
                builder: (_, _videoPlayerValue, __) {
                  if (_videoPlayerValue.position.inSeconds ==
                      widget.secondValue[i]) {
                    if (i == widget.secondValue.length - 1) {
                      i = 0;
                    } else {
                      debugPrint(i.toString());
                      ++i;
                      return BoundingBox(
                        widget.videoCoordinats[i - 1],
                        700,
                        600,
                        height,
                        width,
                      );
                    }
                    debugPrint('calisti1');
                    debugPrint(i.toString());
                    return BoundingBox(
                      widget.videoCoordinats[i + widget.secondValue.length - 1],
                      700,
                      600,
                      height,
                      width,
                    );
                  } else {
                    debugPrint('calisti2');
                    return Container();
                  }
                },
              ), */