part of 'bluetooth_bloc.dart';

class BluetoothState extends Equatable {
  const BluetoothState({
    this.blStatus = BluetoothStatus.initial,
    this.blAction = BluetoothActions.initial,
    this.devices = const <BlueDevice>[],
  });

  final BluetoothStatus blStatus;
  final BluetoothActions blAction;
  final List<BlueDevice> devices;

  @override
  List<Object> get props => [
        blStatus,
        blAction,
        devices,
      ];

  BluetoothState copyWith({
    BluetoothStatus? blStatus,
    BluetoothActions? blAction,
    List<BlueDevice>? devices,
  }) {
    return BluetoothState(
      blStatus: blStatus ?? this.blStatus,
      blAction: blAction ?? this.blAction,
      devices: devices ?? this.devices,
    );
  }
}
