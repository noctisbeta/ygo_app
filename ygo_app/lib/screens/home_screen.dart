import 'package:flutter/material.dart';
import '../widgets/nav_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  List<Widget> get buttons => const [
        HomeButton(),
        CalcButton(),
        GameButton(),
        SmallWorldButton(),
        InfoButton(),
        ThemeButton()
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: const [
            Expanded(
              child: GameButton(),
            ),
            Expanded(
              child: CalcButton(),
            ),
            Expanded(
              child: HomeButton(),
            ),
            Expanded(
              child: SmallWorldButton(),
            ),
            Expanded(
              child: InfoButton(),
            ),
          ],
        ),
      ),
    );
  }
}
