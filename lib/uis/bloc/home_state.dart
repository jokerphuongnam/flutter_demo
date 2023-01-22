import '../../database/data/models/data.dart';

abstract class HomeState {
  bool isLoading = true;
  List<Data> data = [];

  HomeState();
}

class HomeNotInitState extends HomeState {}

class HomeSuccessState extends HomeState {
  @override
  List<Data> data = [];

  HomeSuccessState({required isLoading, required this.data}) {
    super.isLoading = isLoading;
  }
}

class HomeLoadMoreState extends HomeState {
  @override
  List<Data> data = [];

  HomeLoadMoreState({required isLoading, required this.data}) {
    super.isLoading = isLoading;
  }
}

class HomeAddState extends HomeState {
  @override
  List<Data> data = [];
  Error? error;

  HomeAddState({required isLoading, required this.data, this.error}) {
    super.isLoading = isLoading;
  }
}

class HomeDeleteState extends HomeState {
  @override
  List<Data> data = [];

  HomeDeleteState({required isLoading, required this.data}) {
    super.isLoading = isLoading;
  }
}

class HomeErrorState extends HomeState {
  final Error error;

  HomeErrorState({required this.error});
}
