import 'package:bluetooth_connector/domain/datasource/blue_datasource.dart';

import 'package:bluetooth_connector/logger.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

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

      try {

        scanResults = FlutterBluePlus.onScanResults.asyncMap(
          (result) {
            return null;
          },
        );
        
      } catch (e) {
        logger.e("Error on listen scaned devices");
      }

      final isScanning = FlutterBluePlus.isScanningNow;
      logger.d("Is scanning: $isScanning");
      if (!isScanning) {
        await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
      }

    } catch (e) {
      logger.e("Error on scan: $e");
    }


  }

}