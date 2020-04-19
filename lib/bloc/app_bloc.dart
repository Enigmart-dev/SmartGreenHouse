import 'package:bloc/bloc.dart';
import 'package:greenhouse/bloc/states.dart';
import 'package:greenhouse/domain/domain.dart';

enum GreenHouseEvents { load, refresh }

class AppBloc extends Bloc<GreenHouseEvents, GreenHouseStates> {

  Domain domain;

  @override
  get initialState => Incomplete();

  @override
  Stream<GreenHouseStates> mapEventToState(event) async* {
    switch(event) {
      case GreenHouseEvents.load:
        yield Incomplete();
        await Future.delayed(const Duration(milliseconds: 200));
        try {
          if(domain == null)
            domain = Domain();
          yield Completed(greenhouse: await domain.getGreenHouse());
        } catch(_) {
          yield Failed();
        }
        break;

      case GreenHouseEvents.refresh:
        try {
          await Future.delayed(const Duration(milliseconds: 800));
          yield Completed(
              greenhouse: await domain.getGreenHouse()
          );
        } catch(_) {
          yield state;
        }
    }
  }

}