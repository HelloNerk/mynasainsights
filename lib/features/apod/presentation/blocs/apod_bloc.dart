import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynasainsights/features/apod/presentation/blocs/apod_event.dart';

import '../../../../core/resource.dart';
import '../../data/remote/apod_service.dart';
import '../../domain/apod.dart';
import 'apod_state.dart';

class ApodBloc extends Bloc<ApodEvent, ApodState> {
  final ApodService catService;

  ApodBloc(this.catService) : super(ApodInitial()) {
    on<LoadApods>((event, emit) async {
      emit(ApodLoading());
      try {
        final result = await catService.getApods();
        if (result is Success<List<Apod>>) {
          emit(ApodLoaded(result.data!));
        } else {
          emit(ApodError('Failed to load cats'));
        }
      } catch (e) {
        emit(ApodError(e.toString()));
      }
    });
  }

}