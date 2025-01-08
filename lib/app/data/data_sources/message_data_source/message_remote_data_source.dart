import 'package:synapsis/app/core/api/api.dart';
import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/models/message_message/message_model.dart';
import 'package:synapsis/app/data/models/message_template_model/message_template_model.dart';

abstract class MessageRemoteDataSource {
  Future<List<MessageTemplateModel>> getMessagesTemplate();

  Future<List<MessageModel>> getMessages({required int page, required int limit, required String sort, required String equipmentId});

  Future<MessageModel> createMessages({required String message, required String categoryId, required String deviceType, required String equipmentId});
}

List<T> jsonArrayToList<T>({required List<dynamic> data, required T Function(Map<String, dynamic> e) generateModel}) {
  List<T> res = [];
  data.cast<Map<String, dynamic>>().forEach((e) {
    res.add(generateModel(e));
  });
  return res;
}

class MessageRemoteDataSourceImpl extends MessageRemoteDataSource {
  final Api api;

  MessageRemoteDataSourceImpl({required this.api});

  @override
  Future<MessageModel> createMessages({required String message, required String categoryId, required String deviceType, required String equipmentId}) async {
    try {
      final Map<String, dynamic> data = {
        "equipment_id": equipmentId,
        "message": message,
        "device_type": deviceType,
        "category_id": categoryId,
      };
      final res = await api.reqV1<MessageModel>(
        UrlConstants.monitoringMessages,
        ApiMethod.post,
        data: data,
        fromJsonT: (json) => MessageModel.fromJson(json as Map<String, dynamic>),
        withToken: true,
      );
      return res.data;
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ServerException(code: 500, message: err.toString());
    }
  }

  @override
  Future<List<MessageTemplateModel>> getMessagesTemplate() async {
    try {
      final res = await api.reqV1<List<MessageTemplateModel>>(
        UrlConstants.monitoringSubjects,
        ApiMethod.get,
        fromJsonT: (json) => (json as List).map((e) => MessageTemplateModel.fromJson(e as Map<String, dynamic>)).toList(),
        withToken: true,
      );
      return res.data;
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ServerException(code: 500, message: err.toString());
    }
  }

  @override
  Future<List<MessageModel>> getMessages({required int page, required int limit, required String sort, required String equipmentId}) async {
    try {
      final url = "${UrlConstants.monitoringMessages}?page=$page&limit=$limit&sort=$sort&equipment_id=$equipmentId";

      final res = await api.reqV1<List<MessageModel>>(
        url,
        ApiMethod.get,
        fromJsonT: (json) => (json as List).map((e) => MessageModel.fromJson(e as Map<String, dynamic>)).toList(),
        withToken: true,
      );
      return res.data;
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ServerException(code: 500, message: err.toString());
    }
  }
}
