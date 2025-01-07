import 'package:equatable/equatable.dart';

class GeneralException extends Equatable implements Exception {
  final String message;

  const GeneralException({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerException extends Equatable implements Exception {
  final int code;
  final String message;

  const ServerException({required this.code, required this.message});

  @override
  List<Object?> get props => [code, message];
}

class ConnectionException extends Equatable implements Exception {
  final String message;

  const ConnectionException({required this.message});

  @override
  List<Object?> get props => [message];
}

class StatusCodeException extends Equatable implements Exception {
  final String message;

  const StatusCodeException({required this.message});

  @override
  List<Object?> get props => [message];
}

class EmptyException extends Equatable implements Exception {
  final String message;

  const EmptyException({required this.message});

  @override
  List<Object?> get props => [message];
}
