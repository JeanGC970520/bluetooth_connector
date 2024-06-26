import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:bluetooth_connector/logger.dart';
import 'package:bluetooth_connector/domain/datasource/blue_datasource.dart';
import 'package:bluetooth_connector/infrastructure/mappers/blue_mapper.dart';
import 'package:bluetooth_connector/infrastructure/models/scan_result_blue_plus.dart';

class BluePlusDatasource extends BlueDatasource {

  @override
  Future<bool> connect() {
    throw UnimplementedError();
  }

  @override
  Future<bool> disconnect() {
    throw UnimplementedError();
  }

  @override
  Future<void> scan() async {

    try {

      mapStreamScanResults();

      final isScanning = FlutterBluePlus.isScanningNow;
      logger.d("Is scanning: $isScanning");
      if (!isScanning) {
        await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
      }

    } catch (e) {
      logger.e("Error on scan: $e");
    }

  }

  void mapStreamScanResults() {
    try {

      scanResults = FlutterBluePlus.onScanResults.asyncMap(
        (result) {
          if (result.isEmpty || result.last.device.advName.isEmpty) return null;

          final model  = ScanResultBluePlusModel.fromResult(result.last);

          final blueDevice = BlueMapper.scanResultToEntity(model);
      
          return blueDevice;
        },
      );
      
    } catch (e) {
      logger.e("Error on listen scaned devices: $e");
    }
  }

}