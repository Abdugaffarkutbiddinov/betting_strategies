import 'Dart:io';
import 'package:path_provider/path_provider.dart';
// Future<String> get _localPath async {
//   final directory = await getApplicationDocumentsDirectory();
//
//   return directory.path;
// }
//
// Future<String> fixture(String name) async {
//   final file = await _localPath;
//   return File('$file/betting_strategy.json').readAsStringSync();
// }


String fixture(String name) => File('lib/constants/$name').readAsStringSync();
