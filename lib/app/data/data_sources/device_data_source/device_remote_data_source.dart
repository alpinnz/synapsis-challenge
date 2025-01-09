import 'package:synapsis/app/core/api/api.dart';
import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/models/device_model/device_model.dart';

abstract class DeviceRemoteDataSource {
  Future<DeviceModel> getDeviceById({required String deviceId});
}

class DeviceRemoteDataSourceImpl extends DeviceRemoteDataSource {
  final Api api;

  DeviceRemoteDataSourceImpl({required this.api});

  @override
  Future<DeviceModel> getDeviceById({required String deviceId}) async {
    try {
      final res = await api.reqV1<DeviceModel>(
        "${UrlConstants.equipmentsDevices}/$deviceId",
        ApiMethod.get,
        fromJsonT: (json) => DeviceModel.fromJson(json as Map<String, dynamic>),
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
