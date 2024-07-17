import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../data/models/csv_model_class.dart';

class StateCityPinCodeHelper {
  static Future<List<CSVData>> getCsvData() async {
    String data =
        await rootBundle.loadString('assets/master/state_city_pincode.csv');

    // Parse the CSV data
    List<List<dynamic>> csvList =
        CsvToListConverter(eol: "\n", fieldDelimiter: ",").convert(data);

    // Remove headers from data
    csvList.removeAt(
        0); // Assuming first row is headers (City, Pincode, StateName)

    // Convert data to list of CSVData objects
    List<CSVData> csvData = csvList.map((List<dynamic> row) {
      return CSVData.fromList(row);
    }).toList();
    return csvData;
  }

  static Future<List<String>> getFilteredState(List<CSVData> csvData) async {
    Set<String> stateSet = Set();
    csvData.forEach((row) {
      stateSet.add(row.stateName.toString());
    });

    // Convert set to list and sort (if needed)
    List<String> stateList = stateSet.toList();
    stateList.sort(); // Sort alphabetically if needed

    return stateList;
  }

  static Future<List<String>> getFilteredCities(
      List<CSVData> csvData, String selectedState) async {
    print("here $selectedState");
    Set<String> citySet = Set();
    print(csvData[0].stateName);
    print(selectedState);
    print(csvData[0].stateName == selectedState);
    csvData.forEach((data) {
      if (data.stateName == selectedState) {
        citySet.add(data.city);
      } // Add city to set if state matches selectedState
    });
    List<String> cityList = citySet.toList();
    cityList.sort(); // Sort alphabetically if needed

    return cityList;
  }

  static Future<List<String>> getFilteredPinCodes(
      List<CSVData> csvData, String selectedState, String selectedCity) async {
    Set<String> pinCodeSet = Set();
    print(selectedState);
    print(selectedCity);
    print(csvData[0].stateName);
    print(csvData[0].city);
    print(csvData[0].pincode);
    csvData.forEach((data) {
      if (data.stateName == selectedState && data.city == selectedCity) {
        pinCodeSet.add(data.pincode);
      } // Add city to set if state matches selectedState
    });
    List<String> pinCodeList = pinCodeSet.toList();
    pinCodeList.sort(); // Sort alphabetically if needed

    return pinCodeList;
  }
}
