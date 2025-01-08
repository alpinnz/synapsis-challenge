import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/message/message.dart';
import 'package:synapsis/app/domain/repositories/message_repository.dart';
import 'package:synapsis/app/shared/models/use_case/use_case.dart';

class MessageCreateMessages implements UseCaseWithParams<Either<BaseException, Message>, MessageCreateMessagesParams> {
  final MessageRepository messageRepository;

  const MessageCreateMessages({required this.messageRepository});

  @override
  Future<Either<BaseException, Message>> execute({required MessageCreateMessagesParams params}) async {
    try {
      return messageRepository.createMessages(
        message: params.message,
        categoryId: params.categoryId,
        deviceType: params.deviceType,
        equipmentId: params.equipmentId,
      );
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}

class MessageCreateMessagesParams {
  final String message, categoryId, deviceType, equipmentId;

  const MessageCreateMessagesParams({required this.message, required this.categoryId, required this.deviceType, required this.equipmentId});
}
