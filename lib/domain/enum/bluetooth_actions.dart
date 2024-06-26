


enum BluetoothActions {
  initial,
  scanning,
  scanned;

  bool get isInitial => this == BluetoothActions.initial;
  bool get isScanning => this == BluetoothActions.scanning;
  bool get isScanned => this == BluetoothActions.scanned;
}