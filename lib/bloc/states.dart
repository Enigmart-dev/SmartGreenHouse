import 'package:equatable/equatable.dart';
import 'package:greenhouse/domain/values_model.dart';

class GreenHouseStates extends Equatable{

  const GreenHouseStates();

  @override
  List<Object> get props => [];
}

class Completed extends GreenHouseStates {
  final GreenHouseMeasurement greenhouse;
  Completed({this.greenhouse});

  @override
  List<Object> get props => [greenhouse];
}

class Failed extends GreenHouseStates {
  final String error;
  Failed({this.error});
}

class Incomplete extends GreenHouseStates {}