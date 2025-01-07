import 'package:equatable/equatable.dart';

class BaseException extends Equatable implements Exception {
  final String message;

  const BaseException({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerException extends BaseException {
  final int code;

  const ServerException({required this.code, required super.message});

  @override
  List<Object?> get props => [code, message];
}

class ClientException extends BaseException {
  const ClientException({required super.message});

  @override
  List<Object?> get props => [message];
}
