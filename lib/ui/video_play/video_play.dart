import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  VideoPlay({Key key}) : super(key: key);

  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  bool _setPosition = true;
  bool _setReset = false;
  String _url = "https://vt1.doubanio.com/202006231754/8d5ec992bf99ff1147ce40235893fe94/view/movie/M/302570449.mp4";

  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(_url);
    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(false);    

    _controller.addListener((){

      
      // if (_controller.value.initialized) {
      //   print('初始化完成');
      // }

      // if (_controller.value.isPlaying) {
      //   print('正在播放');
      // }

      // if (_controller.value.isBuffering) {
      //   print('正在缓冲');
      // }

      // print('播放状态 ${_controller.value.isPlaying} ${'*' * 100}');
      
      // print('音量 ${_controller.value.volume}');

      print('视频进度 ${_controller.value.position}');

      // print('视频宽高 ${_controller.value.size}');

      print('视频总长度 ${_controller.value.duration}');

      // 视频播放完后复位
      if (_controller.value.position >= _controller.value.duration && !_setReset) {

        _controller.seekTo(Duration(hours: 0, minutes: 0, seconds: 0, milliseconds: 0, ));

        _controller.value.isPlaying ? _controller.play() : _controller.pause();

        setState(() {
          // ignore: unnecessary_statements
          _controller.value.isPlaying;
          
          _setReset = true;
        });
        

        print(_controller.value.isPlaying);
      }

      // _controller.position.then(((onValue){
      //   print('${'*'*100} $onValue');
      // }));

      if (_controller.value.position == Duration(hours: 0, minutes: 0, seconds: 0)) {
        print('开始位置');
      }


    });


    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('视频播放'),),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.connectionState == ConnectionState.done) {
            
            if (_setPosition) {
              _controller.seekTo(Duration(hours: 0, minutes: 2, seconds: 18, milliseconds: 0, ));
            }
            _setPosition = false;

            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller,),

                  playPauseOverlay(_controller,),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }


  Widget playPauseOverlay(controller) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  height: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.play_arrow, size: 38, color: Colors.blue,)
                    ],
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              controller.value.isPlaying ? controller.pause() : controller.play();
            });
          },
        ),
      ],
    );
  }


}


