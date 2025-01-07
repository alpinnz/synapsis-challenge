import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/models/device_model/device_model.dart';
import 'package:synapsis/app/data/models/response_model/response_model.dart';

abstract class DeviceRemoteDataSource {
  Future<DeviceModel> getDeviceById({required String deviceId});
}

class DeviceRemoteDataSourceImpl extends DeviceRemoteDataSource {
  final http.Client httpClient;

  DeviceRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<DeviceModel> getDeviceById({required String deviceId}) async {
    final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.equipmentsDevices}/$deviceId");
    final response = await httpClient.get(uri);

    try {
      if (response.statusCode == 200) {
        final res = ResponseModel<DeviceModel>.fromJson(json.decode(response.body), (json) => DeviceModel.fromJson(json as Map<String, dynamic>));
        return res.data;
      } else {
        final res = ResponseModel<String>.fromJson(json.decode(response.body), (json) => json.toString());
        throw ServerException(code: response.statusCode, message: res.message);
      }
    } catch (err) {
      throw ServerException(code: 500, message: "Terjadi masalah");
    }
  }
}
