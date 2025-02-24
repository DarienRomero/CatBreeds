import 'dart:async';

import 'package:cat_breeds/core/themes.dart';
import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breed_detail/cat_breed_detail_bloc.dart';
import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breeds_list/cat_breeds_list_bloc.dart';
import 'package:cat_breeds/features/common/presentation/pages/router_page.dart';
import 'package:cat_breeds/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    await initializeServiceLocator();
    
    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://60c7ab8ba4f24a8aa4106e15ebbcaf35@o1297318.ingest.sentry.io/4505564165767168';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
      },
    );

    runApp(const MyApp());
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator.get<CatBreedsListBloc>()),
        BlocProvider(create: (_) => serviceLocator.get<CatBreedDetailBloc>()),
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