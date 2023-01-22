import 'dart:math';

import 'package:bloc/bloc.dart';

import '../../database/data/models/data.dart';
import 'home_event.dart';
import 'home_state.dart';

List<Data> _data = [];

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeNotInitState()) {
    on<HomeEvent>((event, emit) async {
      var stream = mapEventToState(event);
      await for (final value in stream) {
        emit(value);
      }
    });
  }

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeInitDataEvent) {
      var homeInitDataState = HomeSuccessState(isLoading: true, data: []);
      yield homeInitDataState;
      _data = [];
      for (int i = 0; i < 20; i++) {
        await Future.delayed(const Duration(milliseconds: 100));
        if (Random().nextInt(30) == 12) {
          yield HomeErrorState(error: UnimplementedError());
          return;
        }
        _data.add(Data(
            key: "$i", numericKey: i, value: "value $i", isBookMark: false));
      }
      yield HomeSuccessState(isLoading: false, data: _data);
      return;
    } else if (event is HomeAddEvent) {
      yield HomeAddState(isLoading: true, data: _data);
      if (Random().nextInt(30) == 12) {
        yield HomeAddState(
            isLoading: false, data: [], error: UnimplementedError());
        return;
      }
      await Future.delayed(const Duration(milliseconds: 1000));
      if (Random().nextInt(30) == 12) {
        yield HomeAddState(
            isLoading: false, data: _data, error: UnimplementedError());
        return;
      }
      int length = _data.length;
      _data.add(Data(
          key: "$length",
          numericKey: length,
          value: "value $length",
          isBookMark: false));
      yield HomeAddState(isLoading: false, data: _data);
      return;
    } else if (event is HomeLoadMoreEvent) {
      yield HomeLoadMoreState(isLoading: false, data: []);
      return;
    } else if (event is HomeDeleteEvent) {
      yield HomeDeleteState(isLoading: false, data: []);
      return;
    }
  }
}
