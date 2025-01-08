import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/models/response_model/response_model.dart';
import 'package:synapsis/app/data/models/user_model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> onLoginTabletUnit({required String unitId, required String nik, required String shiftId, required int loginType});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final http.Client httpClient;

  AuthRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<UserModel> onLoginTabletUnit({required String unitId, required String nik, required String shiftId, required int loginType}) async {
    try {
      final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.loginTabletUnit}");
      final body = {
        "unit_id": unitId,
        "nik": nik,
        "shift_id": shiftId,
        "login_type": loginType,
      };

      final response = await httpClient.post(
        uri,
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final res = ResponseModel<UserModel>.fromJson(json.decode(response.body), (json) => UserModel.fromJson(json as Map<String, dynamic>));
        return res.data;
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
