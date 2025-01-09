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
import 'package:synapsis/app/data/data_sources/message_data_source/message_remote_data_source.dart';
import 'package:synapsis/app/data/models/message_message/message_model.dart';
import 'package:synapsis/app/data/models/message_template_model/message_template_model.dart';
import 'package:synapsis/app/data/models/response_model/response_model.dart';
import 'package:synapsis/app/shared/utils/json_reader.dart';

import 'message_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MessageRemoteDataSource>(), MockSpec<http.Client>(), MockSpec<SharedPreferences>()])
void main() {
  MessageRemoteDataSource mockMessageRemoteDataSource = MockMessageRemoteDataSource();

  http.Client mockClient = MockClient();
  SharedPreferences mockSharedPreferences = MockSharedPreferences();
  Api api = ApiImpl(httpClient: mockClient, sharedPreferences: mockSharedPreferences);
  MessageRemoteDataSourceImpl messageRemoteDataSourceImpl = MessageRemoteDataSourceImpl(api: api);

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  group("Message Remote Data Source", () {
    group("createMessages()", () {
      const String equipmentId201 = "201";
      const String equipmentId400 = "404";
      const String equipmentId500 = "500";
      const String message = "Jalanan berkabut";
      const String deviceType = "Mobile";
      const String categoryId = "1";

      test('Success', () async {
        final expectJson = jsonReader(Assets.jsons.messageCreateMessages201Response);
        final expectT = ResponseModel<MessageModel>.fromJson(expectJson, (json) => MessageModel.fromJson(json as Map<String, dynamic>)).data;

        // Proses stubbing
        when(mockMessageRemoteDataSource.createMessages(
          message: message,
          equipmentId: equipmentId201,
          deviceType: deviceType,
          categoryId: categoryId,
        )).thenAnswer((_) async {
          return expectT;
        });

        try {
          var res = await mockMessageRemoteDataSource.createMessages(
            message: message,
            equipmentId: equipmentId201,
            deviceType: deviceType,
            categoryId: categoryId,
          );
          expect(res, expectT);
        } catch (err) {
          fail(err.toString());
        }
      });

      test('Failure', () async {
        final expectT = ServerException(code: 404, message: "Failure");

        // Proses stubbing
        when(mockMessageRemoteDataSource.createMessages(
          message: message,
          equipmentId: equipmentId500,
          deviceType: deviceType,
          categoryId: categoryId,
        )).thenThrow(expectT);

        try {
          await mockMessageRemoteDataSource.createMessages(
            message: message,
            equipmentId: equipmentId500,
            deviceType: deviceType,
            categoryId: categoryId,
          );
          fail("Error: Expected a $expectT");
        } catch (err) {
          expect(err, expectT);
        }
      });
    });

    group("getMessages()", () {
      const String equipmentId200 = "200";
      const String equipmentId500 = "500";
      const int page = 1;
      const int limit = 10;
      const String sort = "1";

      test('Success', () async {
        final expectJson = jsonReader(Assets.jsons.messageGetMessages200Response);
        final expectT = ResponseModel<List<MessageModel>>.fromJson(
          expectJson,
          (json) => (json as List).map((e) => MessageModel.fromJson(e as Map<String, dynamic>)).toList(),
        ).data;

        // Proses stubbing
        when(mockMessageRemoteDataSource.getMessages(
          equipmentId: equipmentId200,
          page: page,
          limit: limit,
          sort: sort,
        )).thenAnswer((_) async {
          return expectT;
        });

        try {
          var res = await mockMessageRemoteDataSource.getMessages(
            equipmentId: equipmentId200,
            page: page,
            limit: limit,
            sort: sort,
          );
          expect(res, expectT);
        } catch (err) {
          fail(err.toString());
        }
      });

      test('Failure', () async {
        final expectT = ServerException(code: 404, message: "Failure");

        // Proses stubbing
        when(mockMessageRemoteDataSource.getMessages(
          equipmentId: equipmentId500,
          page: page,
          limit: limit,
          sort: sort,
        )).thenThrow(expectT);

        try {
          await mockMessageRemoteDataSource.getMessages(
            equipmentId: equipmentId500,
            page: page,
            limit: limit,
            sort: sort,
          );
          fail("Error: Expected a $expectT");
        } catch (err) {
          expect(err, expectT);
        }
      });
    });

    group("getMessagesTemplate()", () {
      test('Success', () async {
        final expectJson = jsonReader(Assets.jsons.messageGetMessagesTemplate200Response);
        final expectT = ResponseModel<List<MessageTemplateModel>>.fromJson(
          expectJson,
          (json) => (json as List).map((e) => MessageTemplateModel.fromJson(e as Map<String, dynamic>)).toList(),
        ).data;

        // Proses stubbing
        when(mockMessageRemoteDataSource.getMessagesTemplate()).thenAnswer((_) async {
          return expectT;
        });

        try {
          var res = await mockMessageRemoteDataSource.getMessagesTemplate();
          expect(res, expectT);
        } catch (err) {
          fail(err.toString());
        }
      });

      test('Failure', () async {
        final expectT = ServerException(code: 404, message: "Failure");

        // Proses stubbing
        when(mockMessageRemoteDataSource.getMessagesTemplate()).thenThrow(expectT);

        try {
          await mockMessageRemoteDataSource.getMessagesTemplate();
          fail("Error: Expected a $expectT");
        } catch (err) {
          expect(err, expectT);
        }
      });
    });
  });

  group("Message Remote Data Source Implementation", () {
    group("createMessages()", () {
      const String equipmentId201 = "201";
      const String equipmentId404 = "404";
      const String equipmentId500 = "500";
      const String message = "Jalanan berkabut";
      const String deviceType = "Mobile";
      const String categoryId = "1";
      final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.monitoringMessages}");
      test('Status Code 201', () async {
        final expectJson = jsonReader(Assets.jsons.messageCreateMessages201Response);
        final expectT = ResponseModel<MessageModel>.fromJson(expectJson, (json) => MessageModel.fromJson(json as Map<String, dynamic>)).data;
        // Proses stubbing
        final body = {
          "equipment_id": equipmentId201,
          "message": message,
          "device_type": deviceType,
          "category_id": categoryId,
        };
        when(mockClient.post(uri, body: json.encode(body), headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 201);
        });

        try {
          var res = await messageRemoteDataSourceImpl.createMessages(
            message: message,
            equipmentId: equipmentId201,
            deviceType: deviceType,
            categoryId: categoryId,
          );

          expect(res, expectT);
        } catch (err) {
          fail("Error: $err");
        }
      });

      test('Status Code 404', () async {
        final expectJson = jsonReader(Assets.jsons.api404Response);

        // Proses stubbing
        final body = {
          "equipment_id": equipmentId404,
          "message": message,
          "device_type": deviceType,
          "category_id": categoryId,
        };
        when(mockClient.post(uri, body: json.encode(body), headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 404);
        });

        try {
          await messageRemoteDataSourceImpl.createMessages(
            message: message,
            equipmentId: equipmentId404,
            deviceType: deviceType,
            categoryId: categoryId,
          );
          fail("Error: Expected a $ServerException");
        } catch (err) {
          expect(err, isA<ServerException>());
        }
      });

      test('Status Code 500', () async {
        final expectJson = jsonReader(Assets.jsons.api500Response);

        // Proses stubbing
        final body = {
          "equipment_id": equipmentId500,
          "message": message,
          "device_type": deviceType,
          "category_id": categoryId,
        };
        when(mockClient.post(uri, body: json.encode(body), headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 500);
        });

        try {
          await messageRemoteDataSourceImpl.createMessages(
            message: message,
            equipmentId: equipmentId500,
            deviceType: deviceType,
            categoryId: categoryId,
          );
          fail("Error: Expected a $ServerException");
        } catch (err) {
          expect(err, isA<ServerException>());
        }
      });
    });
    group("getMessages()", () {
      const String equipmentId200 = "200";
      const String equipmentId404 = "404";
      const String equipmentId500 = "500";
      const int page = 1;
      const int limit = 10;
      const String sort = "1";
      test('Status Code 200', () async {
        final expectJson = jsonReader(Assets.jsons.messageGetMessages200Response);
        final expectT = ResponseModel<List<MessageModel>>.fromJson(
          expectJson,
          (json) => (json as List).map((e) => MessageModel.fromJson(e as Map<String, dynamic>)).toList(),
        ).data;
        final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.monitoringMessages}?page=$page&limit=$limit&sort=$sort&equipment_id=$equipmentId200");
        // Proses stubbing
        when(mockClient.get(uri, headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 200);
        });

        try {
          var res = await messageRemoteDataSourceImpl.getMessages(
            equipmentId: equipmentId200,
            page: page,
            limit: limit,
            sort: sort,
          );

          expect(res, expectT);
        } catch (err) {
          fail("Error: $err");
        }
      });

      test('Status Code 404', () async {
        final expectJson = jsonReader(Assets.jsons.api404Response);
        final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.monitoringMessages}?page=$page&limit=$limit&sort=$sort&equipment_id=$equipmentId404");
        // Proses stubbing
        when(mockClient.post(uri, headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 404);
        });

        try {
          await messageRemoteDataSourceImpl.getMessages(
            equipmentId: equipmentId404,
            page: page,
            limit: limit,
            sort: sort,
          );
          fail("Error: Expected a $ServerException");
        } catch (err) {
          expect(err, isA<ServerException>());
        }
      });

      test('Status Code 500', () async {
        final expectJson = jsonReader(Assets.jsons.api500Response);
        final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.monitoringMessages}?page=$page&limit=$limit&sort=$sort&equipment_id=$equipmentId500");

        // Proses stubbing
        when(mockClient.post(uri, headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 500);
        });

        try {
          await messageRemoteDataSourceImpl.getMessages(
            equipmentId: equipmentId500,
            page: page,
            limit: limit,
            sort: sort,
          );
          fail("Error: Expected a $ServerException");
        } catch (err) {
          expect(err, isA<ServerException>());
        }
      });
    });
    group("getMessagesTemplate()", () {
      final uri = Uri.parse("${UrlConstants.baseApiUrl}${UrlConstants.monitoringSubjects}");
      test('Status Code 200', () async {
        final expectJson = jsonReader(Assets.jsons.messageGetMessagesTemplate200Response);
        final expectT = ResponseModel<List<MessageTemplateModel>>.fromJson(
          expectJson,
          (json) => (json as List).map((e) => MessageTemplateModel.fromJson(e as Map<String, dynamic>)).toList(),
        ).data;
        // Proses stubbing
        when(mockClient.get(uri, headers: headers)).thenAnswer((e) async {
          return http.Response(json.encode(expectJson), 200);
        });

        try {
          var res = await messageRemoteDataSourceImpl.getMessagesTemplate();

          expect(res, expectT);
        } catch (err) {
          fail("Error: $err");
        }
      });

      // test('Status Code 404', () async {
      //   final expectJson = jsonReader(Assets.jsons.api404Response);
      //   // Proses stubbing
      //   when(mockClient.post(uri, headers: headers)).thenAnswer((e) async {
      //     return http.Response(json.encode(expectJson), 404);
      //   });
      //
      //   try {
      //     await messageRemoteDataSourceImpl.getMessagesTemplate();
      //     fail("Error: Expected a $ServerException");
      //   } catch (err) {
      //     expect(err, isA<ServerException>());
      //   }
      // });
      //
      // test('Status Code 500', () async {
      //   final expectJson = jsonReader(Assets.jsons.api500Response);
      //
      //   // Proses stubbing
      //   when(mockClient.post(uri, headers: headers)).thenAnswer((e) async {
      //     return http.Response(json.encode(expectJson), 500);
      //   });
      //
      //   try {
      //     await messageRemoteDataSourceImpl.getMessagesTemplate();
      //     fail("Error: Expected a $ServerException");
      //   } catch (err) {
      //     expect(err, isA<ServerException>());
      //   }
      // });
    });
  });
}
