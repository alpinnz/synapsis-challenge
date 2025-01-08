import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/message/message.dart';
import 'package:synapsis/app/domain/entities/message_template/message_template.dart';

abstract class MessageRepository {
  Future<Either<BaseException, List<MessageTemplate>>> getMessagesTemplate();

  Future<Either<BaseException, List<Message>>> getMessages({required int page, required int limit, required String sort, required String equipmentId});

  Future<Either<BaseException, Message>> createMessages({required String message, required String categoryId, required String deviceType, required String equipmentId});
}
