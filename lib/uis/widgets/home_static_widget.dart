import 'package:flutter/material.dart';

import '../../utils/size_util.dart';

class HomeStaticWidget {
  HomeStaticWidget._();

  static Widget homeLoadingWidget() {
    return Column(
      children: const <Widget>[CircularProgressIndicator()],
    );
  }

  static Widget homeErrorWidget(
      {required VoidCallback initElements, required String error}) {
    return _canRefreshWidget(
        initElements: initElements,
        child: Column(
          children: <Widget>[Text(error)],
        ));
  }

  static Widget _canRefreshWidget(
          {required VoidCallback initElements, required Widget child}) =>
      LayoutBuilder(
        builder: (context, constraints) => RefreshIndicator(
          onRefresh: () async {
            initElements();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: SizeUtil.availableHeight(context),
              child: child,
            ),
          ),
        ),
      );
}
