import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:bluetooth_connector/logger.dart';
import 'package:bluetooth_connector/domain/entities/blue_device.dart';
import 'package:bluetooth_connector/domain/datasource/blue_datasource.dart';
import 'package:bluetooth_connector/infrastructure/mappers/blue_mapper.dart';
import 'package:bluetooth_connector/infrastructure/models/scan_result_blue_plus.dart';

class BluePlusDatasource extends BlueDatasource {

  late BluetoothCharacteristic charToWrite;

  @override
  Future<bool> connect( BlueDevice blDevice ) async {
    final device = FlutterBluePlus.lastScanResults.firstWhere((element) {
      return element.device.remoteId.toString() == blDevice.id;
    },).device;
    try {

      if(FlutterBluePlus.isScanningNow) await FlutterBluePlus.stopScan();
      
      await device.connect();
      final services = await device.discoverServices();
      // for (var service in services) {
      //     final charcateriscs = service.characteristics;
      //     for (var char in charcateriscs) {
      //       logger.d("c: $char");
      //       if(char.properties.write) {
      //         // char.write(utf8.encode('Hello, world!'));
      //       }
      //     }
      //   }
      // final c = BluetoothCharacteristic(
      //   remoteId: device.remoteId, 
      //   serviceUuid: Guid('6e400001-b5a3-f393-e0a9-e50e24dcca9e'), 
      //   characteristicUuid: Guid('6e400002-b5a3-f393-e0a9-e50e24dcca9e'),
      // );
      // c.write(utf8.encode('Hello, world!'));
      // * Registering characteristic with write in true
      for (var service in services) {
        final charcateriscs = service.characteristics;
        for (var char in charcateriscs) {
          // logger.d("c: $char");
          if(char.properties.write) {
            charToWrite  = BluetoothCharacteristic(
              remoteId: device.remoteId, 
              serviceUuid: char.serviceUuid, 
              characteristicUuid: char.characteristicUuid,
            );
          }
        }
      }
      // await charToWrite.write(utf8.encode('Hello, world from Flutter app!'));
      
      return true;
    } catch (e) {
      logger.e("Error while connecting: $e");
      return false;
    }
  }

  @override
  Future<bool> disconnect( BlueDevice blDevice) async {
    final device = FlutterBluePlus.lastScanResults.firstWhere((element) {
      return element.device.remoteId.toString() == blDevice.id;
    },).device;
    try {
      await device.disconnect();
      return true;
    } catch (e) {
      logger.e("Error while disconnecting : $e");
      return false;
    }
  }

  @override
  Future<void> scan() async {

    try {

      mapStreamScanResults();

      final isScanning = FlutterBluePlus.isScanningNow;
      // logger.d("Is scanning: $isScanning");
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
          // logger.d("Crude device: ${result.last.advertisementData} -- ${result.last.device}");

          final model  = ScanResultBluePlusModel.fromResult(result.last);

          final blueDevice = BlueMapper.scanResultToEntity(model);
      
          return blueDevice;
        },
      );
      
    } catch (e) {
      logger.e("Error on listen scaned devices: $e");
    }
  }
  
  @override
  Future<void> write(String text) async {
    await charToWrite.write(utf8.encode(text));
  }

}