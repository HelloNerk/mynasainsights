import 'package:mynasainsights/features/apod/domain/apod.dart';

abstract class ApodState {}

class ApodInitial extends ApodState {}

class ApodLoading extends ApodState {}

class ApodLoaded extends ApodState {
  final List<Apod> apods;

  ApodLoaded(this.apods);
}

class ApodError extends ApodState {
  final String message;

  ApodError(this.message);
}