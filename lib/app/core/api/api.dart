import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/models/response_model/response_model.dart';

enum ApiMethod { get, post, put, delete, patch }

abstract interface class Api {
  Future<ResponseModel<T>> reqV1<T>(
    String pathUrl,
    ApiMethod method, {
    required T Function(Object? json) fromJsonT,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, String>? additionalHeaders,
    required bool withToken,
  });
}

class ApiImpl implements Api {
  final http.Client httpClient;
  final SharedPreferences sharedPreferences;
  final String cookieKey = "set-cookie";

  ApiImpl({required this.httpClient, required this.sharedPreferences});

  @override
  Future<ResponseModel<T>> reqV1<T>(
    String pathUrl,
    ApiMethod method, {
    required T Function(Object? json) fromJsonT,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, String>? additionalHeaders,
    required bool withToken,
  }) async {
    final uri = Uri.parse("${UrlConstants.baseApiUrl}$pathUrl");
    final body = jsonEncode(data);

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    if (withToken && sharedPreferences.getString(cookieKey) is String) {
      headers.addAll({"cookie": sharedPreferences.getString(cookieKey)!});
    }

    http.Response response;

    switch (method) {
      case ApiMethod.get:
        {
          response = await httpClient.get(uri, headers: headers);
        }
      case ApiMethod.post:
        {
          response = await httpClient.post(uri, body: body, headers: headers);
        }
      case ApiMethod.put:
        {
          response = await httpClient.put(uri, body: body, headers: headers);
        }
      case ApiMethod.delete:
        {
          response = await httpClient.delete(uri, body: body, headers: headers);
        }
      case ApiMethod.patch:
        {
          response = await httpClient.patch(uri, body: body, headers: headers);
        }
    }

    log("${response.statusCode} ${method.name.split(".")[0]} $pathUrl}", name: "API");

    if (response.headers.containsKey(cookieKey)) {
      log("${response.headers[cookieKey]}", name: "API-set-cookie");
      final rawSplit = '${response.headers[cookieKey]}'.split(";");
      if (rawSplit.isNotEmpty) {
        sharedPreferences.setString(cookieKey, rawSplit.first);
      }
    }

    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(json.decode(response.body));
        final res = ResponseModel<T>.fromJson(json.decode(response.body), fromJsonT);
        return res;
      } else {
        final res = ResponseModel<String>.fromJson(json.decode(response.body), (json) => json.toString());
        throw ServerException(code: response.statusCode, message: res.message);
      }
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ServerException(code: 500, message: err.toString());
    }
  }
}
