import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/data_sources/auth_data_source/auth_local_data_source.dart';
import 'package:synapsis/app/data/data_sources/auth_data_source/auth_remote_data_source.dart';
import 'package:synapsis/app/domain/entities/user/user.dart';
import 'package:synapsis/app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<BaseException, User>> onLoginTabletUnit({required String unitId, required String nik, required String shiftId, required int loginType}) async {
    try {
      final res = await authRemoteDataSource.onLoginTabletUnit(unitId: unitId, nik: nik, shiftId: shiftId, loginType: loginType);
      return Success(res.toEntity());
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }

  @override
  Future<Either<BaseException, void>> onDeleteUser() async {
    try {
      await authLocalDataSource.onDeleteUser();
      return Success(null);
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }

  @override
  Future<Either<BaseException, User>> onGetUser() async {
    try {
      final res = await authLocalDataSource.onGetUser();
      return Success(res.toEntity());
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }

  @override
  Future<Either<BaseException, void>> onSetUser({required User data}) async {
    try {
      await authLocalDataSource.onSetUser(data: data.toModel());
      return Success(null);
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}
