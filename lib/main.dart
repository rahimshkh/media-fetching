import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controllers/blocs/media_blocs/pick_image_bloc/pick_image_bloc.dart';
import 'controllers/cubits/audio_player_cubit.dart';
import 'controllers/cubits/drawer_cubit.dart';
import 'helpers/themes/app_themes.dart';

import 'controllers/blocs/media_blocs/pick_audio_bloc/pick_audio_bloc.dart';
import 'controllers/blocs/media_blocs/pick_video_bloc/pick_video_bloc.dart';
import 'controllers/blocs/permission_bloc/permission_bloc.dart';
import 'helpers/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DrawerCubit()),
        BlocProvider(create: (context) => PickImageBloc()),
        BlocProvider(create: (context) => PermissionBloc()),
        BlocProvider(create: (context) => PickVideoBloc()),
        BlocProvider(create: (context) => PickAudioBloc()),
        BlocProvider(create: (context) => AudioPlayerCubit()),
      ],
      child: MaterialApp(
        theme: themeData,
        routes: appRoutes,
      ),
    );
  }
}
