import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'bluetooth_device_list.dart';

class BluetoothApp extends StatefulWidget {
  @override
  _BluetoothAppState createState() => _BluetoothAppState();
}

class _BluetoothAppState extends State<BluetoothApp> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> devices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            scanDevices();
          },
          child: Text('Scan for Devices'),
        ),
      ),
    );
  }

  void scanDevices() {
  flutterBlue.startScan(timeout: Duration(seconds: 4));

  flutterBlue.scanResults.listen((results) {
    setState(() {
      devices = results;
    });

    if (devices.isNotEmpty) {
      // Navigate to the device list screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DeviceListScreen(
            devices: devices,
            onDeviceSelected: connectToDevice,
          ),
        ),
      );
       flutterBlue.stopScan();
    }
  });

 
}
void connectToDevice(ScanResult selectedDevice) async {
  print('Connecting to ${selectedDevice.device.name}');

  try {
    // Connect to the selected device
    await selectedDevice.device.connect();

    // Discover services and characteristics
    List<BluetoothService> services = await selectedDevice.device.discoverServices();

    // Declare characteristic with the late modifier
    late BluetoothCharacteristic characteristic;

    // Find the characteristic you want to interact with
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic c in service.characteristics) {
        if (c.uuid.toString() == 'your_characteristic_uuid') {
          characteristic = c;
          break;
        }
      }
    }

    // You can now use the 'characteristic' to send/receive data

    // For example, reading data:
    List<int> data = await characteristic.read();
    print('Read data: ${String.fromCharCodes(data)}');

    // For example, writing data:
    String message = 'Hello, Raspberry Pi!';
    await characteristic.write(message.codeUnits);

    // Close the connection when done
    await selectedDevice.device.disconnect();
  } catch (e) {
    print('Error connecting to device: $e');
  }
}



}


// class BluetoothApp extends StatefulWidget {
//   @override
//   _BluetoothAppState createState() => _BluetoothAppState();
// }

// class _BluetoothAppState extends State<BluetoothApp> {
//   FlutterBlue flutterBlue = FlutterBlue.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bluetooth App'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             scanDevices();
//           },
//           child: Text('Scan for Devices'),
//         ),
//       ),
//     );
//   }

//   void scanDevices() {
//     flutterBlue.startScan(timeout: Duration(seconds: 4));

//     flutterBlue.scanResults.listen((results) {
//       // Do something with scan results
//       for (ScanResult result in results) {
//         print('Device found: ${result.device.name}');
//       }
//     });

//     flutterBlue.stopScan();
//   }
// }