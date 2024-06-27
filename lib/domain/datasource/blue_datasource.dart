


import '../entities/blue_device.dart';

abstract class BlueDatasource<T> {

  late Stream<T> blueStatus;

  late Stream<BlueDevice?> scanResults; 

  Future<void> scan();

  Future<bool> connect(BlueDevice blDevice);

  Future<bool> disconnect(BlueDevice blDevice);

  Future<void> write(String text);

}