import 'package:equatable/equatable.dart';

/// Base Either class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
sealed class Either<E extends Exception, S> extends Equatable {
  const Either();

  S? get getValue {
    return switch (this) {
      Success(value: final value) => value,
      Failure() => null,
    };
  }
}

final class Success<E extends Exception, S> extends Either<E, S> {
  const Success(this.value);

  final S value;

  @override
  List<Object?> get props => [value];
}

final class Failure<E extends Exception, S> extends Either<E, S> {
  const Failure(this.exception);

  final E exception;

  @override
  List<Object?> get props => [exception];
}
