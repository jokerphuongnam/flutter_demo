import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../database/data/models/data.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
import 'widgets/home_list_widget.dart';
import 'widgets/home_listener_widget.dart';
import 'widgets/home_static_widget.dart';

class HomeScreen extends StatefulWidget {
  final String title = "Home Screen";

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late HomeBloc bloc = BlocProvider.of<HomeBloc>(context);

  HomeState get state => bloc.state;

  @override
  void initState() {
    super.initState();
    _initElements();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _stateBloc(context, state),
                  const HomeListenerWidget()
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: state.isLoading
                  ? Colors.grey
                  : Theme.of(context).primaryColor,
              onPressed: state.isLoading ? null : _addElement,
              tooltip: 'Add Element',
              child: const Icon(Icons.add),
            ),
          ));

  Widget _stateBloc(BuildContext context, state) {
    if (state is HomeNotInitState ||
        (state is HomeSuccessState && state.isLoading)) {
      return HomeStaticWidget.homeLoadingWidget();
    } else if (state is HomeErrorState) {
      return HomeStaticWidget.homeErrorWidget(
          initElements: _initElements, error: state.error.toString());
    } else {
      return HomeListWidget(
          data: state.data,
          isLoadMore: state is HomeLoadMoreState,
          initElements: _initElements,
          showElement: _showElement,
          deleteElement: _deleteElement);
    }
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  void _initElements() async {
    bloc.add(HomeInitDataEvent());
  }

  void _addElement() async {
    bloc.add(HomeAddEvent());
  }

  void _showElement(Data item) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(item.value)));
  }

  void _deleteElement(Data item) {
    bloc.add(HomeDeleteEvent());
  }
}
