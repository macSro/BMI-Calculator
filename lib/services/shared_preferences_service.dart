import 'dart:convert';

import 'package:lab1_part1/models/bmi_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';
import '../constants.dart';

class SharedPreferencesService {
  Future<List<BmiData>> loadResults() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? results = sharedPreferences.getStringList(resultsKey);
    if (results == null) {
      return List<BmiData>.empty(growable: true);
    } else {
      return results
          .map((result) => BmiData.fromJson(jsonDecode(result)))
          .toList();
    }
  }

  Future<bool> saveResults(List<BmiData> results) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setStringList(
      resultsKey,
      results.map((result) => jsonEncode(result)).toList(),
    );
  }

  Future<bool> loadUnit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? result = sharedPreferences.getString(unitKey);
    if (result == null) {
      return unitDefault == unitMetric;
    } else {
      return result == unitMetric;
    }
  }

  Future<bool> saveUnit(bool isMetric) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(
        unitKey, isMetric ? unitMetric : unitImperial);
  }
}
