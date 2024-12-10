import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynasainsights/features/apod/presentation/blocs/apod_event.dart';
import 'package:mynasainsights/features/apod/presentation/pages/cover_page.dart';
import 'package:mynasainsights/features/apod/presentation/pages/show_apod_page.dart';
import 'package:mynasainsights/features/favorites/presentation/pages/favorite_list_page.dart';

import '../../../features/apod/presentation/blocs/apod_bloc.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final _pages = const [CoverPage(),ShowApodPage(),FavoriteListPage()];

  @override
  void initState() {
    super.initState();
    context.read<ApodBloc>().add(LoadApods());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
