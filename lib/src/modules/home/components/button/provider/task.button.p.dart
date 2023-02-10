import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/home.m.dart';

final homeTileProvider = StateProvider.autoDispose<Threads?>((_) => null);
