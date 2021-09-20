import 'package:flutter/material.dart';

class EntryAddingPage extends StatefulWidget {
  const EntryAddingPage({Key? key}) : super(key: key);

  @override
  _EntryAddingPageState createState() => _EntryAddingPageState();
}

class _EntryAddingPageState extends State<EntryAddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: cardEntry(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(
            Icons.check,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget cardEntry() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Card name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Copies in deck"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Minimum wanted"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
}
