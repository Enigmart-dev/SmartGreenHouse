import 'dart:convert';
import 'package:greenhouse/data_source/network.dart';
import 'package:greenhouse/domain/values_model.dart';

class Repository {
  static NetworkAPI _networkAPI = NetworkAPI();

  Future<GreenHouseMeasurement> fetchMeasurements() async {
    print("fetchMeasurement() executed");
    final response = await _networkAPI.fetchJSON();
    print(response.body);

    if(response.statusCode == 200) {
      print("fromJson()");
      return await GreenHouseMeasurement.fromJson(
        json.decode(response.body)
      );
    } else {
      throw Exception("Failed to fetch measurements.");
    }
  }
}
