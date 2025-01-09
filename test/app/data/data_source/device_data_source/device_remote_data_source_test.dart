import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synapsis/app/assets/assets.gen.dart';
import 'package:synapsis/app/core/api/api.dart';
import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/data_sources/device_data_source/device_remote_data_source.dart';
import 'package:synapsis/app/data/models/device_model/device_model.dart';
import 'package:synapsis/app/data/models/response_model/response_model.dart';
import 'package:synapsis/app/shared/utils/json_reader.dart';

import 'device_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DeviceRemoteDataSource>(), MockSpec<http.Client>(), MockSpec<SharedPreferences>()])
void main() {
  DeviceRemoteDataSource mockDeviceRemoteDataSource = MockDeviceRemoteDataSource();

  http.Client mockClient = MockClient();
  SharedPreferences mockSharedPreferences = MockSharedPreferences();
  Api api = ApiImpl(httpClient: mockClient, sharedPreferences: mockSharedPreferences);
  DeviceRemoteDataSourceImpl deviceRemoteDataSourceImpl = DeviceRemoteDataSourceImpl(api: api);

  const String deviceId200 = "DEVICE06";
  const String deviceId200Deactivate = "445D768F-F353-42E8-9243-34AB0F22A1FA";
  const String deviceId404 = "1231231";
  const String deviceId500 = "1231231";

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  group("Device Remote Data Source", () {
    group("getDeviceById(deviceId: deviceId)()", () {
      test('Success', () async {
        final expectJson = jsonReader(Assets.jsons.deviceGetDeviceById200Response);
        final expectT = ResponseModel<DeviceModel>.fromJson(expectJson, (json) => DeviceModel.fromJson(json as Map<String, dynamic>)).data;

        // Proses stubbing
        when(mockDeviceRemoteDataSource.getDeviceById(deviceId: deviceId200)).thenAnswer((_) async {
          return expectT;
        });

        try {
          var res = await mockDeviceRemoteDataSource.getDeviceById(deviceId: deviceId200);
          expect(res, expectT);
        } catch (err) {
          fail(err.toString());
        }
      });

      test('Failure', () async {
        final expectT = ServerException(code: 404, message: "Failure");

        // Proses stubbing
        when(mockDeviceRemoteDataSource.getDeviceById(deviceId: deviceId404)).thenThrow(expectT);

        try {
          await mockDeviceRemoteDataSource.getDeviceById(deviceId: deviceId404);
          fail("Error: Expected a $expectT");
        } catch (err) {
          expect(err, expectT);
        }
      });
    });
  });

  group("Device Remote Data Source Implementation", () {
    group("getDeviceById(deviceId: deviceId)()", () {
      test('Status Code 200', () async {
        final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.equipmentsDevices}/$deviceId200");
        final expectJson = jsonReader(Assets.jsons.deviceGetDeviceById200Response);
        final expectT = ResponseModel<DeviceModel>.fromJson(expectJson, (json) => DeviceModel.fromJson(json as Map<String, dynamic>)).data;
        // Proses stubbing
        when(mockClient.get(uri, headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 200);
        });

        try {
          var res = await deviceRemoteDataSourceImpl.getDeviceById(deviceId: deviceId200);

          expect(res, expectT);
        } catch (err) {
          fail("Error: $err");
        }
      });

      test('Status Code 200 Deactivate', () async {
        final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.equipmentsDevices}/$deviceId200Deactivate");
        final expectJson = jsonReader(Assets.jsons.deviceGetDeviceById200DeactivateResponse);
        final expectT = ResponseModel<DeviceModel>.fromJson(expectJson, (json) => DeviceModel.fromJson(json as Map<String, dynamic>)).data;
        // Proses stubbing
        when(mockClient.get(uri, headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 200);
        });

        try {
          var res = await deviceRemoteDataSourceImpl.getDeviceById(deviceId: deviceId200Deactivate);
          expect(res, expectT);
        } catch (err) {
          fail("Error: $err");
        }
      });

      test('Status Code 404', () async {
        final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.equipmentsDevices}/$deviceId404");
        final expectJson = jsonReader(Assets.jsons.api404Response);
        // Proses stubbing
        when(mockClient.get(uri)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 404);
        });

        try {
          await deviceRemoteDataSourceImpl.getDeviceById(deviceId: deviceId404);
          fail("Error: Expected a $ServerException");
        } catch (err) {
          expect(err, isA<ServerException>());
        }
      });

      test('Status Code 500', () async {
        final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.equipmentsDevices}/$deviceId500");
        final expectJson = jsonReader(Assets.jsons.api500Response);
        // Proses stubbing
        when(mockClient.get(uri)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 500);
        });

        try {
          await deviceRemoteDataSourceImpl.getDeviceById(deviceId: deviceId404);
          fail("Error: Expected a $ServerException");
        } catch (err) {
          expect(err, isA<ServerException>());
        }
      });
    });
  });
}
