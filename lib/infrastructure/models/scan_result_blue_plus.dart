

import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ScanResultBluePlusModel {

  final String name;
  final String id;
  final int? txPower;
  final bool? connectable;
  final List<String?>? serviceUuids;
  final int? rssi;
  final int? appearance;

  ScanResultBluePlusModel({
    required this.name, 
    required this.id, 
    required this.txPower, 
    required this.connectable, 
    required this.serviceUuids,
    required this.rssi,
    required this.appearance,
  });

  factory ScanResultBluePlusModel.fromResult( ScanResult res ) {
    return ScanResultBluePlusModel(
      name: res.device.advName,
      id: res.device.remoteId.toString(),
      txPower: res.advertisementData.txPowerLevel,
      connectable: res.advertisementData.connectable,
      serviceUuids: res.advertisementData.serviceUuids.map((e) => e.toString(),).toList(), 
      rssi: res.rssi,
      appearance: res.advertisementData.appearance,
    );
  }

  factory ScanResultBluePlusModel.fromMap( Map<String, dynamic> json ) {
    return ScanResultBluePlusModel(
      name: json['name'],
      id: json['id'],
      txPower: json['txPower'],
      connectable: json['connectable'],
      serviceUuids: json['serviceUuids'], 
      rssi: json['rssi'],
      appearance: json['appearance']
    );
  }

  factory ScanResultBluePlusModel.fromJson(String str) => ScanResultBluePlusModel.fromMap(json.decode(str));

  Map<String, dynamic> toMap() => {
    'name' : name,
    'id' : id,
    'txPower' : txPower,
    'connectable' : connectable,
    'serviceUuids' : serviceUuids,
    'rssi' : rssi,
    'appearance' : appearance
  };

  String toJson() => json.encode(toMap());

}