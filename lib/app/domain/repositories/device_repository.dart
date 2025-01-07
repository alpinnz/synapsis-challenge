import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';

abstract class DeviceRepository {
  Future<Either<Exception, Device>> getDeviceById({required String deviceId});
}
