import 'package:synapsis/app/core/api/api.dart';
import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/models/user_model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> onLoginTabletUnit({required String unitId, required String nik, required String shiftId, required int loginType});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Api api;

  AuthRemoteDataSourceImpl({required this.api});

  @override
  Future<UserModel> onLoginTabletUnit({required String unitId, required String nik, required String shiftId, required int loginType}) async {
    try {
      final Map<String, dynamic> data = {
        "unit_id": unitId,
        "nik": nik,
        "shift_id": shiftId,
        "login_type": loginType,
      };
      final res = await api.reqV1<UserModel>(
        UrlConstants.loginTabletUnit,
        ApiMethod.post,
        data: data,
        fromJsonT: (json) => UserModel.fromJson(json as Map<String, dynamic>),
        withToken: false,
      );
      return res.data;
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ServerException(code: 500, message: err.toString());
    }
  }
}
