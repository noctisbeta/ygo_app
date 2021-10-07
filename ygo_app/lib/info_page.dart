import 'package:flutter/material.dart';
import 'package:ygo_app/my_drawer.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
    );
  }
}
