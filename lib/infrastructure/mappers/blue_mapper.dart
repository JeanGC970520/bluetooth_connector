

// import 'package:bluetooth_connector/logger.dart';
import 'package:bluetooth_connector/domain/entities/blue_device.dart';
import 'package:bluetooth_connector/infrastructure/models/scan_result_blue_plus.dart';

class BlueMapper {

  static BlueDevice scanResultToEntity( ScanResultBluePlusModel model ) {
    // logger.d("service uuid: ${model.serviceUuids}");
    final serviceUuids = model.serviceUuids!.isEmpty ? null : model.serviceUuids?.first;
    return BlueDevice(
      name: model.name,
      id: model.id,
      rssi: model.rssi?.toString(),
      deviceClass: int.parse(serviceUuids ?? '0', radix: 16),
    );
  }

}