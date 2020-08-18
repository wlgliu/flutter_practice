import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayChewie extends StatefulWidget {
  VideoPlayChewie({Key key}) : super(key: key);
  createState() => _VideoPlayChewie();
}

class _VideoPlayChewie extends State<VideoPlayChewie> {

  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;

  _initVideoPlay() {
    
    _videoPlayerController = VideoPlayerController.network('https://vt1.doubanio.com/202006231754/8d5ec992bf99ff1147ce40235893fe94/view/movie/M/302570449.mp4');

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
      autoInitialize: true,     // 初始化视频
      allowFullScreen: true,   // 是否全屏
      allowMuting: false,   // 是否静音
      showControls: true,   // 控件
      isLive: false,
    );

    _chewieController.addListener(() {
      if (_chewieController.videoPlayerController.value.hasError) {
        print('视频异常');
        print(_chewieController.videoPlayerController.value.errorDescription);
      }

      if (_chewieController.videoPlayerController.value.initialized) {
        print('初始化完成');
      }

      if (_chewieController.videoPlayerController.value.isBuffering) {
        print('正在缓冲');
      }
    });
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _initVideoPlay();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用chewie'),
      ),
      body: Container(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
