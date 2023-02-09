import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Task1View extends ConsumerWidget {
  const Task1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.tonal(
              child: const Text('Task 1'),
              onPressed: () async {
                final file = await rootBundle.loadString('data/json/csc.json');
                final data = jsonDecode(file) as List;
                final query = data
                    .where((e) => (e['states'] as List).length > 10)
                    .toList();
                print(query.length);
                final formatted = jsonEncode(query);
                final dir = await getApplicationDocumentsDirectory();
                final newFile = File(join(dir.path, 'new.json'))
                  ..writeAsStringSync(formatted);
                print(newFile.path);
                await newFile.delete();
                print(newFile.existsSync());
              },
            ),
          ],
        ),
      ),
    );
  }
}
