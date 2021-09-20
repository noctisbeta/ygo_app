import 'package:flutter/material.dart';
// import 'entry_adding_page.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({Key? key}) : super(key: key);

  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  int numDeck = 0;

  List<Widget> wantedCards = [];

  // @override
  // void initState() {
  //   super.initState();
  //   wantedCards = [cardEntry()];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      drawer: Container(
        width: 100,
        child: Drawer(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).accentColor, width: 4.0),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  focusColor: Colors.red,
                  splashColor: Theme.of(context).accentColor,
                  highlightColor: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.dark_mode_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
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
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Number of cards',
                        focusColor: Colors.blue,
                        border: OutlineInputBorder()),
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
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Number of cards',
                        focusColor: Colors.blue,
                        border: OutlineInputBorder()),
                  ))
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).accentColor,
            ),
            // Expanded(
            //   child: StatefulBuilder(
            //     builder: (BuildContext context, StateSetter setState) =>
            //         ListView(
            //       children: [...wantedCards],
            //     ),
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: wantedCards.length,
                itemBuilder: (context, index) {
                  final item = wantedCards[index];
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
                    key: Key(item.toString()),
                    onDismissed: (direction) {
                      setState(() {
                        wantedCards.removeAt(index);
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //       duration: const Duration(seconds: 1),
                      //       shape: const StadiumBorder(),
                      //       behavior: SnackBarBehavior.floating,
                      //       content: Text('$item dismissed')),
                      // );
                    },
                    child: cardEntry2(),
                  );
                },
              ),
            ),
            Divider(
              color: Theme.of(context).accentColor,
            ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: FloatingActionButton(
            //     heroTag: null,
            //     onPressed: () {
            //       setState(() {
            //         wantedCards?.add(cardEntry());
            //       });
            //     },
            //     child: Icon(
            //       Icons.add,
            //       color: Colors.black,
            //     ),
            //   ),
            // )
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
                                content: const Placeholder(),
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
                      focusColor: Colors.red,
                      splashColor: Theme.of(context).accentColor,
                      highlightColor: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(1000.0),
                      onTap: () {
                        setState(() {
                          wantedCards.add(cardEntry2());
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

  // void _onItemTapped(int index) {
  //   setState(() {
  //     switch (index) {
  //       case 0:
  //         wantedCards?.removeLast();
  //         break;
  //       case 1:
  //         break;
  //       case 2:
  //         wantedCards?.add(cardEntry());
  //     }
  //   });
  // }

  void enterQueue() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              // scrollable: true,
              title: const Text('Enter card details'),
              content: TextFormField(
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Card name"),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Confirm'))
              ],
            ));
  }

  Widget cardEntry() {
    return Column(
      children: [
        Expanded(
          child: TextFormField(
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Card name"),
          ),
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Copies in deck"),
          ),
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Minimum wanted"),
          ),
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Maximum wanted"),
          ),
        )
      ],
    );
  }

  Widget cardEntry2() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 54),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextFormField(
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
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Max",
                  // helperText: 'Max wanted',
                ),
              ),
            ),
          ),
          // ConstrainedBox(
          //   constraints: const BoxConstraints(maxHeight: 50, maxWidth: 50),
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 5, bottom: 5),
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(Icons.close),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
