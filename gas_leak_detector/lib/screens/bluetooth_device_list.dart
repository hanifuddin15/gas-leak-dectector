import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DeviceListScreen extends StatelessWidget {
  final List<ScanResult> devices;
  final Function(ScanResult) onDeviceSelected;

  DeviceListScreen({required this.devices, required this.onDeviceSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Devices'),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(devices[index].device.name ?? 'Unknown Device'),
            onTap: () {
              onDeviceSelected(devices[index]);
            },
          );
        },
      ),
    );
  }
}
