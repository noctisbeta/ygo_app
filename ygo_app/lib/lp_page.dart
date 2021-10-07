import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ygo_app/my_drawer.dart';

class LifePage extends StatefulWidget {
  const LifePage({Key? key}) : super(key: key);

  @override
  _LifePageState createState() => _LifePageState();
}

class _LifePageState extends State<LifePage> {
  TextEditingController leftCtl = TextEditingController();
  TextEditingController rightCtl = TextEditingController();
  TextEditingController lpCtl = TextEditingController();
  TextEditingController diceCtl = TextEditingController();
  TextEditingController coinCtl = TextEditingController();

  bool add = false;
  bool? selected;
  bool lpDisabled = true;
  bool showDice = false;
  bool showCoin = false;

  Color lpColor = Colors.red[200]!;
  Color lpColorHigh = Colors.red;
  Color selectedColorL = Colors.black;
  Color selectedColorR = Colors.black;

  List<Widget> logList = [];

  List eventLog = [];

  @override
  void initState() {
    leftCtl.text = '8000';
    rightCtl.text = '8000';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Life Points'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  AbsorbPointer(
                    absorbing: lpDisabled,
                    child: InkWell(
                      splashColor: lpColor,
                      highlightColor: lpColorHigh,
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {
                        setState(() {
                          if (lpCtl.text == '' || selected == null) {
                            return;
                          }
                          int temp;
                          String sign;
                          if (add) {
                            sign = '+';
                            temp =
                                int.parse(leftCtl.text) + int.parse(lpCtl.text);
                          } else {
                            sign = '-';
                            temp =
                                int.parse(leftCtl.text) - int.parse(lpCtl.text);
                          }
                          logList.add(Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                sign + lpCtl.text,
                                style: TextStyle(color: lpColorHigh),
                              ),
                            ),
                          ));
                          if (temp < 0) {
                            temp = 0;
                          }
                          leftCtl.text = temp.toString();
                          lpCtl.text = '';
                          lpDisabled = true;
                          selected = null;
                          selectedColorL = Colors.black;
                          selectedColorR = Colors.black;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          leftCtl.text,
                          style: const TextStyle(
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  AbsorbPointer(
                    absorbing: lpDisabled,
                    child: InkWell(
                      splashColor: lpColor,
                      highlightColor: lpColorHigh,
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {
                        setState(() {
                          if (lpCtl.text == '' || selected == null) {
                            return;
                          }
                          int temp;
                          String sign;
                          if (add) {
                            sign = '+';
                            temp = int.parse(rightCtl.text) +
                                int.parse(lpCtl.text);
                          } else {
                            sign = '-';
                            temp = int.parse(rightCtl.text) -
                                int.parse(lpCtl.text);
                          }
                          logList.add(Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                sign + lpCtl.text,
                                style: TextStyle(
                                  color: lpColorHigh,
                                ),
                              ),
                            ),
                          ));
                          if (temp < 0) {
                            temp = 0;
                          }
                          rightCtl.text = temp.toString();
                          lpCtl.text = '';
                          lpDisabled = true;
                          selected = null;
                          selectedColorL = Colors.black;
                          selectedColorR = Colors.black;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          rightCtl.text,
                          style: const TextStyle(
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  Visibility(
                    visible: showDice,
                    child: Text(
                      diceCtl.text,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: showCoin,
                    child: Text(
                      coinCtl.text,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 4.0),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        splashColor: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(500),
                        onTap: () {
                          showDice = true;
                          final rng = Random();
                          final int diceNum = rng.nextInt(6) + 1;
                          setState(() {
                            diceCtl.text = diceNum.toString();
                            logList.add(Center(
                              child: Text(
                                'Dice roll: ${diceCtl.text}',
                              ),
                            ));

                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {
                                showDice = false;
                              });
                            });
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.casino_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 4.0),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        splashColor: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(500),
                        onTap: () {
                          final rng = Random();
                          final int coinNum = rng.nextInt(2) + 1;
                          String result = '';
                          setState(() {
                            showCoin = true;
                            coinCtl.text = coinNum % 2 == 0 ? 'Heads' : 'Tails';
                            if (coinNum % 2 == 0) {
                              result = 'Heads';
                              logList.add(
                                Center(
                                  child: Text(result),
                                ),
                              );
                            } else {
                              result = 'Tails';
                              logList.add(
                                Center(
                                  child: Text(result),
                                ),
                              );
                            }
                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {
                                showCoin = false;
                              });
                            });
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.stars_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 4.0),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        splashColor: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(500),
                        onTap: () {
                          setState(() {
                            add = false;
                            lpColor = Colors.red[200]!;
                            lpColorHigh = Colors.red;
                            selectedColorL = Colors.blue;
                            selectedColorR = Colors.black;
                            selected = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.remove,
                            color: selectedColorL,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        onChanged: (value) {
                          if (value == '') {
                            lpDisabled = true;
                          } else {
                            lpDisabled = false;
                          }
                        },
                        controller: lpCtl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'LP Amount',
                          focusColor: Theme.of(context).primaryColor,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 4.0),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        splashColor: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(500),
                        onTap: () {
                          setState(() {
                            add = true;
                            lpColor = Colors.green[200]!;
                            lpColorHigh = Colors.green;
                            selectedColorR = Colors.blue;
                            selectedColorL = Colors.black;
                            selected = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.add,
                            color: selectedColorR,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Divider(
                color: Theme.of(context).accentColor,
              ),
              Flexible(
                flex: 2,
                child: GestureDetector(
                  onHorizontalDragEnd: (e) {
                    print('a');
                  },
                  child: ListView.builder(
                    itemCount: logList.length,
                    itemBuilder: (context, index) {
                      return logList[index];
                    },
                  ),
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
              ),
            ],
          )),
    );
  }
}
