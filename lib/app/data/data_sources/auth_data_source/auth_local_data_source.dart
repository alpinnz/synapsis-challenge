import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/database/app_database.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/models/user_model/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> onGetUser();

  Future<void> onSetUser({required UserModel data});

  Future<void> onDeleteUser();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final AppDatabase database;

  AuthLocalDataSourceImpl({required this.database});

  @override
  Future<void> onDeleteUser() async {
    try {
      final res = await database.delete(store: UrlConstants.loginTabletUnit);
      return;
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw DatabaseException(message: err.toString());
    }
  }

  @override
  Future<UserModel> onGetUser() async {
    try {
      final res = await database.read<UserModel>(store: UrlConstants.loginTabletUnit, fromJsonT: (json) => UserModel.fromJson(json));
      if (res is UserModel) {
        return res;
      }
      throw DatabaseException(message: "Not Found");
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw DatabaseException(message: err.toString());
    }
  }

  @override
  Future<void> onSetUser({required UserModel data}) async {
    try {
      final res = await database.update(store: UrlConstants.loginTabletUnit, data: data);
      return;
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw DatabaseException(message: err.toString());
    }
  }
}
