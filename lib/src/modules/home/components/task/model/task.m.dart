import 'package:flutter/material.dart';

import '../../tasks/compute/view/compute.v.dart';
import '../../tasks/data/view/data.v.dart';
import '../../tasks/isolate/view/isolate.v.dart';
import '../../tasks/other/view/other.v.dart';
import '../../tasks/persistant/view/persistant.v.dart';
import '../../tasks/synchronization/view/synchronization.v.dart';

enum Tasks {
  compute(
    'Compute',
    'compute is used to perform short-lived heavy task in separate isolate',
    ComputeView(),
  ),
  isolate(
    'Isolate',
    'Isolate.spawn is used to perform long-lived heavy task in separate isolate',
    IsolateView(),
  ),
  synchronization(
    'Synchronization',
    'This is used to thread safe data access',
    SynchronizationView(),
  ),
  persistence(
    'Persistence Thread',
    'This is used to perform heavy task in separate isolate, but it always listen to the main isolate for some function call',
    PersistantView(),
  ),
  data(
    'Two way Data Passing',
    'This is used to pass data from main isolate to separate isolate and vice versa',
    DataView(),
  ),
  other(
    'Other',
    'Other heavy task example',
    OtherView(),
  );

  const Tasks(this.title, this.description, this.view);

  final String title;
  final String description;
  final Widget view;
}
