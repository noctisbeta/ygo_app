import 'package:flutter/material.dart';
import 'package:ygo_app/calc.dart';

class SmallWorldPage extends StatefulWidget {
  const SmallWorldPage({Key? key}) : super(key: key);

  @override
  _SmallWorldPageState createState() => _SmallWorldPageState();
}

class _SmallWorldPageState extends State<SmallWorldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
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
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const CalcPage())),
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
      ),
      appBar: AppBar(
        title: const Text('Small World'),
      ),
    );
  }
}
