import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerScreen extends StatefulWidget {
  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  Color currentColor = Colors.limeAccent;

  void changeColor(Color color) {
    setState(() => currentColor = color);
    // Enviar color al LED RGB
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorPicker(
              pickerColor: currentColor,
              onColorChanged: changeColor,
            ),
            ElevatedButton(
              onPressed: () {
                // Enviar color al LED RGB
              },
              child: Text('Set LED Color'),
            ),
          ],
        ),
      ),
    );
  }
}
