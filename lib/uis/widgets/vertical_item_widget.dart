import 'package:flutter/material.dart';

import '../../database/data/models/data.dart';

@immutable
// ignore: must_be_immutable
class VerticalItemWidget extends StatelessWidget {
  VerticalItemWidget({key, required data, required deleteAction})
      : super(key: key) {
    _data = data;
    _deleteAction = deleteAction;
  }

  late final Data _data;
  late final VoidCallback _deleteAction;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: <Widget>[
              Text(_data.value),
              const Spacer(),
              SizedBox(
                width: 16,
                height: 16,
                child: FloatingActionButton(
                  onPressed: _deleteAction,
                  child: const Icon(
                    Icons.delete,
                    size: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
