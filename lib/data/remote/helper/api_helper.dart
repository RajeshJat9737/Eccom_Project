import 'dart:convert';
import 'dart:io';

import 'package:ecomm_class/data/remote/helper/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/constants/app_constants.dart';

class ApiHelper {
  getApi({required String url}) {}

  Future<dynamic> postApi({
    required String url,
    Map<String, dynamic>? mBodyPar,
    Map<String, String>? mHeaders,
    bool isAuth = false,
  }) async {
    if(!isAuth){
      mHeaders ??={};
      /// agr login signup ke allaawa api ko or hit kar rahe hi to niche wale 2 line code bahut jeruri hai
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(AppConstants.PREF_USER_TOKEN) ?? "";

      mHeaders ["Authorization"] = "Bearer$token";
    }
    
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: mBodyPar != null ? jsonEncode(mBodyPar) : null,
        headers: mHeaders,
      );
      return handleResponse(res: response);
    } on SocketException catch (e) {
      throw NoInternetException(exceptionMsg: e.toString());
    } catch (e) {
      rethrow;
    }
  }

  dynamic handleResponse({required http.Response res}) {
    switch (res.statusCode) {
      case 200:
        {
          /// success
          var data = jsonDecode(res.body);
          return data;
        }
      case 400:
        {
          throw BadRequestException(
            exceptionMsg: "with status  code ${res.statusCode}",
          );
        }
      case 401:
        {
          throw UnAuthorisedException(
            exceptionMsg: "with status  code ${res.statusCode}",
          );
        }
      case 404:
        {
          throw NoInternetException(
            exceptionMsg: "with status  code ${res.statusCode}",
          );
        }
      case 500:
      default:
        {
          throw ServerException(
            exceptionMsg: "with status code ${res.statusCode}",
          );
        }
    }
  }
}
