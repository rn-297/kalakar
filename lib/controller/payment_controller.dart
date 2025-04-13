import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:kalakar/data/models/payment/payment_details_model.dart';
import 'package:kalakar/data/models/payment/payment_initiate.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/api/api_client.dart';
import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';
import '../data/models/payment/payment_android_details_model.dart';
import '../utils/kalakar_constants.dart';

class PaymentController extends GetxController {
  bool isPaymentDetailsLoading = true;
  bool isArtist = false;
  ProfileStatusData profileStatusData = ProfileStatusData();
  List<ReturnPaymentIntegrationAPIResponseList> paymentDetailsList = [];
  bool enableLogs = false;
  bool isWebLoading = false;
  String environmentValue = 'UAT'; //"PRODUCTION"
  String merchantId = "PGTESTPAYUAT";
  String flowId = "com.sajartech.kalakaarapp";
  String appSchema = "Kalakaar Subscription";
  String webUrl = "www.google.com";
  String iframe = '''
    <!DOCTYPE html>
    <html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <style>
        body, html {
          margin: 0;
          padding: 0;
          height: 100%;
          width: 100%;
          overflow: hidden;
          display: flex;
          justify-content: center;
          align-items: center;
        }
        iframe {
          width: 100vw;
          height: 100vh;
          border: none;
        }
      </style>
    </head>
    <body>
      <iframe src="https://www.phonepe.com/" allow="payment"></iframe>
    </body>
    </html>
''';

  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllowFullscreen: true);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  initializeWeb(String url) {
    webUrl = url;
    iframe = '''
    <!DOCTYPE html>
    <html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <style>
        body, html {
          margin: 0;
          padding: 0;
          height: 100%;
          width: 100%;
          overflow: hidden;
          display: flex;
          justify-content: center;
          align-items: center;
        }
        iframe {
          width: 100vw;
          height: 100vh;
          border: none;
        }
      </style>
    </head>
    <body>
      <iframe src="$webUrl" allow="payment"></iframe>
    </body>
    </html>
''';
    update();
    Get.toNamed(RouteHelper.webViewPage);
  }

  setArtist() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      isArtist = loginTable.accountType == KalakarConstants.artist;
      update();
    }
  }

  Future<void> getPaymentDetails() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      isPaymentDetailsLoading = true;

      update();
      final body = {
        "fK_AccountID": loginTable.accountID ?? "", //loginTable.accountID
        "redirectURL": "",
        "callbackURL": ""
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getPaymentDetails,
          jsonEncode(body),
          loginTable.token ?? "");
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        PaymentDetailsModel paymentDetailsModel =
            PaymentDetailsModel.fromJson(jsonDecode(response.body));
        profileStatusData = paymentDetailsModel.pProfileStatusData!;
        paymentDetailsList =
            paymentDetailsModel.returnPaymentIntegrationAPIResponseList!;
        update();
      }
      isPaymentDetailsLoading = false;
    }
  }

  Future<void> getPaymentAndroidDetails() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      isPaymentDetailsLoading = true;

      update();
      final body = {
        "fK_AccountID": loginTable.accountID ?? "", //loginTable.accountID
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getPaymentAndroidDetails,
          jsonEncode(body),
          loginTable.token ?? "");
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        PaymentAndroidDetailsModel paymentDetailsModel =
            PaymentAndroidDetailsModel.fromJson(jsonDecode(response.body));
        PhonePePaymentSdk.startTransaction(
                paymentDetailsModel.base64Body!,
                paymentDetailsModel.callBackURL!,
                paymentDetailsModel.checksum!,
                "com.sajartech.kalakaarapp")
            .then((response) => {
                  if (response != null)
                    {
                      print(response['status'].toString()),
                      print(response['error'].toString()),
                    }
                  else
                    {print("Flow Incomplete")}
                })
            .catchError((error) {
          print(error);
          return <dynamic>{};
        });
      }
      isPaymentDetailsLoading = false;
    }
  }

  Future<void> initiatePayment() async {
    if (kIsWeb) {
      LoginTable? loginTable = await HiveService.getLoginData();
      if (loginTable != null) {
        final body = {
          "fK_AccountID": loginTable.accountID ?? "",
          "redirectURL": "",
          "callbackURL": "",
        };
        print("here");

        var response = await ApiClient.postDataToken(
            KalakarConstants.initiatePayment,
            jsonEncode(body),
            loginTable.token ?? "");
        print(response.statusCode);
        print(response);

        if (response.statusCode == 200) {
          PayInitiateModel payInitiateModel =
              PayInitiateModel.fromJson(jsonDecode(response.body));

          if (payInitiateModel.success!) {
            initializeWeb(
                payInitiateModel.data!.instrumentResponse!.redirectInfo!.url!);
          }
        }
      }
    } else {
      initPhonePeSdk();
    }
  }

  void initPhonePeSdk() {
    print("here");
    PhonePePaymentSdk.init(environmentValue, merchantId, flowId, enableLogs)
        .then((isInitialized) => {
              print('PhonePe SDK Initialized - $isInitialized'),
      getPaymentAndroidDetails(),
            })
        .catchError((error) {
      print(error);
      return <dynamic>{};
    });
  }

  void startTransaction() async {
    try {
      // PhonePePaymentSdk.startTransaction(request, appSchema)
      //     .then((response) => {
      //     if (response != null) {
      //     print (response['status'].toString()),
      //      print(response['error'].toString()),
      //
      //     } else {
      //       print( "Flow Incomplete")
      //     }
      // })
      //     .catchError((error) {
      //   print(error);
      //   return <dynamic > {};
      // });
    } catch (error) {
      print(error);
    }
  }
}
