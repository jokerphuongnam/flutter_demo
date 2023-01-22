import 'package:flutter/material.dart';

class SizeUtil {
  SizeUtil._();

  static double availableHeight(BuildContext context) =>
      MediaQuery.of(context).size.height -
      AppBar().preferredSize.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom -
      24;
}
