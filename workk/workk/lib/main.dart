import 'package:flutter/material.dart';
import 'tempresult.dart';
import 'TEMPservice.dart';
import 'TEMPmodel.dart';
import 'validate.dart'; // เพิ่มการ import validate.dart

void main() => runApp(TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TemperatureInputPage(),
    );
  }
}

class TemperatureInputPage extends StatefulWidget {
  @override
  _TemperatureInputPageState createState() => _TemperatureInputPageState();
}

class _TemperatureInputPageState extends State<TemperatureInputPage> {
  final _formKey = GlobalKey<FormState>();
  double _temperature = 0;
  String _unit = 'Celsius';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temperature Converter')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Temperature',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _temperature = double.tryParse(value) ?? 0; // ค่าที่ไม่ได้แปลงจะเป็น 0
                },
                validator: validateTemperature,
              ),
            ),
            Column(
              children: [
                RadioListTile<String>(
                  title: const Text('Celsius'),
                  value: 'Celsius',
                  groupValue: _unit,
                  onChanged: (value) {
                    setState(() {
                      _unit = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Fahrenheit'),
                  value: 'Fahrenheit',
                  groupValue: _unit,
                  onChanged: (value) {
                    setState(() {
                      _unit = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Réaumur'),
                  value: 'Réaumur',
                  groupValue: _unit,
                  onChanged: (value) {
                    setState(() {
                      _unit = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Kelvin'),
                  value: 'Kelvin',
                  groupValue: _unit,
                  onChanged: (value) {
                    setState(() {
                      _unit = value!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TempResultPage(
                        temperature: _temperature,
                        unit: _unit,
                      ),
                    ),
                  );
                }
              },
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
