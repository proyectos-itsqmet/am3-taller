import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final VideoPlayerController _controller;

  bool _controlsVisible = true;
  bool _isFullscreen = false;

  // double? _dragValue;

  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(
            Uri.parse(widget.videoUrl),

            httpHeaders: const {'ngrok-skip-browser-warning': 'true'},
          )
          ..initialize()
              .then((_) {
                if (!mounted) return;
                _controller.play();
                _startHideTimer();
              })
              .catchError((Object _) {});
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _controller.dispose();

    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying) {
        setState(() => _controlsVisible = false);
      }
    });
  }

  void _toggleControls() {
    setState(() => _controlsVisible = !_controlsVisible);
    if (_controlsVisible) _startHideTimer();
  }

  void _togglePlayPause() {
    _controller.value.isPlaying ? _controller.pause() : _controller.play();
    _startHideTimer();
  }

  /*
  void _seekBy(Duration offset) {
    final value = _controller.value;
    var target = value.position + offset;
    if (target < Duration.zero) target = Duration.zero;
    if (target > value.duration) target = value.duration;
    _controller.seekTo(target);
    _startHideTimer();
  }
  */

  void _enterFullscreen() {
    setState(() => _isFullscreen = true);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _startHideTimer();
  }

  void _exitFullscreen() {
    setState(() => _isFullscreen = false);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _startHideTimer();
  }

  void _toggleFullscreen() =>
      _isFullscreen ? _exitFullscreen() : _enterFullscreen();

  /*
  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    return h > 0 ? '${two(h)}:${two(m)}:${two(s)}' : '${two(m)}:${two(s)}';
  }
  */

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isFullscreen,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && _isFullscreen) _exitFullscreen();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ValueListenableBuilder<VideoPlayerValue>(
          valueListenable: _controller,
          builder: (context, value, _) {
            if (value.hasError) {
              return _buildError(value.errorDescription);
            }
            if (!value.isInitialized) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            return _buildPlayer(value);
          },
        ),
      ),
    );
  }

  Widget _buildError(String? message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.white70, size: 48),
            const SizedBox(height: 12),
            const Text(
              'No se pudo reproducir el video',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message ?? 'Error desconocido',
              style: const TextStyle(color: Colors.white54, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayer(VideoPlayerValue value) {
    return GestureDetector(
      onTap: _toggleControls,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),

          if (value.isBuffering)
            const CircularProgressIndicator(color: Colors.white),

          AnimatedOpacity(
            opacity: _controlsVisible ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            child: IgnorePointer(
              ignoring: !_controlsVisible,
              child: _buildControls(value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControls(VideoPlayerValue value) {
    return Container(
      color: Colors.black38,
      child: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            const Spacer(),
            _buildCenterButtons(value),
            const Spacer(),
            _buildBottomBar(value),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          if (_isFullscreen) {
            _exitFullscreen();
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  Widget _buildCenterButtons(VideoPlayerValue value) {
    final ended =
        value.duration > Duration.zero && value.position >= value.duration;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //! Atrasar 10 segundos
        /*
        IconButton(
          iconSize: 42,
          icon: const Icon(Icons.replay_10, color: Colors.white),
          onPressed: () => _seekBy(const Duration(seconds: -10)),
        ),
        const SizedBox(width: 24),
        */
        //! Play / Pausa / Reiniciar
        IconButton(
          iconSize: 64,
          icon: Icon(
            ended
                ? Icons.replay
                : (value.isPlaying ? Icons.pause : Icons.play_arrow),
            color: Colors.white,
          ),
          onPressed: () {
            if (ended) {
              _controller.seekTo(Duration.zero);
              _controller.play();
              _startHideTimer();
            } else {
              _togglePlayPause();
            }
          },
        ),
        //! Adelantar 10 segundos
        /*
        const SizedBox(width: 24),
        IconButton(
          iconSize: 42,
          icon: const Icon(Icons.forward_10, color: Colors.white),
          onPressed: () => _seekBy(const Duration(seconds: 10)),
        ),
        */
      ],
    );
  }

  Widget _buildBottomBar(VideoPlayerValue value) {
    //! Barra de duración
    /*
    final maxMs = value.duration.inMilliseconds.toDouble();
    final safeMax = maxMs <= 0 ? 1.0 : maxMs;
    final currentMs = _dragValue ?? value.position.inMilliseconds.toDouble();
    final sliderValue = currentMs.clamp(0.0, safeMax).toDouble();
    */

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /*
          Text(
            _format(Duration(milliseconds: sliderValue.round())),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          Expanded(
            child: Slider(
              value: sliderValue,
              max: safeMax,
              activeColor: Colors.white,
              inactiveColor: Colors.white24,
              onChangeStart: (_) => _hideTimer?.cancel(),
              onChanged: (v) => setState(() => _dragValue = v),
              onChangeEnd: (v) {
                _controller.seekTo(Duration(milliseconds: v.round()));
                setState(() => _dragValue = null);
                _startHideTimer();
              },
            ),
          ),
          Text(
            _format(value.duration),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          */
          //! Pantalla completa / salir
          IconButton(
            icon: Icon(
              _isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
              color: Colors.white,
            ),
            onPressed: _toggleFullscreen,
          ),
        ],
      ),
    );
  }
}
