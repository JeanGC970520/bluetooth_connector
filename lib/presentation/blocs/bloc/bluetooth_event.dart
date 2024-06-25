part of 'bluetooth_bloc.dart';

sealed class BluetoothEvent extends Equatable {
  const BluetoothEvent();

  @override
  List<Object> get props => [];
}

class ScanEvent extends BluetoothEvent {}

class UpdateBlueStatusEvent extends BluetoothEvent {
  
  final BluetoothStatus status;

  const UpdateBlueStatusEvent(this.status);
  
}
