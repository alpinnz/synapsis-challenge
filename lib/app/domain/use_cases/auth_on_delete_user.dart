import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/repositories/auth_repository.dart';
import 'package:synapsis/app/shared/models/use_case/use_case.dart';

class AuthOnDeleteUser implements UseCaseWithoutParams<Either<BaseException, void>> {
  final AuthRepository authRepository;

  const AuthOnDeleteUser({required this.authRepository});

  @override
  Future<Either<BaseException, void>> execute() async {
    try {
      return authRepository.onDeleteUser();
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}
