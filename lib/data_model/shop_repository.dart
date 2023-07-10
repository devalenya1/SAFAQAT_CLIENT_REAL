import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../app_config.dart';
import '../data_model/product_mini_response.dart';
import '../data_model/shop_details_response.dart';
import '../data_model/shop_response.dart';
import '../helpers/shared_value_helper.dart';

class ShopRepository {
  Future<ShopResponse> getShops({name = "", page = 1}) async {
    Uri url =
        Uri.parse("${AppConfig.BASE_URL}/shops" + "?page=${page}&name=${name}");

    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    return shopResponseFromJson(response.body);
  }

  Future<ShopDetailsResponse> getShopInfo({@required id = 0}) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/shops/details/${id}");
    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    return shopDetailsResponseFromJson(response.body);
  }

  Future<ProductMiniResponse> getTopFromThisSellerProducts({int id = 0}) async {
    Uri url =
        Uri.parse("${AppConfig.BASE_URL}/shops/products/top/" + id.toString());
    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    return productMiniResponseFromJson(response.body);
  }

  Future<ProductMiniResponse> getNewFromThisSellerProducts({int id = 0}) async {
    Uri url =
        Uri.parse("${AppConfig.BASE_URL}/shops/products/new/" + id.toString());
    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    return productMiniResponseFromJson(response.body);
  }

  Future<ProductMiniResponse> getfeaturedFromThisSellerProducts(
      {int id = 0}) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/shops/products/featured/" + id.toString());
    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    return productMiniResponseFromJson(response.body);
  }

  Future<ProductMiniResponse> getAuctionFromThisSellerProducts(
      {int id = 0}) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/shops/products/auction/" + id.toString());
    final response = await http.get(
      url,
      headers: {
        "App-Language": app_language.$,
      },
    );
    return productMiniResponseFromJson(response.body);
  }
}
