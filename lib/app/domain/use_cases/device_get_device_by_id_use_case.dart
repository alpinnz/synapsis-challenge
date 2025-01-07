import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';
import 'package:synapsis/app/domain/repositories/device_repository.dart';
import 'package:synapsis/app/shared/models/use_case/use_case.dart';

class DeviceGetDeviceByIdUseCase implements UseCaseWithParams<Either<Exception, Device>, DeviceGetDeviceByIdUseCaseParams> {
  final DeviceRepository deviceRepository;

  const DeviceGetDeviceByIdUseCase(this.deviceRepository);

  @override
  Future<Either<Exception, Device>> execute({required DeviceGetDeviceByIdUseCaseParams params}) async {
    return deviceRepository.getDeviceById(deviceId: params.deviceId);
  }
}

class DeviceGetDeviceByIdUseCaseParams {
  final String deviceId;

  const DeviceGetDeviceByIdUseCaseParams({required this.deviceId});
}
