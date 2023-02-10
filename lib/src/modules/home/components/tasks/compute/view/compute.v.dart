import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../db/isar.dart';
import '../../../../model/csc.m.dart';
import '../../../button/task.button.v.dart';
import '../../../task/model/task.m.dart';

class ComputeView extends ConsumerWidget {
  const ComputeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TaskButton(
          task: Tasks.compute,
          onTap: () async {
            final bytesData = await rootBundle.loadString('data/json/csc.json');
            final csc = cscFromJson(bytesData);
            final cscNew = csc
                .map((e) => e.copyWith(dataID: e.dataID ?? 250 + 1))
                .toList();
            final dir = await getApplicationDocumentsDirectory();
            final file = File(join(dir.path, 'csc.json'));
            file.writeAsStringSync(cscToJson(cscNew));
            file.deleteSync();
            print(cscNew.length);
            final start = DateTime.now().millisecondsSinceEpoch;
            db.writeTxnSync(() => db.cSCs.putAllSync(cscNew));
            final end = DateTime.now().millisecondsSinceEpoch;
            print('Time taken: ${end - start}');
            db.writeTxnSync(() => db.clearSync());
            final end2 = DateTime.now().millisecondsSinceEpoch;
            print('Time taken: ${end2 - end}');
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
