import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:kalakar/utils/kalakar_constants.dart';

abstract class ApiClient extends GetxService {
  static const int timeoutInSeconds = 30;
  static var client = Http.Client();

  static Future<Response> getData(String uri) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.isEmpty) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.NO_INTERNET_MESSAGE);
      }
      Http.Response _response = await client
          .get(Uri.parse(KalakarConstants.BASE_URL + uri))
          .timeout(Duration(seconds: timeoutInSeconds));
      Response response = Response(
        body: _response.body,
        statusCode: _response.statusCode,
      );
      return response;
    } catch (ex) {
      print(ex);
      return Response(
          statusCode: 1, statusText: KalakarConstants.NO_INTERNET_MESSAGE);
    }
  }

  static Future<dynamic> postData(String uri, dynamic body) async {
    try {
      // print(KalakarConstants.BASE_URL + uri);
      // print(body);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.isEmpty) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.NO_INTERNET_MESSAGE);
      }
      var _response = await client
          .post(
            Uri.parse(KalakarConstants.BASE_URL + uri),
            body: body,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      // print(_response.);

      return _response;
    } catch (ex) {
      print(ex);
      return Response(
          statusCode: 1, statusText: KalakarConstants.NO_INTERNET_MESSAGE);
    }
  }

  static Future<dynamic> postListData(String uri, dynamic body) async {
    try {
      print(KalakarConstants.BASE_URL + uri);
      print(body);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.isEmpty) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.NO_INTERNET_MESSAGE);
      }
      var _response = await client.post(
          Uri.parse(KalakarConstants.BASE_URL + uri),
          body: body,
          headers: {
            "Accept": "application/json",
            "content-type": "application/x-www-form-urlencoded"
          }).timeout(Duration(seconds: timeoutInSeconds));
      print(_response);

      return _response;
    } catch (ex) {
      print(ex);
      return Response(
          statusCode: 1, statusText: KalakarConstants.NO_INTERNET_MESSAGE);
    }
  }

  static postDataToken(String uri, dynamic body, String accessToken) async {
    try {
      print(KalakarConstants.BASE_URL + uri);
      print(body);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.isEmpty) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.NO_INTERNET_MESSAGE);
      }
      Map<String, String> headers = {
        "Accept": "application/json",
        "content-type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      };

      var _response = await client
          .post(
            Uri.parse(KalakarConstants.BASE_URL + uri),
            headers: headers,
            body: body,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      print(_response.request);
      print(_response.headers);

      return _response;
    } catch (ex) {
      print(ex);
      return Response(
          statusCode: 1, statusText: KalakarConstants.NO_INTERNET_MESSAGE);
    }
  }
}
