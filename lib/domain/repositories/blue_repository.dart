

import '../entities/blue_device.dart';

abstract class BlueRepository<T> {

  late Stream<T> blueStatus;

  late Stream<BlueDevice?> scanResults; 

  Future<void> scan();

  Future<bool> connect();

  Future<bool> disconnect();

}