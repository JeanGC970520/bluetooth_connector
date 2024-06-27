import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:bluetooth_connector/logger.dart';
import 'package:bluetooth_connector/domain/entities/blue_device.dart';
import 'package:bluetooth_connector/domain/enum/bluetooth_status.dart';
import 'package:bluetooth_connector/domain/enum/bluetooth_actions.dart';
import 'package:bluetooth_connector/domain/repositories/blue_repository.dart';

part 'bluetooth_event.dart';
part 'bluetooth_state.dart';

const Map<BluetoothAdapterState, BluetoothStatus> blueStatusMapper = {
  BluetoothAdapterState.off : BluetoothStatus.off,
  BluetoothAdapterState.on : BluetoothStatus.on,
};

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {

  late StreamSubscription<BluetoothAdapterState> blueSubscription;

  final BlueRepository repo;

  BluetoothBloc(this.repo) : super(const BluetoothState()) {
    blueSubscription = FlutterBluePlus.adapterState.listen(_listenBlueState);
    on<ScanEvent>(_mapScanEventToState);
    on<UpdateBlueStatusEvent>(_mapUpdateBlueStatusEventToState);
    on<AddScanedDeviceEvent>(_mapAddScanedDeviceEventToState);
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

  void _listenScanDevices(BlueDevice? device) {
    if( device == null ) return;
    add(AddScanedDeviceEvent(device));
  }

  Future<void> _mapScanEventToState(
    ScanEvent _, Emitter<BluetoothState> emit,
  ) async {
    logger.i("Starting to scan devices");
    logger.d("${await Permission.bluetoothScan.status}");
    logger.d("${await Permission.location.status}");
    logger.d("${await Permission.notification.status}");
    emit(
      state.copyWith(
        blAction: BluetoothActions.scanning,
        devices: List.empty(),
      ),
    );
    
    await repo.scan();
    repo.scanResults.listen(_listenScanDevices);
    
    // await FlutterBluePlus.stopScan();
    await Future.delayed(const Duration(seconds: 10));

    repo.scanResults.drain(); // TODO: Verify if its necessary

    emit(
      state.copyWith(
        blAction: BluetoothActions.scanned,
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

  void _mapAddScanedDeviceEventToState(
    AddScanedDeviceEvent event, Emitter<BluetoothState> emit,
  ) {

    // logger.i("Devices Scanned: ${event.device}");
    for (var element in state.devices) {
      if(element.id == event.device.id) return;
    }

    emit(
      state.copyWith(devices: [...state.devices, event.device])
    );

  }

}
