
import 'package:bluetooth_connector/domain/datasource/blue_datasource.dart';
import 'package:bluetooth_connector/domain/entities/blue_device.dart';
import 'package:bluetooth_connector/domain/repositories/blue_repository.dart';

class BlueRepositoryImpl extends BlueRepository {

  final BlueDatasource datasource;

  BlueRepositoryImpl(this.datasource);

  @override
  Future<bool> connect() {
    return datasource.connect();
  }

  @override
  Future<bool> disconnect() {
    return datasource.disconnect();
  }

  @override
  Future<void> scan() {
    return datasource.scan();
  }

  @override
  Stream get blueStatus => datasource.blueStatus;

  @override
  Stream<List<BlueDevice>?> get scanResults => datasource.scanResults;
  
}