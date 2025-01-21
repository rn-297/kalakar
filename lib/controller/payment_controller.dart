import 'dart:convert';

import 'package:get/get.dart';
import 'package:kalakar/data/models/payment/payment_details_model.dart';
import 'package:kalakar/data/models/payment/payment_initiate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/api/api_client.dart';
import '../data/local_database/hive_service.dart';
import '../data/local_database/login_table.dart';
import '../utils/kalakar_constants.dart';

class PaymentController extends GetxController {
  bool isPaymentDetailsLoading = true;
  ProfileStatusData profileStatusData = ProfileStatusData();
  List<ReturnPaymentIntegrationAPIResponseList> paymentDetailsList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPaymentDetails();
  }

  Future<void> getPaymentDetails() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      update();
      final body = {
        "fK_AccountID": 1, //loginTable.accountID
        "redirectURL": "",
        "callbackURL": ""
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.getPaymentDetails,
          jsonEncode(body),
          loginTable.token);
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
    }
  }

  Future<void> initiatePayment() async {
    LoginTable? loginTable = await HiveService.getLoginData();
    if (loginTable != null) {
      final body = {
        "fK_AccountID": loginTable.accountID,
        "redirectURL": "",
        "callbackURL": "",
      };

      var response = await ApiClient.postDataToken(
          KalakarConstants.initiatePayment, jsonEncode(body), loginTable.token);
      // print(response.statusCode);
      // print(response);

      if (response.statusCode == 200) {
        PayInitiateModel payInitiateModel =
             PayInitiateModel.fromJson(jsonDecode(response.body));

        if (payInitiateModel.success!) {
          launchUrl(Uri.parse(
              payInitiateModel.data!.instrumentResponse!.redirectInfo!.url!));
        }
      }
    }
  }
}
