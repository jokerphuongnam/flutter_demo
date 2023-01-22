import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeListenerWidget extends StatelessWidget {
  const HomeListenerWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeAddState) {
            if (state.isLoading) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const SizedBox(
                        width: 16,
                        height: 16,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ));
            } else if (state.error != null) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error.toString())));
            } else {
              Navigator.pop(context);
            }
          }
        },
        child: Container(),
      );
}
