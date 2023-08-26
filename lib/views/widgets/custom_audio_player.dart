import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import '../../controllers/cubits/audio_player_cubit.dart';
import '../../helpers/constants/app_dimensions.dart';
import '../../helpers/constants/app_sizes.dart';
import '../../helpers/utils/screen_dimensions.dart';

import '../../helpers/constants/app_icons.dart';

class CustomAudioPlayer extends StatefulWidget {
  final double height;
  final double width;
  final File file;

  const CustomAudioPlayer({
    super.key,
    required this.file,
    required this.height,
    required this.width,
  });

  @override
  State<CustomAudioPlayer> createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    initAudioPlayer();
    super.initState();
  }

  initAudioPlayer() async {
    audioPlayer.setFilePath(widget.file.path);
    await audioPlayer.play();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heightCurrent = ScreenDimension.getHeight(context);
    final widthCurrent = ScreenDimension.getWidth(context);
    return BlocBuilder<AudioPlayerCubit, bool>(builder: (context, state) {
      return ListView(
        padding: EdgeInsets.symmetric(
          vertical: heightCurrent * AppDimensions.kAppVerticalPadding,
        ),
        children: [
          Container(
            margin: EdgeInsets.all(
              widthCurrent * AppDimensions.kAudioPlayerBoxMargin,
            ),
            alignment: Alignment.center,
            height: heightCurrent * AppSizes.kAudioPlayerBoxHeight,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              borderRadius: BorderRadius.circular(
                AppSizes.kMediaWidgetBorderRadius,
              ),
            ),
            child: (state)
                ? Icon(
                    AppIcons.kPauseIcon,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: heightCurrent * AppSizes.kAudioPlayerBoxChildSize,
                  )
                : Icon(
                    AppIcons.kPlayIcon,
                    color: Theme.of(context).colorScheme.background,
                    size: heightCurrent * AppSizes.kAudioPlayerBoxChildSize,
                  ),
          ),
          StreamBuilder<Duration?>(
            stream: audioPlayer.durationStream,
            builder: (context, snapshot) {
              final duration = snapshot.data ?? Duration.zero;
              return StreamBuilder<Duration>(
                stream: audioPlayer.positionStream,
                builder: (context, snapshot) {
                  Duration position = snapshot.data ?? Duration.zero;
                  if (position > duration) {
                    position = duration;
                  }
                  return Column(
                    children: <Widget>[
                      Text(
                        '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}'
                        '/'
                        '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '15')}',
                        style: TextStyle(
                            fontSize: AppSizes.kDurationFontSize,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              state ? AppIcons.kPauseIcon : AppIcons.kPlayIcon,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            onPressed: () async {
                              if (state) {
                                context.read<AudioPlayerCubit>().playPausePlayer();
                                await audioPlayer.pause();
                              } else {
                                context.read<AudioPlayerCubit>().playPausePlayer();
                                await audioPlayer.play();
                              }
                            },
                          ),
                          SizedBox(
                            width: widthCurrent * AppSizes.kAudioPlayerDurationSpace,
                          ),
                          Slider(
                            activeColor: Theme.of(context).colorScheme.secondary,
                            inactiveColor: Theme.of(context).scaffoldBackgroundColor,
                            value: position.inSeconds.toDouble(),
                            min: 0,
                            thumbColor: Theme.of(context).colorScheme.primary,
                            max: duration.inSeconds.toDouble(),
                            onChanged: (double value) {
                              audioPlayer.seek(Duration(seconds: value.toInt()));
                            },
                          ),
                        ],
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      );
    });
  }
}
