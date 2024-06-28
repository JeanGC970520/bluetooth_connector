


enum BluetoothActions {
  initial,
  scanning,
  scanned,
  connecting,
  connected;

  bool get isInitial => this == BluetoothActions.initial;
  bool get isScanning => this == BluetoothActions.scanning;
  bool get isScanned => this == BluetoothActions.scanned;
  bool get isConnecting => this == BluetoothActions.connecting;
  bool get isConnected => this == BluetoothActions.connected;
}