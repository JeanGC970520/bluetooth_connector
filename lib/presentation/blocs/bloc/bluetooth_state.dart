part of 'bluetooth_bloc.dart';

class BluetoothState extends Equatable {
  const BluetoothState({
    this.blStatus = BluetoothStatus.initial,
    this.blAction = BluetoothActions.initial,
    this.devices = const <BlueDevice>[],
    this.deviceConnected = const BlueDevice.unknown(),
  });

  final BluetoothStatus blStatus;
  final BluetoothActions blAction;
  final List<BlueDevice> devices;
  final BlueDevice deviceConnected;

  @override
  List<Object> get props => [
    blStatus,
    blAction,
    devices,
    deviceConnected,
  ];

  BluetoothState copyWith({
    BluetoothStatus? blStatus,
    BluetoothActions? blAction,
    List<BlueDevice>? devices,
    BlueDevice? deviceConnected,
  }) {
    return BluetoothState(
      blStatus: blStatus ?? this.blStatus,
      blAction: blAction ?? this.blAction,
      devices: devices ?? this.devices,
      deviceConnected: deviceConnected ?? this.deviceConnected,
    );
  }
}
