


import '../entities/blue_device.dart';

abstract class BlueDatasource<T> {

  late Stream<T> blueStatus;

  late Stream<List<BlueDevice>?> scanResults; 

  Future<void> scan();

  Future<bool> connect();

  Future<bool> disconnect();

}