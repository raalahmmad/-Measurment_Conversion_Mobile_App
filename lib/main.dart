import 'package:flutter/material.dart';

import './util/convert_util.dart';

main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  double _numberFrom;
  String _startMeasure;
  String _convertedMeasure;
  double _conversionResult;
  String _resultMessage;
  Conversion conversion;

  @override
  void initState() {
    _numberFrom = 0;
    conversion = Conversion();

    super.initState();
  }

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  final TextStyle inputStyle = TextStyle(fontSize: 20, color: Colors.blue[900]);
  final TextStyle lableStyle = TextStyle(fontSize: 24, color: Colors.grey[700]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Measures Converter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Measures Converter'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 400,
              child: Center(
                  child: Column(
                children: <Widget>[
                  Spacer(),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Please insert the measure to be converted'),
                    onChanged: (text) {
                      var rv = double.tryParse(text);
                      if (rv != null) {
                        setState(() {
                          _numberFrom = rv;
                        });
                      }
                    },
                    style: inputStyle,
                  ),
                  Spacer(),
                  Text(
                    'From',
                    style: lableStyle,
                  ),
                  DropdownButton(
                    items: _measures
                        .map((String value) => DropdownMenuItem<String>(
                              child: Text(value),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => _startMeasure = value),
                    value: _startMeasure,
                  ),
                  Spacer(),
                  Text(
                    'To',
                    style: lableStyle,
                  ),
                  DropdownButton(
                    items: _measures
                        .map(
                          (String value) => DropdownMenuItem<String>(
                              child: Text(value), value: value),
                        )
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _convertedMeasure = value),
                    value: _convertedMeasure,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  RaisedButton(
                    child: Text('Convert', style: inputStyle),
                    onPressed: () {
                      if (_startMeasure.isEmpty ||
                          _convertedMeasure.isEmpty ||
                          _numberFrom == 0) {
                        return;
                      } else {
                        _conversionResult = conversion.convert(
                            _numberFrom, _startMeasure, _convertedMeasure);
                        if (_conversionResult == 0) {
                          _resultMessage =
                              'This conversion cannot be performed';
                        } else {
                          _resultMessage =
                              '${_numberFrom.toString()} $_startMeasure are ${_conversionResult.toString()} $_convertedMeasure';
                        }

                        setState(() {});
                      }
                    },
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text((_conversionResult == null) ? '' : _resultMessage,
                      style: lableStyle),
                  Spacer(
                    flex: 8,
                  ),
                ],
              )),
            ),
          ),
        ));
  }
}
