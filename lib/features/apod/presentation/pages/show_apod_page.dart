import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/apod_bloc.dart';
import '../blocs/apod_state.dart';
import '../widgets/apod_list.dart';

class ShowApodPage extends StatelessWidget {
  const ShowApodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApodBloc, ApodState>(
      builder: (context, state) {
        if (state is ApodLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ApodLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(child: ApodList(items: state.apods)),
              ],
            ),
          );
        } else if (state is ApodError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Press the button to load cats'));
        }
      },
    );
  }
}