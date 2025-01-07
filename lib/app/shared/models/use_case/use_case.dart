abstract class UseCaseWithParams<Type, Params> {
  Future<Type> execute({required Params params});
}

abstract class UseCaseWithoutParams<Type> {
  Future<Type> execute();
}
