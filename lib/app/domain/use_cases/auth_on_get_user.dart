import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/user/user.dart';
import 'package:synapsis/app/domain/repositories/auth_repository.dart';
import 'package:synapsis/app/shared/models/use_case/use_case.dart';

class AuthOnGetUser implements UseCaseWithoutParams<Either<BaseException, User>> {
  final AuthRepository authRepository;

  const AuthOnGetUser({required this.authRepository});

  @override
  Future<Either<BaseException, User>> execute() async {
    try {
      return authRepository.onGetUser();
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}
