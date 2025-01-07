import 'package:connectivity_plus/connectivity_plus.dart';
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
  Future<Either<Exception, Device>> getDeviceById({required String deviceId}) async {
    try {
      // Check internet
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return Failure(ConnectionException(message: "connection failed"));
      } else {
        Device res = await deviceRemoteDataSource.getDeviceById(deviceId: deviceId);
        return Success(res);
      }
    } catch (e) {
      return Failure(ServerException(code: 500, message: e.toString()));
    }
  }
}
