import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluetooth_connector/logger.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

part 'bluetooth_event.dart';
part 'bluetooth_state.dart';

const Map<BluetoothAdapterState, BluetoothStatus> blueStatusMapper = {
  BluetoothAdapterState.off : BluetoothStatus.off,
  BluetoothAdapterState.on : BluetoothStatus.on,
};

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {

  late StreamSubscription<BluetoothAdapterState> blueSubscription;

  BluetoothBloc() : super(const BluetoothState()) {
    blueSubscription = FlutterBluePlus.adapterState.listen(_listenBlueState);
    on<ScanEvent>(_mapScanEventToState);
    on<UpdateBlueStatusEvent>(_mapUpdateBlueStatusEventToState);
  }

  @override
  Future<void> close() {
    blueSubscription.cancel();
    return super.close();
  }

  void _listenBlueState(BluetoothAdapterState state){
    logger.i("Bluetooth state: $state");
    final BluetoothStatus status = blueStatusMapper.containsKey(state) 
      ? blueStatusMapper[state]! 
      : BluetoothStatus.off;
    add(UpdateBlueStatusEvent(status));
  }

  Future<void> _mapScanEventToState(
    ScanEvent _, Emitter<BluetoothState> emit,
  ) async {
    // TODO: Order it and check if is necessary use a Datasource and Repository to abstract bluetooth manager
    logger.i("Starting to scan devices");
    logger.d("${await Permission.bluetoothScan.status}");
    logger.d("${await Permission.location.status}");
    logger.d("${await Permission.notification.status}");
    emit(
      state.copyWith(
        blAction: BluetoothAction.scanning,
      ),
    );
    
    FlutterBluePlus.scanResults.listen((result) {
      if (result.isNotEmpty) {
        ScanResult r = result.last;
        if( r.device.advName.isNotEmpty ) {
          logger.d("RemoteID: ${r.device.remoteId} - name: ${r.device.advName} ; ${r.advertisementData}");
        }
      }
    },
    onError: (e) => logger.e(e));

    try {
      final isScanning = FlutterBluePlus.isScanningNow;
      logger.d("Is scanning: $isScanning");
      if (!isScanning) {
        await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
      }
    } catch (e) {
      logger.e("Error on scan: $e");
    }
    
    // await FlutterBluePlus.stopScan();
    await Future.delayed(const Duration(seconds: 10));

    emit(
      state.copyWith(
        blAction: BluetoothAction.scanned,
      ),
    );

    logger.i("End of scan devices");
  }

  void _mapUpdateBlueStatusEventToState(
    UpdateBlueStatusEvent event, Emitter<BluetoothState> emit,
  ) {
    emit(
      state.copyWith(blStatus: event.status)
    );
  }

}
