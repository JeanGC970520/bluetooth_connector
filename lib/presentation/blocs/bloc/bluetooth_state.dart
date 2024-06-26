part of 'bluetooth_bloc.dart';

class BluetoothState extends Equatable {
  const BluetoothState({
    this.blStatus = BluetoothStatus.initial,
    this.blAction = BluetoothActions.initial,
  });

  final BluetoothStatus blStatus;
  final BluetoothActions blAction;

  @override
  List<Object> get props => [
        blStatus,
        blAction,
      ];

  BluetoothState copyWith({
    BluetoothStatus? blStatus,
    BluetoothActions? blAction,
  }) {
    return BluetoothState(
      blStatus: blStatus ?? this.blStatus,
      blAction: blAction ?? this.blAction,
    );
  }
}
