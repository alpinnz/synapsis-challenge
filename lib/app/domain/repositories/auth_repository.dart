import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/user/user.dart';

abstract class AuthRepository {
  Future<Either<BaseException, User>> onLoginTabletUnit({required String unitId, required String nik, required String shiftId, required int loginType});
}
