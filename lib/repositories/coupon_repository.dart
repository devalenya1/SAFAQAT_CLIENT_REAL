import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

import '../app_config.dart';
import '../data_model/coupon_apply_response.dart';
import '../data_model/coupon_remove_response.dart';
import '../helpers/shared_value_helper.dart';

class CouponRepository {
  Future<CouponApplyResponse> getCouponApplyResponse(String couponCode) async {
    var postBody = jsonEncode(
        {"user_id": user_id.$.toString(), "coupon_code": couponCode});
    // jsonEncode({"user_id": "${user_id.$}", "coupon_code": "$coupon_code"});

    Uri url = Uri.parse("${AppConfig.BASE_URL}/coupon-apply");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${access_token.$}",
          "App-Language": app_language.$
        },
        body: postBody);

    return couponApplyResponseFromJson(response.body);
  }

  Future<CouponRemoveResponse> getCouponRemoveResponse() async {
    var postBody = jsonEncode({"user_id": user_id.$.toString()});

    Uri url = Uri.parse("${AppConfig.BASE_URL}/coupon-remove");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${access_token.$}",
          "App-Language": app_language.$
        },
        body: postBody);

    return couponRemoveResponseFromJson(response.body);
  }
  // Future<CouponApplyResponse> getCouponApplyResponse(
  //     // String couponCode) async {
  //     @required String coupon_code) async {
  //   var post_body =
  //       jsonEncode({"user_id": user_id.$.toString(), "coupon_code": coupon_code});
  //       // jsonEncode({"user_id": "${user_id.$}", "coupon_code": "$coupon_code"});

  //   Uri url = Uri.parse("${AppConfig.BASE_URL}/coupon-apply");
  //   final response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer ${access_token.$}",
  //         "App-Language": app_language.$
  //       },
  //       body: post_body);

  //   return couponApplyResponseFromJson(response.body);
  // }

  // Future<CouponRemoveResponse> getCouponRemoveResponse() async {
  //   var post_body = jsonEncode({"user_id": user_id.$.toString()});

  //   Uri url = Uri.parse("${AppConfig.BASE_URL}/coupon-remove");
  //   final response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer ${access_token.$}",
  //         "App-Language": app_language.$
  //       },
  //       body: post_body);

  //   return couponRemoveResponseFromJson(response.body);
  // }
}
