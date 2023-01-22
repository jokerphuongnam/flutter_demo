import 'package:rxdart/rxdart.dart';

import '../data/models/data.dart';

mixin MDataRepository {
  Stream<List<Data>> getData();
}

// class DataRepository with MDataRepository {
//
// }