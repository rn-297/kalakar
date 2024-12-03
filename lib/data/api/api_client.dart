import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:kalakar/data/models/file_web_model.dart';

import 'package:kalakar/utils/kalakar_constants.dart';

import '../models/file_data_model.dart';

abstract class ApiClient extends GetxService {
  static const int timeoutInSeconds = 60;
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
      return Response(statusCode: 1, statusText: ex.toString());
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
      return Response(statusCode: 1, statusText: ex.toString());
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
      return Response(statusCode: 1, statusText: ex.toString());
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
      return Response(statusCode: 1, statusText: ex.toString());
    }
  }


  static deleteDataToken(String uri, dynamic body, String accessToken) async {
    try {
      print(KalakarConstants.baseURL + uri);
      print(body);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.isEmpty) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.noInternetMessage);
      }
      String jsonBody = json.encode(body);
      Map<String, String> headers = {
        "Accept": "*/*",
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      };

      // Using http.Request to manually create a DELETE request with a body
      var request =Http.Request(
        'DELETE',
        Uri.parse(KalakarConstants.baseURL + uri),
      );
      request.headers.addAll(headers);
      request.body = jsonBody;  // Adding the JSON encoded body

      // Sending the request and awaiting the streamed response
      var streamedResponse = await request.send();
      var _response = await Http.Response.fromStream(streamedResponse);

      print(_response.request);
      print(_response.headers);
      print(_response.body);

      return _response;
    } catch (ex) {
      print(ex);
      return Response(statusCode: 1, statusText: ex.toString());
    }
  }

  static postDataToken1(String uri, dynamic body, String accessToken) async {
    try {
      print(KalakarConstants.baseURL + uri);
      print(body);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.isEmpty) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.noInternetMessage);
      }
      Map<String, String> headers = {
        "Accept": "*/*",
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
      return Response(statusCode: 1, statusText: ex.toString());
    }
  }

  static postFormDataToken(String uri, Map<String, String>? fields,
      Map<String, File?>? files, String accessToken) async
  {
    print(fields);
    try {
      print(KalakarConstants.baseURL + uri);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.noInternetMessage);
      }

      var request = Http.MultipartRequest(
          'POST', Uri.parse(KalakarConstants.baseURL + uri));
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
          if (file != null) {
            if (file.existsSync()) {
              var multipartFile = /*file.path.split("").last.contains("pdf")
                                        ? await Http.MultipartFile.fromPath(key, file.path,
                                            filename: file.path.split("/").last,
                                            contentType: mime.MediaType("document", "pdf"))
                                        :*/
                              await Http.MultipartFile.fromPath(key, file.path);
              request.files.add(multipartFile);
            } else {
              request.fields[key] = "";
            }
          } else {
            request.fields[key] = "";
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
      return Response(statusCode: 1, statusText: ex.toString());
    }
  }


  static postFormDataTokenWeb(String uri, Map<String, String>? fields,
      Map<String, FileDataWeb?>? files, String accessToken) async
  {
    print(fields);
    try {
      print(KalakarConstants.baseURL + uri);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.noInternetMessage);
      }

      var request = Http.MultipartRequest(
          'POST', Uri.parse(KalakarConstants.baseURL + uri));
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
          try {
            print(key);
            // print(file);
            if (file != null) {
                          var multipartFile = /*file.path.split("").last.contains("pdf")
                                                    ? await Http.MultipartFile.fromPath(key, file.path,
                                                        filename: file.path.split("/").last,
                                                        contentType: mime.MediaType("document", "pdf"))
                                                    :*/
                                          await Http.MultipartFile.fromBytes(key, file.imageData!,filename: file.name);
                          request.files.add(multipartFile);
print("done 12");
print("${file.name}");
                      } else {
                        request.fields[key] = "";
                      }
          } catch (e) {
            print(e);
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
      return Response(statusCode: 1, statusText: ex.toString());
    }
  }

  static postFormDataToken1(
      String uri,
      Map<String, String>? fields,
      Map<String, File>? files,
      Map<String, List<FileData>>? files1,
      String accessToken) async
  {
    try {
      print(KalakarConstants.baseURL + uri);
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Response(
            statusCode: 1, statusText: KalakarConstants.noInternetMessage);
      }

      var request = Http.MultipartRequest(
          'POST', Uri.parse(KalakarConstants.baseURL + uri));
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
          if (file.existsSync()) {
            var multipartFile = /*file.path.split("").last.contains("pdf")
              ? await Http.MultipartFile.fromPath(key, file.path,
                  filename: file.path.split("/").last,
                  contentType: mime.MediaType("document", "pdf"))
              :*/
            await Http.MultipartFile.fromPath(key, file.path,
                filename: file.path
                    .split("/")
                    .last);
            request.files.add(multipartFile);
          }else{
            request.fields[key] = "";
          }
        });
      }
      // Add files
      if (files1 != null) {
        files1.forEach((key, file) async {
          /*file.path.split("").last.contains("pdf")
              ? await Http.MultipartFile.fromPath(key, file.path,
                  filename: file.path.split("/").last,
                  contentType: mime.MediaType("document", "pdf"))
              :*/
            file.forEach((file1) async {
                        if (File(file1.path).existsSync()) {
                          var multipartFile = await Http.MultipartFile.fromPath(
                                                      key, file1.path,
                                                      filename: file1.path.split("/").last);
                          request.files.add(multipartFile);
                        } else {
                          request.fields[key] = "";
                        }
                      });

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
      return Response(statusCode: 1, statusText: ex.toString());
    }
  }
}
