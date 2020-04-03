/*
  It must contain methods for retrieving and modifying list of greenhouses from the repository object
  and other data from the network/database and do some business logic with it.
  It will be used by the bloc to transfer/get data to/from the UI
*/

import 'package:greenhouse/data_source/repository.dart';
import 'package:greenhouse/domain/values_model.dart';

class Domain {
  Future<GreenHouseMeasurement> greenhouse;
  Repository repo = Repository();

  Future<GreenHouseMeasurement> getGreenHouse() {
    print("getGreenHouse() executed");
    _getGHFromAPI();
    return greenhouse;
  }

  void _getGHFromAPI() {
    this.greenhouse = repo.fetchMeasurements().catchError((error, stacktrace) {
      print("Error from _getGHFromAPI(): $error");
    });
  }
}