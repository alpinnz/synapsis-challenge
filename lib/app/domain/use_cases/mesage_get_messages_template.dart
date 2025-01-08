import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/message_template/message_template.dart';
import 'package:synapsis/app/domain/repositories/message_repository.dart';
import 'package:synapsis/app/shared/models/use_case/use_case.dart';

class MessageGetMessagesTemplate implements UseCaseWithoutParams<Either<BaseException, List<MessageTemplate>>> {
  final MessageRepository messageRepository;

  const MessageGetMessagesTemplate({required this.messageRepository});

  @override
  Future<Either<BaseException, List<MessageTemplate>>> execute() async {
    try {
      return messageRepository.getMessagesTemplate();
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}
