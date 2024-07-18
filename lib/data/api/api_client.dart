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
            statusCode: 1, statusText: KalakarConstants.noInternetMessage);
      }
      Http.Response _response = await client
          .get(Uri.parse(KalakarConstants.baseURL + uri))
          .timeout(Duration(seconds: timeoutInSeconds));
      Response response = Response(
        body: _response.body,
        statusCode: _response.statusCode,
      );
      return response;
    } catch (ex) {
      print(ex);
      return Response(
          statusCode: 1, statusText: KalakarConstants.noInternetMessage);
    }
  }

  static Future<dynamic> postData(String uri, dynamic body) async {
    try {
      print(KalakarConstants.baseURL + uri);
      print(body);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.isEmpty) {
        return const Response(
            statusCode: 1, statusText: KalakarConstants.noInternetMessage);
      }
      var response = await client.post(
          Uri.parse(KalakarConstants.baseURL + uri),
          body: body,
          headers: {

            "accept": "*/*",
            "Content-Type": "application/json"
          }).timeout(const Duration(seconds: timeoutInSeconds));
      // print(_response.);

      return response;
    } catch (ex) {
      print(ex);
      return const Response(
          statusCode: 1, statusText: KalakarConstants.noInternetMessage);
    }
  }

  static Future<dynamic> postListData(String uri, dynamic body) async {
    try {
      print(KalakarConstants.baseURL + uri);
      print(body);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.isEmpty) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.noInternetMessage);
      }
      var _response = await client.post(
          Uri.parse(KalakarConstants.baseURL + uri),
          body: body,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json; charset=utf-8"
          }).timeout(Duration(seconds: timeoutInSeconds));
      print(_response);

      return _response;
    } catch (ex) {
      print(ex);
      return Response(
          statusCode: 1, statusText: KalakarConstants.noInternetMessage);
    }
  }

  static postDataToken(String uri, dynamic body, String accessToken) async {
    try {
      print(KalakarConstants.baseURL + uri);
      print(body);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.isEmpty) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.noInternetMessage);
      }
      Map<String, String> headers = {
        "Accept": "application/json",
        "content-type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      };

      var _response = await client
          .post(
            Uri.parse(KalakarConstants.baseURL + uri),
            headers: headers,
            body: body,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      print(_response.request);
      print(_response.headers);
      print(_response.body);

      return _response;
    } catch (ex) {
      print(ex);
      return Response(
          statusCode: 1, statusText: KalakarConstants.noInternetMessage);
    }
  }
  static postFormDataToken(String uri, Map<String, String>? fields,
      Map<String, File>? files, String accessToken) async {
    try {
      print(KalakarConstants.baseURL + uri);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.noInternetMessage);
      }

      var request = Http.MultipartRequest('POST', Uri.parse(KalakarConstants.baseURL + uri));
      request.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      });

      // Add fields
      if (fields != null) {
        fields.forEach((key, value) {
          request.fields[key] = value;
        });
      }

      // Add files
      if (files != null) {
        files.forEach((key, file) async {
          if(file.path.isNotEmpty){
            var stream = Http.ByteStream(file.openRead());
            var length = await file.length();
            var multipartFile = Http.MultipartFile('files', stream, length,
                filename: file.path.split("/").last);
            request.files.add(multipartFile);
          }
        });
      }

      var streamedResponse = await request.send();
      var response = await Http.Response.fromStream(streamedResponse);

      print(response.request);
      print(response.headers);
      print(response.body);

      return response;
    } catch (ex) {
      print(ex);
      return Response(
          statusCode: 1, statusText: KalakarConstants.noInternetMessage);
    }
    }

}
