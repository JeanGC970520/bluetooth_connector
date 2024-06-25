part of 'bluetooth_bloc.dart';

enum BluetoothAction {
  initial,
  scanning,
  scanned;

  bool get isInitial => this == BluetoothAction.initial;
  bool get isScanning => this == BluetoothAction.scanning;
  bool get isScanned => this == BluetoothAction.scanned;
}

enum BluetoothStatus {
  initial,
  off,
  on,
}

class BluetoothState extends Equatable {
  const BluetoothState({
    this.blStatus = BluetoothStatus.initial,
    this.blAction = BluetoothAction.initial,
  });

  final BluetoothStatus blStatus;
  final BluetoothAction blAction;
  
  @override
  List<Object> get props => [ blStatus, blAction, ];

  BluetoothState copyWith({
    BluetoothStatus? blStatus,
    BluetoothAction? blAction,
  }) {
    return BluetoothState(
      blStatus: blStatus ?? this.blStatus,
      blAction: blAction ?? this.blAction,
    );
  }

} 