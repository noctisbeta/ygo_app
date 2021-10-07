import 'package:flutter/material.dart';
import 'calc.dart';
import 'home.dart';
import 'info_page.dart';
import 'lp_page.dart';
import 'small_world.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor, width: 4.0),
          shape: BoxShape.circle,
        ),
        child: InkWell(
          splashColor: Theme.of(context).accentColor,
          highlightColor: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomePage())),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class CalcButton extends StatelessWidget {
  const CalcButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor, width: 4.0),
          shape: BoxShape.circle,
        ),
        child: InkWell(
          splashColor: Theme.of(context).accentColor,
          highlightColor: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const CalcPage())),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.calculate_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class GameButton extends StatelessWidget {
  const GameButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor, width: 4.0),
          shape: BoxShape.circle,
        ),
        child: InkWell(
          splashColor: Theme.of(context).accentColor,
          highlightColor: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LifePage())),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.bar_chart,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class SmallWorldButton extends StatelessWidget {
  const SmallWorldButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor, width: 4.0),
          shape: BoxShape.circle,
        ),
        child: InkWell(
          splashColor: Theme.of(context).accentColor,
          highlightColor: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const SmallWorldPage())),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.auto_graph,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor, width: 4.0),
          shape: BoxShape.circle,
        ),
        child: InkWell(
          focusColor: Colors.red,
          splashColor: Theme.of(context).accentColor,
          highlightColor: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const InfoPage())),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.info_outline,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor, width: 4.0),
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
    );
  }
}
