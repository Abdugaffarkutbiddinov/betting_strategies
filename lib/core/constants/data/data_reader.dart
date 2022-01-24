import 'Dart:io';

String fixture(String name) => File('lib/core/constants/data/$name').readAsStringSync();
