import 'dart:math';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:learning_app/app/constants/color.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videos = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _dispose = false;

  int _isPlayingIndex = -1;

  VideoPlayerController? _controller;

  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/video_info.json")
        .then((value) {
      setState(() {
        videos = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  void dispose() {
    _dispose = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.gradientFirst.withOpacity(.9),
                    AppColor.gradientSecond,
                  ],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(
                color: AppColor.gradientSecond,
              ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 50, left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: AppColor.secondPageTopIconColor,
                                size: 20,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              color: AppColor.secondPageTopIconColor,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Let\'s ',
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColor.secondPageTitleColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Learn English',
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColor.secondPageTitleColor,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor
                                        .secondPageContainerGradient1stColor,
                                    AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '68 min',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.secondPageIconColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 200,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor
                                        .secondPageContainerGradient1stColor,
                                    AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Resistent band, kettebell',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColor.secondPageIconColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                : SizedBox(
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          padding: const EdgeInsets.only(
                              top: 25, left: 30, right: 30),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: AppColor.secondPageTopIconColor,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: AppColor.secondPageTopIconColor,
                              ),
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Lesson 1 : Learning English',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.circuitsColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: AppColor.loopColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "3 sets",
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColor.setsColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: _listVideoView(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60);
    final secs = convertTwo(remained % 60);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: const RoundedRectSliderTrackShape(),
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 28),
            tickMarkShape: const RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          child: Slider(
            value: max(
              0,
              min(_progress * 100, 100),
            ),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value) {
              setState(() {
                _progress = value * .01;
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value.duration;
              if (duration != null) {
                var newValue = max(0, min(value, 99)) * .01;
                var milllis = (duration.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: milllis));
                _controller?.play();
              }
            },
          ),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.only(bottom: 5),
          width: MediaQuery.of(context).size.width,
          color: AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1);
                  }
                  setState(() {});
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 4,
                          color: Color.fromARGB(50, 0, 0, 0),
                        )
                      ],
                    ),
                    child: noMute
                        ? const Icon(
                            Icons.volume_up,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.volume_off,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  final index = _isPlayingIndex - 1;
                  if (index >= 0 && videos.length >= 0) {
                    _initializeVideo(index);
                  } else {
                    Get.snackbar(
                      'Video List',
                      '',
                      snackPosition: SnackPosition.BOTTOM,
                      icon: const Icon(
                        Icons.face,
                        color: Colors.white,
                        size: 30,
                      ),
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: const Text(
                        'No videos ahead!',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    );
                  }
                },
                icon: const Icon(
                  Icons.fast_rewind,
                  // size: 36,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () async {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller?.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                icon: _isPlaying
                    ? const Icon(
                        Icons.pause,
                        // size: 36,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        // size: 36,
                        color: Colors.white,
                      ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if (index <= videos.length - 1) {
                    _initializeVideo(index);
                  } else {
                    Get.snackbar(
                      'Video List',
                      '',
                      snackPosition: SnackPosition.BOTTOM,
                      icon: const Icon(
                        Icons.face,
                        color: Colors.white,
                        size: 30,
                      ),
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: const Text(
                        'You have finished watching all the videos. Congratulations!',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    );
                  }
                },
                icon: const Icon(
                  Icons.fast_forward,
                  // size: 36,
                  color: Colors.white,
                ),
              ),
              Text(
                "$mins: $secs",
                style: const TextStyle(color: Colors.white, shadows: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 4,
                    color: Color.fromARGB(10, 0, 0, 0),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 14 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 14 / 9,
        child: Center(
          child: Text(
            'Preparing...',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white60,
            ),
          ),
        ),
      );
    }
  }

  var _onUpdateControllerTime;

  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  void _onControllerUpdate() async {
    if (_dispose) {
      return;
    }

    _onUpdateControllerTime = 0;

    final now = DateTime.now().millisecondsSinceEpoch;

    if (_onUpdateControllerTime > now) {
      return;
    }

    _onUpdateControllerTime = now + 500;

    final controller = _controller;
    if (controller == null) {
      return;
    }
    if (!controller.value.isInitialized) {
      return;
    }

    if (_duration == null) {
      _duration = _controller?.value.duration;
    }

    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;
    if (playing) {
      if (_dispose) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _initializeVideo(int index) {
    final controller = VideoPlayerController.networkUrl(
      Uri.parse(
        videos[index]['videoUrl'],
      ),
    );
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _listVideoView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _initializeVideo(index);
            setState(() {
              if (_playArea == false) {
                _playArea = true;
              }
            });
          },
          child: _buildCard(index),
        );
      },
    );
  }

  _buildCard(int index) {
    return SizedBox(
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          videos[index]['thumbnail'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Icon(
                      Icons.play_circle,
                      size: 35,
                      color: AppColor.secondPageIconColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      videos[index]['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      videos[index]['time'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondPageContainerGradient1stColor
                      .withOpacity(.5),
                ),
                child: const Center(
                  child: Text(
                    '15s rest',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: const Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            color: Colors.white,
                          )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
