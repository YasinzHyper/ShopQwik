import 'dart:convert';

import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/error_handler.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../models/product.dart';
import '../../../provider/user_provider.dart';

class ProductDetailsServices {
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {

      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
          'rating': rating,
        }),
      );

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product rated successfully!');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {

      http.Response res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
        }),
      );

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            cart: jsonDecode(res.body)['cart'],
          );
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}