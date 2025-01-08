import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/user/user.dart';
import 'package:synapsis/app/domain/repositories/auth_repository.dart';
import 'package:synapsis/app/shared/models/use_case/use_case.dart';

class AuthOnLoginTabletUnit implements UseCaseWithParams<Either<BaseException, User>, AuthOnLoginTabletUnitParams> {
  final AuthRepository authRepository;

  const AuthOnLoginTabletUnit({required this.authRepository});

  @override
  Future<Either<BaseException, User>> execute({required AuthOnLoginTabletUnitParams params}) async {
    try {
      return authRepository.onLoginTabletUnit(unitId: params.unitId, nik: params.nik, shiftId: "048C-NS", loginType: 1);
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}

class AuthOnLoginTabletUnitParams {
  final String unitId, nik;

  const AuthOnLoginTabletUnitParams({required this.unitId, required this.nik});
}
