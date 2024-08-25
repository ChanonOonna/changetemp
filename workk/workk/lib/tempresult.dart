import 'package:flutter/material.dart';
import 'TempService.dart'; // เพิ่มการ import TempService
import 'TEMPmodel.dart';

class TempResultPage extends StatelessWidget {
  final double temperature;
  final String unit;

  TempResultPage({required this.temperature, required this.unit});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TEMPmodel>(
      future: TempService.convertTemperature(temperature, unit),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: const Text('Temperature Conversion Results')),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Temperature Conversion Results')),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data?.tempdata == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Temperature Conversion Results')),
            body: Center(child: Text('No data available')),
          );
        }

        final tempdata = snapshot.data!.tempdata!;
        return Scaffold(
          appBar: AppBar(title: const Text('Temperature Conversion Results')),
          body: ListView(
            children: [
              ListTile(
                title: const Text('Celsius:'),
                subtitle: Text('${tempdata.celsius?.toStringAsFixed(2) ?? 'N/A'} °C'),
              ),
              ListTile(
                title: const Text('Fahrenheit:'),
                subtitle: Text('${tempdata.fahrenheit?.toStringAsFixed(2) ?? 'N/A'} °F'),
              ),
              ListTile(
                title: const Text('Réaumur:'),
                subtitle: Text('${tempdata.reaumur?.toStringAsFixed(2) ?? 'N/A'} °Ré'),
              ),
              ListTile(
                title: const Text('Kelvin:'),
                subtitle: Text('${tempdata.kelvin?.toStringAsFixed(2) ?? 'N/A'} K'),
              ),
            ],
          ),
        );
      },
    );
  }
}
