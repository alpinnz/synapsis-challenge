import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/data_sources/message_data_source/message_remote_data_source.dart';
import 'package:synapsis/app/domain/entities/message/message.dart';
import 'package:synapsis/app/domain/entities/message_template/message_template.dart';
import 'package:synapsis/app/domain/repositories/message_repository.dart';

class MessageRepositoryImpl extends MessageRepository {
  final MessageRemoteDataSource messageRemoteDataSource;

  MessageRepositoryImpl({required this.messageRemoteDataSource});

  @override
  Future<Either<BaseException, Message>> createMessages({
    required String message,
    required String categoryId,
    required String deviceType,
    required String equipmentId,
  }) async {
    try {
      final res = await messageRemoteDataSource.createMessages(message: message, categoryId: categoryId, deviceType: deviceType, equipmentId: equipmentId);
      return Success(res.toEntity());
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }

  @override
  Future<Either<BaseException, List<Message>>> getMessages({required int page, required int limit, required String sort, required String equipmentId}) async {
    try {
      final res = await messageRemoteDataSource.getMessages(page: page, limit: limit, sort: sort, equipmentId: equipmentId);
      return Success(res.map((e) => e.toEntity()).toList());
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }

  @override
  Future<Either<BaseException, List<MessageTemplate>>> getMessagesTemplate() async {
    try {
      final res = await messageRemoteDataSource.getMessagesTemplate();
      return Success(res.map((e) => e.toEntity()).toList());
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}
