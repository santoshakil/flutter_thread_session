import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../task/model/task.m.dart';

final homeTileProvider = StateProvider.autoDispose<Tasks?>((_) => null);
