import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluetooth_connector/logger.dart';

part 'bluetooth_event.dart';
part 'bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  BluetoothBloc() : super(const BluetoothState()) {
    on<ScanEvent>(_mapScanEventToState);
  }

  Future<void> _mapScanEventToState(
    ScanEvent _, Emitter<BluetoothState> emit,
  ) async {
    logger.i("Starting to scan devices");
    emit(
      state.copyWith(
        blAction: BluetoothAction.scanning,
      ),
    );

    await Future.delayed(const Duration(seconds: 10));

    emit(
      state.copyWith(
        blAction: BluetoothAction.scanned,
      ),
    );

    logger.i("End of scan devices");
  }
}
