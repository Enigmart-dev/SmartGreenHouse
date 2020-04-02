import 'package:bloc/bloc.dart';
import 'package:greenhouse/bloc/states.dart';
import 'package:greenhouse/domain/domain.dart';

enum GreenHouseEvents { load }

class AppBloc extends Bloc<GreenHouseEvents, GreenHouseStates> {

  Domain domain;

  AppBloc() {
    this.domain = Domain();
  }

  @override
  get initialState => Incomplete();

  @override
  Stream<GreenHouseStates> mapEventToState(event) async* {
    switch(event) {
      case GreenHouseEvents.load:
        yield Incomplete();
        try {
          yield Completed(
              greenhouse: domain.getGreenHouse()
          );
        } catch(_) {
          yield Failed();
        }
        break;
    }
  }

}