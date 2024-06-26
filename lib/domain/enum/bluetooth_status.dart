

enum BluetoothStatus {
  initial,
  off,
  on;

  bool get isInitial => this == BluetoothStatus.initial;
  bool get isOff => this == BluetoothStatus.off;
  bool get isOn => this == BluetoothStatus.on;

}