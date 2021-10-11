import 'package:flutter/material.dart';
import 'package:ygo_app/screens/calc_screen.dart';
import '../screens/home_screen.dart';
import '../screens/game_screen.dart';
import '../screens/small_world_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                splashColor: Theme.of(context).accentColor,
                highlightColor: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const GameScreen())),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.bar_chart,
                    color: Colors.black,
                  ),
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
                highlightColor: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SmallWorldScreen())),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.auto_graph,
                    color: Colors.black,
                  ),
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
                highlightColor: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const CalcScreen())),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.calculate_outlined,
                    color: Colors.black,
                  ),
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
                highlightColor: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen())),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
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
                    Icons.info_outline,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
