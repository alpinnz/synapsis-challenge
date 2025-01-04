abstract class UseCaseWithParams<Type, Params> {
  Future<Type> call({required Params params});
}

abstract class UseCaseWithoutParams<Type> {
  Future<Type> call();
}
