import 'dart:convert';
import 'package:greenhouse/data_source/network.dart';
import 'package:greenhouse/domain/values_model.dart';

class Repository {
  NetworkAPI _networkAPI;

  Future<GreenHouseMeasurement> fetchMeasurements() async {
    final response = await _networkAPI.fetchJSON();

    if(response.statusCode == 200) {
      return GreenHouseMeasurement.fromJson(
        json.decode(response.body)
      );
    } else {
      throw Exception("Failed to fetch measurements.");
    }
  }
}
