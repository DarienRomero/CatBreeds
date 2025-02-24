import 'dart:async';

import 'package:cat_breeds/core/themes.dart';
import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breeds_bloc.dart';
import 'package:cat_breeds/features/common/presentation/pages/router_page.dart';
import 'package:cat_breeds/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  await initializeServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator.get<CatBreedsBloc>()),
      ],
      child: MaterialApp(
        title: 'DeportesApp',
        debugShowCheckedModeBanner: false,
        theme: Themes.lightMode,
        home: const RouterPage()
      ),
    );
  }
}