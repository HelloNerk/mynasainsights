import 'dart:convert';
import 'dart:io';

import 'package:mynasainsights/core/app_constants.dart';
import 'package:mynasainsights/core/resource.dart';
import 'package:mynasainsights/features/apod/data/remote/apod_dto.dart';
import 'package:mynasainsights/features/apod/domain/apod.dart';
import 'package:http/http.dart' as http;

class ApodService{
  Future<Resource<List<Apod>>>getApods() async{
    String url = '${AppConstants.baseUrl}${AppConstants.endpoint}${AppConstants.apiKey}${AppConstants.dateRange}';
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> json = jsonDecode(response.body);
        List<Apod> apods = json.map((e) => ApodDto.fromJson(e).toApod()).toList();
        print('Datos obtenidos del API: $apods'); // Registro de depuración
        return Success(apods);
      } else {
        print('Error en la respuesta del API: ${response.statusCode} ${response.body}'); // Registro de depuración
        return Error('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Excepción al obtener datos: $error'); // Registro de depuración
      return Error(error.toString());
    }
  }
}