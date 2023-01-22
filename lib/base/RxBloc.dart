import 'package:bloc/bloc.dart';

abstract class RxBloc<Event, State> extends Bloc<Event, State> {
  RxBloc({required initialState}): super(initialState) {
    on((event, emit) => {

    });
  }

  
}
