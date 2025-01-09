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
import 'package:synapsis/app/data/data_sources/auth_data_source/auth_remote_data_source.dart';
import 'package:synapsis/app/data/models/response_model/response_model.dart';
import 'package:synapsis/app/data/models/user_model/user_model.dart';
import 'package:synapsis/app/shared/utils/json_reader.dart';

import 'auth_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRemoteDataSource>(), MockSpec<http.Client>(), MockSpec<SharedPreferences>()])
void main() {
  AuthRemoteDataSource mockAuthRemoteDataSource = MockAuthRemoteDataSource();

  final mockClient = MockClient();
  final mockSharedPreferences = MockSharedPreferences();
  Api api = ApiImpl(httpClient: mockClient, sharedPreferences: mockSharedPreferences);
  AuthRemoteDataSource authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(api: api);

  const String unitId200 = "DEVICE06";
  const String unitId400 = "-";
  const String nik = "ALPINNZNS";
  const String shiftId = "048C-NS";
  const int loginType = 1;
  const headers = {"Content-Type": "application/json"};

  group("Auth Remote Data Source", () {
    group("onLoginTabletUnit()", () {
      test('Success', () async {
        final expectJson = jsonReader(Assets.jsons.authLoginTabletUnit200Response);
        final expectT = ResponseModel<UserModel>.fromJson(expectJson, (json) => UserModel.fromJson(json as Map<String, dynamic>)).data;

        // Proses stubbing
        when(mockAuthRemoteDataSource.onLoginTabletUnit(
          unitId: unitId200,
          nik: nik,
          shiftId: shiftId,
          loginType: loginType,
        )).thenAnswer((_) async {
          return expectT;
        });

        try {
          var res = await mockAuthRemoteDataSource.onLoginTabletUnit(
            unitId: unitId200,
            nik: nik,
            shiftId: shiftId,
            loginType: loginType,
          );
          expect(res, expectT);
        } catch (err) {
          fail(err.toString());
        }
      });

      test('Failure', () async {
        final expectT = ServerException(code: 400, message: "Failure");

        // Proses stubbing
        when(mockAuthRemoteDataSource.onLoginTabletUnit(
          unitId: unitId400,
          nik: nik,
          shiftId: shiftId,
          loginType: loginType,
        )).thenThrow(expectT);

        try {
          await mockAuthRemoteDataSource.onLoginTabletUnit(
            unitId: unitId400,
            nik: nik,
            shiftId: shiftId,
            loginType: loginType,
          );
          fail("Error: Expected a $expectT");
        } catch (err) {
          expect(err, isA<ServerException>());
        }
      });
    });
  });

  group("Auth Remote Data Source Implementation", () {
    group("onLoginTabletUnit()", () {
      test('Status Code 200', () async {
        final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.loginTabletUnit}");
        final expectJson = jsonReader(Assets.jsons.authLoginTabletUnit200Response);
        final expectT = ResponseModel<UserModel>.fromJson(expectJson, (json) => UserModel.fromJson(json as Map<String, dynamic>)).data;
        // Proses stubbing
        final body = {
          "unit_id": unitId200,
          "nik": nik,
          "shift_id": shiftId,
          "login_type": loginType,
        };
        when(mockClient.post(uri, body: json.encode(body), headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 200);
        });

        try {
          var res = await authRemoteDataSourceImpl.onLoginTabletUnit(
            unitId: unitId200,
            nik: nik,
            shiftId: shiftId,
            loginType: loginType,
          );

          expect(res, expectT);
        } catch (err) {
          fail("Error: $err");
        }
      });

      test('Status Code 400', () async {
        final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.loginTabletUnit}");
        final expectJson = jsonReader(Assets.jsons.authLoginTabletUnit400Response);
        // Proses stubbing

        final body = {
          "unit_id": unitId400,
          "nik": nik,
          "shift_id": shiftId,
          "login_type": loginType,
        };

        when(mockClient.post(uri, body: json.encode(body), headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 400);
        });

        try {
          await authRemoteDataSourceImpl.onLoginTabletUnit(
            unitId: unitId400,
            nik: nik,
            shiftId: shiftId,
            loginType: loginType,
          );
          fail("Error: Expected a $ServerException");
        } catch (err) {
          expect(err, isA<ServerException>());
        }
      });
    });
  });
}
