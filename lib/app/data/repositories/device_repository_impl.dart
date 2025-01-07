import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/data/data_sources/device_data_source/device_remote_data_source.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';
import 'package:synapsis/app/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl extends DeviceRepository {
  final DeviceRemoteDataSource deviceRemoteDataSource;

  DeviceRepositoryImpl({
    required this.deviceRemoteDataSource,
  });

  @override
  Future<Either<BaseException, Device>> getDeviceById({required String deviceId}) async {
    try {
      final res = await deviceRemoteDataSource.getDeviceById(deviceId: deviceId);
      return Success(res.toEntity());
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}
