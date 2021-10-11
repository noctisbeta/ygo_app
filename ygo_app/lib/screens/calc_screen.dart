import 'package:flutter/material.dart';
// import 'entry_adding_page.dart';
// import 'package:uuid/uuid.dart';
// import 'lp_page.dart';
import '../widgets/my_drawer.dart';
// import 'small_world.dart';
import '../utility/tree.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  TextEditingController numDeck = TextEditingController();
  TextEditingController numHand = TextEditingController();

  List<Widget> wantedCards = [];
  List<UniqueKey> keys = [];
  List<List<TextEditingController>> ctrls = [];

  // final numDeckKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'Cards in deck',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  )),
                  Expanded(
                      child: TextFormField(
                    // key: numDeckKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.parse(value) < 40 ||
                          int.parse(value) > 60) {
                        return 'Invalid value';
                      }
                      return null;
                    },
                    controller: numDeck,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Number of cards',
                        focusColor: Theme.of(context).primaryColor,
                        border: const OutlineInputBorder()),
                  ))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'Hand size',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  )),
                  Expanded(
                      child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.parse(value) < 0 ||
                          int.parse(value) > int.parse(numDeck.text)) {
                        return 'Invalid value';
                      }
                      return null;
                    },
                    controller: numHand,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Number of cards',
                        focusColor: Theme.of(context).primaryColor,
                        border: const OutlineInputBorder()),
                  ))
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).accentColor,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: wantedCards.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(
                      decoration: BoxDecoration(
                        color: Colors.red[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Deleted',
                          style: TextStyle(
                            fontSize: 20,
                            // color: Colors.red[900],
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    key: keys[index],
                    // key: Key(Uuid().v1()),
                    onDismissed: (direction) {
                      setState(() {
                        wantedCards.removeAt(index);
                        keys.removeAt(index);
                        ctrls.removeAt(index);
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //       duration: const Duration(seconds: 1),
                      //       shape: const StadiumBorder(),
                      //       behavior: SnackBarBehavior.floating,
                      //       content: Text('$item dismissed')),
                      // );
                    },
                    child: wantedCards[index],
                  );
                },
              ),
            ),
            Divider(
              color: Theme.of(context).accentColor,
            ),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Ink(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).accentColor, width: 4.0),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      focusColor: Colors.red,
                      splashColor: Theme.of(context).accentColor,
                      highlightColor: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(1000.0),
                      onTap: () {
                        setState(() {
                          wantedCards.removeLast();
                          keys.removeLast();
                          ctrls.removeLast();
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Ink(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).accentColor, width: 4.0),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      focusColor: Colors.red,
                      splashColor: Theme.of(context).accentColor,
                      highlightColor: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(1000.0),
                      onTap: () => showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Results'),
                                content: getResults(),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('OK'))
                                ],
                              )),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.calculate_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Ink(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).accentColor, width: 4.0),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      splashColor: Theme.of(context).accentColor,
                      highlightColor: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(1000.0),
                      onTap: () {
                        setState(() {
                          final TextEditingController name =
                              TextEditingController();
                          final TextEditingController inDeck =
                              TextEditingController();
                          final TextEditingController minWant =
                              TextEditingController();
                          final TextEditingController maxWant =
                              TextEditingController();
                          wantedCards
                              .add(cardEntry(name, inDeck, minWant, maxWant));
                          keys.add(UniqueKey());
                          ctrls.add([name, inDeck, minWant, maxWant]);
                        });
                      },
                      // () async {
                      //   final entryDetails = await Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => EntryAddingPage()));
                      // },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   // ignore: prefer_const_literals_to_create_immutables
      //   onTap: _onItemTapped,
      //   selectedItemColor: Colors.grey,
      //   items: [
      //     const BottomNavigationBarItem(
      //         icon: Icon(Icons.remove), label: 'Remove'),
      //     const BottomNavigationBarItem(
      //         icon: Icon(Icons.calculate_outlined), label: 'Calculate'),
      //     const BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
      //   ],
      // ),
    );
  }

  Widget getResults() {
    if (wantedCards.length > int.parse(numHand.text)) {
      return const Text('Too many wanted cards');
    }
    int counter = 0;
    for (int i = 0; i < wantedCards.length; i++) {
      counter += int.parse(ctrls[i][3].text);
    }
    if (counter > int.parse(numHand.text)) {
      return const Text('Too many wanted cards');
    }

    counter = 0;
    // int loops = 1;
    final List<int> counters = [];
    final List<int> inDecks = [];
    final List<int> inHands = [];
    for (int i = 0; i < wantedCards.length; i++) {
      counter = int.parse(ctrls[i][3].text) - int.parse(ctrls[i][2].text) + 1;
      // loops *= counter;
      counters.add(counter);
      inDecks.add(int.parse(ctrls[i][1].text));
      inHands.add(int.parse(ctrls[i][1].text));

      counter = 0;
    }

    final Tree resultTree = Tree(
      inDecks: inDecks,
      numDeck: int.parse(numDeck.text),
      numHand: int.parse(numHand.text),
    );

    resultTree.makeTree(wantedCards: wantedCards, ctrls: ctrls);
    final double result = resultTree.calculate() /
        choose(int.parse(numDeck.text), int.parse(numHand.text));
    return Text(
      'The probability is ${(result * 100).toStringAsFixed(2)}%.',
    );
    // return const Text('1');

    // double result = 0;
    // double result2 = 0;
    // for (int i = 0; i < wantedCards.length; i++) {
    //   if (i > 0) {
    //     result2 = 0;
    //     for (int j = 0; j < counters[i]; j++) {
    //       result2 += choose(inDecks[i], int.parse(ctrls[i][2].text) + j) *
    //           choose(int.parse(numDeck.text) - inDecks[i],
    //               int.parse(numHand.text) - int.parse(ctrls[i][2].text) - j);
    //     }
    //     result *= result2;
    //   } else {
    //     for (int j = 0; j < counters[i]; j++) {
    //       result += choose(inDecks[i], int.parse(ctrls[i][2].text) + j) *
    //           choose(int.parse(numDeck.text) - inDecks[i],
    //               int.parse(numHand.text) - int.parse(ctrls[i][2].text) - j);
    //     }
    //   }
    // }

    // int temp = 1;
    // for (int i = 0; i < wantedCards.length; i++) {
    //   for (int j = 0; j < counters[i]; j++) {
    //     // temp *= int.parse(ctrls[i][2].text) * rec(counters, temp);
    //   }
    // }

    // result /= choose(int.parse(numDeck.text), int.parse(numHand.text));
    // return Text(result.toString());
  }

  // int rec(List<int> counters, int result, int i) {
  //   if (i < wantedCards.length - 1) {
  //     rec(i + 1);
  //   } else if (i == wantedCards.length - 1) {
  //     for (int j = int.parse(ctrls[i][2].text);
  //         j <= int.parse(ctrls[i][3].text);
  //         j++) {}
  //   }
  //   int temp = 1;
  //   for (int i = 0; i < counters.length; i++) {
  //     temp *= choose().toInt();
  //   }
  //   result += temp;
  //   return 1;
  // }

  int pmf(List<int> K, List<int> k) {
    int temp = 1;
    for (int i = 0; i < K.length; i++) {
      temp *= choose(K[i], k[i]).toInt();
    }
    return temp;
  }

  BigInt choose(int n, int k) {
    return fac(n) ~/ (fac(k) * fac(n - k));
  }

  BigInt fac(int n) {
    BigInt temp = BigInt.one;
    for (BigInt i = BigInt.one; i <= BigInt.from(n); i += BigInt.one) {
      temp *= i;
    }
    return temp;
  }

  Widget cardEntry(TextEditingController name, TextEditingController inDeck,
      TextEditingController minWant, TextEditingController maxWant) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 54),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextFormField(
                controller: name,
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextFormField(
                controller: inDeck,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "In deck",
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextFormField(
                controller: minWant,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Min",
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextFormField(
                controller: maxWant,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Max",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
