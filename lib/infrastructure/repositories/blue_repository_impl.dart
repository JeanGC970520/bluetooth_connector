
import 'package:bluetooth_connector/domain/datasource/blue_datasource.dart';
import 'package:bluetooth_connector/domain/entities/blue_device.dart';
import 'package:bluetooth_connector/domain/repositories/blue_repository.dart';

class BlueRepositoryImpl extends BlueRepository {

  final BlueDatasource datasource;

  BlueRepositoryImpl(this.datasource);

  @override
  Future<bool> connect( BlueDevice blDevice) {
    return datasource.connect(blDevice);
  }

  @override
  Future<bool> disconnect( BlueDevice blDevice) {
    return datasource.disconnect(blDevice);
  }

  @override
  Future<void> scan() {
    return datasource.scan();
  }

  @override
  Stream get blueStatus => datasource.blueStatus;

  @override
  Stream<BlueDevice?> get scanResults => datasource.scanResults;
  
  @override
  Future<void> write(String text) {
    return datasource.write(text);
  }
  
}