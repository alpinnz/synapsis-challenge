import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/user/user.dart';
import 'package:synapsis/app/domain/repositories/auth_repository.dart';
import 'package:synapsis/app/shared/models/use_case/use_case.dart';

class AuthOnSetUser implements UseCaseWithParams<Either<BaseException, void>, AuthOnSetUserParams> {
  final AuthRepository authRepository;

  const AuthOnSetUser({required this.authRepository});

  @override
  Future<Either<BaseException, void>> execute({required AuthOnSetUserParams params}) async {
    try {
      return authRepository.onSetUser(data: params.user);
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}

class AuthOnSetUserParams {
  final User user;

  const AuthOnSetUserParams({required this.user});
}
