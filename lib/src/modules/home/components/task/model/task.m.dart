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

// The topics covered in the session of Basic to Advance threading in Flutter/Dart are as follows:

// Compute: Compute is used to perform short-lived heavy tasks in a separate isolate. It uses the "compute" function to perform these tasks.

// Isolate: Isolate.spawn is used to perform long-lived heavy tasks in a separate isolate. This allows for the creation of a new thread that is separate from the main thread and can perform tasks without affecting the main thread.

// Synchronization: Synchronization is used to ensure thread-safe data access. This is important when multiple threads need to access and modify the same data, as it ensures that data integrity is maintained.

// Persistence Thread: The persistence thread is used to perform heavy tasks in a separate isolate, but it always listens to the main isolate for some function calls. This is useful for performing tasks that require a long duration to complete, while still allowing the main thread to perform other tasks in the meantime.

// Two-way Data Passing: Two-way data passing is used to pass data from the main isolate to a separate isolate, and vice versa. This allows for communication between the main thread and the separate thread, making it possible to coordinate tasks and share data between the two.

// Other: The "Other" topic covers other heavy task examples. This can include any additional examples of tasks that may need to be performed in a separate isolate to improve performance or ensure data integrity.
