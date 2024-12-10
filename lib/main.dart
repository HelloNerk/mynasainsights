import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynasainsights/shared/presentation/pages/home_page.dart';

import 'features/apod/data/remote/apod_service.dart';
import 'features/apod/presentation/blocs/apod_bloc.dart';
import 'features/favorites/presentation/blocs/favorite_bloc.dart';
import 'features/favorites/presentation/blocs/favorite_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoriteBloc()..add(LoadFavorites())),
        BlocProvider(create: (context) => ApodBloc(ApodService())),
      ],
      child: MaterialApp(
        title: 'Apod App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}