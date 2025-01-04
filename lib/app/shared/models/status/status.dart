import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final bool isInitial;
  final bool isLoading;
  final bool isFailure;
  final bool isSuccess;
  final bool isEmpty;
  final bool isLoadingMore;
  final String? message;
  final Exception? exception;

  const Status({
    this.isInitial = false,
    this.isEmpty = false,
    this.isLoading = false,
    this.isFailure = false,
    this.isSuccess = false,
    this.message,
    this.isLoadingMore = false,
    this.exception,
  });

  const Status.initial() : this(isInitial: true);

  const Status.loading({String? message, Exception? exception}) : this(isLoading: true, message: message, exception: exception);

  const Status.loadingMore({String? message, Exception? exception}) : this(isLoadingMore: true, message: message, exception: exception);

  const Status.success({String? message, Exception? exception}) : this(isSuccess: true, message: message, exception: exception);

  const Status.failure({String? message, Exception? exception}) : this(isFailure: true, message: message, exception: exception);

  const Status.empty({String? message, Exception? exception}) : this(isEmpty: true, message: message, exception: exception);

  @override
  List<Object?> get props => [isInitial, isLoading, isFailure, isSuccess, isEmpty, isLoadingMore];
}
