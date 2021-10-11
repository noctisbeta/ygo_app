import 'package:flutter/material.dart';
import '../widgets/my_drawer.dart';

class SmallWorldScreen extends StatefulWidget {
  const SmallWorldScreen({Key? key}) : super(key: key);

  @override
  _SmallWorldScreenState createState() => _SmallWorldScreenState();
}

class _SmallWorldScreenState extends State<SmallWorldScreen> {
  List<Widget> wantedCards = [];
  List<UniqueKey> keys = [];
  List<List<TextEditingController>> ctrls = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Small World'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
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
                                // content: getResults(),
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
                          final TextEditingController type =
                              TextEditingController();
                          final TextEditingController attr =
                              TextEditingController();
                          final TextEditingController level =
                              TextEditingController();
                          final TextEditingController atk =
                              TextEditingController();
                          final TextEditingController def =
                              TextEditingController();
                          wantedCards.add(
                              buildCard(name, type, attr, level, atk, def));
                          keys.add(UniqueKey());
                          ctrls.add([name, type, attr, level, atk, def]);
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
    );
  }

  Widget cardEntry(
      TextEditingController name,
      TextEditingController type,
      TextEditingController attr,
      TextEditingController level,
      TextEditingController atk,
      TextEditingController def) {
    return Wrap(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 54, maxWidth: 80),
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
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 54, maxWidth: 80),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TextFormField(
              controller: type,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Type",
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 54, maxWidth: 100),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TextFormField(
              controller: attr,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Attribute",
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 54, maxWidth: 80),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TextFormField(
              controller: level,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Level",
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 54, maxWidth: 80),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TextFormField(
              controller: atk,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "ATK",
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 54, maxWidth: 80),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TextFormField(
              controller: def,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "DEF",
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCard(
      final TextEditingController name,
      final TextEditingController type,
      final TextEditingController attr,
      final TextEditingController level,
      final TextEditingController atk,
      final TextEditingController def) {
    return Card(
      child: Center(
          child: Column(
        children: [
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: level,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Level",
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: TextFormField(
                  controller: attr,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Attribute",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: atk,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "ATK",
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: type,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Type",
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: def,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "DEF",
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
