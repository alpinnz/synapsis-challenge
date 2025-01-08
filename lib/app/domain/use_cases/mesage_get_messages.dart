import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/message/message.dart';
import 'package:synapsis/app/domain/repositories/message_repository.dart';
import 'package:synapsis/app/shared/models/use_case/use_case.dart';

class MessageGetMessages implements UseCaseWithParams<Either<BaseException, List<Message>>, MessageGetMessagesParams> {
  final MessageRepository messageRepository;

  const MessageGetMessages({required this.messageRepository});

  @override
  Future<Either<BaseException, List<Message>>> execute({required MessageGetMessagesParams params}) async {
    try {
      return messageRepository.getMessages(page: params.page, limit: params.limit, sort: params.sort, equipmentId: params.equipmentId);
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}

class MessageGetMessagesParams {
  final String sort, equipmentId;
  final int page, limit;

  const MessageGetMessagesParams({required this.page, required this.limit, required this.sort, required this.equipmentId});
}
