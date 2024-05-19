import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:weather_application/feature_current_weather/models/weather_info.dart';

class DataToFile {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return await File('$path/data.txt').create();
  }

  Future<File> writeData(List<WeatherInfo> list) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(list.toString());
  }

  Future readData() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '0';
    }
  }

  Future deleteFile() async {
    final file = await _localFile;
    await file.delete();
  }

  Future<bool> fileExists() async {
    final path = await _localPath;
    return await File('$path/data.txt').exists();
  }
}
