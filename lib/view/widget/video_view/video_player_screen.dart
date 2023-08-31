// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_video/view/widget/bounding_box.dart';
import 'package:video_player/video_player.dart';

import '../../../view_model/object_detection_view_model.dart';

class VideoPlayerScreen extends StatefulWidget {
  final double? height;
  const VideoPlayerScreen({super.key, this.height});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _VideoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController.
    _VideoPlayerController = _VideoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    );
    //_VideoPlayerController = VideoPlayerController.asset("assets/videos/video2.mp4");              video play assets

    
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _VideoPlayerController.initialize();

    // Use the controller to loop the video.
    _VideoPlayerController.setLooping(false);
  }

  @override
  void dispose() {
    // Pause the video before disposing of the VideoPlayerController to stop playback.
    _VideoPlayerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (context, ref, child) {
        final videoCoordinats = ref.watch(objectProvider);
        return videoCoordinats.when(
            data: (x) {
              return Container(
                padding: const EdgeInsets.only(right: 16, left: 16),
                constraints: BoxConstraints(maxHeight: widget.height!),
                child: Stack(
                  children: [
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (_, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Column(
                            children: [
                              // If the VideoPlayerController has finished initialization, use
                              // the data
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: _VideoPlayerController
                                      .value.aspectRatio,
                                  // Use the VideoPlayer widget to display the video.
                                  child:
                                      VideoPlayer(_VideoPlayerController),
                                ),
                              ),
                              // show the video progress 
                              VideoProgressIndicator(
                                _VideoPlayerController,
                                allowScrubbing: true,
                                padding: EdgeInsets.zero,
                                colors: VideoProgressColors(
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                  playedColor: Theme.of(context).colorScheme.error,
                                  bufferedColor: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const SizedBox(width: 2),
                                  InkWell(
                                    onTap: () {
                                      if (_VideoPlayerController
                                          .value.isPlaying) {
                                        _VideoPlayerController.pause();
                                      } else {
                                        _VideoPlayerController.play();
                                      }
                                    },
                                    child: ValueListenableBuilder<
                                        VideoPlayerValue>(
                                      valueListenable:
                                          _VideoPlayerController,
                                      builder: (_, _videoPlayerValue, __) {
                                        return Icon(
                                          _videoPlayerValue.isPlaying
                                              ? Icons
                                                  .pause_circle_outline_rounded
                                              : Icons
                                                  .play_circle_outline_rounded,
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  InkWell(
                                    onTap: () {
                                      _VideoPlayerController
                                          .seekTo(const Duration(seconds: 0));
                                      _VideoPlayerController.pause();
                                    },
                                    child:
                                        const Icon(Icons.stop_circle_outlined),
                                  ),
                                  const SizedBox(width: 2),
                                  // render duration video with current position / total video duration
                                  ValueListenableBuilder<VideoPlayerValue>(
                                    valueListenable:
                                        _VideoPlayerController,
                                    builder: (_, _videoPlayerValue, __) {
                                      return Text(
                                        "00:${_videoPlayerValue.position.inSeconds.toString().padLeft(2, '0')}",
                                      );
                                    },
                                  ),
                                  Text(
                                    " / 00:${_VideoPlayerController.value.duration.inSeconds.toString()}",
                                  ),
                                  const Spacer(),
                                  //render Volume button
                                  InkWell(
                                    onTap: () {
                                      if (_VideoPlayerController
                                              .value.volume ==
                                          0.0) {
                                        _VideoPlayerController
                                            .setVolume(1.0);
                                      } else {
                                        _VideoPlayerController
                                            .setVolume(0.0);
                                      }
                                    },
                                    child: ValueListenableBuilder<
                                        VideoPlayerValue>(
                                      valueListenable:
                                          _VideoPlayerController,
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
                            constraints:
                                BoxConstraints(maxHeight: widget.height!),
                            padding: const EdgeInsets.only(top: 2),
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          );
                        }
                      },
                    ),
                    //build video' s BoundingBox
                    ValueListenableBuilder<VideoPlayerValue>(
                      valueListenable: _VideoPlayerController,
                      builder: (_, _videoPlayerValue, __) {
                        int index = -1;
                        index = x.indexWhere((video) => video.second == _videoPlayerValue.position.inSeconds);
                        if(index != -1){
                          debugPrint(index.toString());
                          return BoundingBox(
                              x[index].object,
                              widget.height!,
                              width,
                            );
                        }else{
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => Text('Error: $err'));
      },
    );
  }
}
