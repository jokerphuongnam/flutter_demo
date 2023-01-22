import 'package:flutter/material.dart';

import '../../database/data/models/data.dart';
import 'vertical_item_widget.dart';

class HomeListWidget extends StatelessWidget {
  HomeListWidget(
      {key,
      required data,
      required isLoadMore,
      required initElements,
      required showElement,
      required deleteElement})
      : super(key: key) {
    _data = data;
    _isLoadMore = isLoadMore;
    _initElements = initElements;
    _showElement = showElement;
    _deleteElement = deleteElement;
  }

  late final List<Data> _data;
  late final bool _isLoadMore;
  late final VoidCallback _initElements;
  late final Function(Data) _showElement;
  late final Function(Data) _deleteElement;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      child: RefreshIndicator(
          onRefresh: () async {
            _initElements();
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _data.length + (_isLoadMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < _data.length) {
                var item = _data[index];
                return GestureDetector(
                  onTap: () {
                    _showElement(item);
                  },
                  child: VerticalItemWidget(
                    data: item,
                    key: Key(item.key),
                    deleteAction: () {
                      _deleteElement(item);
                    },
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )),
    ));
  }
}
