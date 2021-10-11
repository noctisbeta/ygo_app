import 'package:flutter/material.dart';
import 'package:ygo_app/widgets/my_drawer.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

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
