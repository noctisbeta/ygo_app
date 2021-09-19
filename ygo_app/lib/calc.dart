import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({Key? key}) : super(key: key);

  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  int inDeck = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Calculator'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Cards in deck',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print('aaaaaa');
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: Text('a'),
                                content: Text('b'),
                              ));
                    },
                    child: InputDecorator(
                      child: Text('a'),
                      decoration: InputDecoration(
                          labelText: 'a', border: OutlineInputBorder()),
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Cards in deck',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  )),
                  // Expanded(
                  //     child: NumberPicker(
                  //   value: inDeck,
                  //   minValue: 0,
                  //   maxValue: 60,
                  //   onChanged: (value) => setState(() => {inDeck = value}),
                  // ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
