import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';
import 'package:synapsis/app/domain/repositories/device_repository.dart';
import 'package:synapsis/app/shared/models/use_case/use_case.dart';

class DeviceGetDeviceByIdUseCase implements UseCaseWithParams<Either<BaseException, Device>, DeviceGetDeviceByIdUseCaseParams> {
  final DeviceRepository deviceRepository;

  const DeviceGetDeviceByIdUseCase({required this.deviceRepository});

  @override
  Future<Either<BaseException, Device>> execute({required DeviceGetDeviceByIdUseCaseParams params}) async {
    try {
      return deviceRepository.getDeviceById(deviceId: params.deviceId);
    } on BaseException catch (_) {
      rethrow;
    } catch (err) {
      throw ClientException(message: err.toString());
    }
  }
}

class DeviceGetDeviceByIdUseCaseParams {
  final String deviceId;

  const DeviceGetDeviceByIdUseCaseParams({required this.deviceId});
}
