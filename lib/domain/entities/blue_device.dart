

class BlueDevice {

  final String name;
  final String id;
  final String rssi;
  final int deviceClass; // https://domoticx.com/bluetooth-class-of-device-lijst-cod/ https://stackoverflow.com/questions/29513987/determine-type-of-connected-bluetooth-device-in-android

  BlueDevice({
    required this.name, 
    required this.id, 
    required this.rssi,
    required this.deviceClass,
  });

}