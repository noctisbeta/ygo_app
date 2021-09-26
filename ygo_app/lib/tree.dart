import 'package:flutter/material.dart';

class Node {
  List<Node?> children = [];
  int visit = 0;
  Node? parent;
  int value;

  Node({required this.value, this.parent});

  Node? getParent() {
    return parent;
  }

  void addChild(Node child) {
    children.add(child);
  }

  Node? goLeft() {
    if (visit >= children.length) {
      return null;
    }
    return children[visit++];
  }

  bool hasLeft() {
    return visit < children.length;
  }

  void setChildren(List<int> values, Node parent) {
    children.clear();
    for (final int value in values) {
      addChild(Node(value: value, parent: parent));
    }
  }

  void reset() {
    visit = 0;
  }

  bool hasChildren() {
    if (children.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

class Tree {
  Node root = Node(value: 0);
  List<int> inDecks;
  int numDeck;
  int numHand;

  Tree({required this.inDecks, required this.numDeck, required this.numHand});

  void makeTree(
      {required List wantedCards,
      required List<List<TextEditingController>> ctrls}) {
    for (int i = 0; i < wantedCards.length; i++) {
      final List<int> values = [];
      for (int j = int.parse(ctrls[i][2].text);
          j <= int.parse(ctrls[i][3].text);
          j++) {
        values.add(j);
      }
      // print('values=$values');
      insertLevel(values: values, level: i + 1);
    }
  }

  void insertLevel({required List<int> values, required int level}) {
    Node current = root;
    bool condition = true;
    int currentLevel = 0;
    bool dontSet = false;

    if (current == root && level == 1) {
      current.setChildren(values, current);
      return;
    }

    while (condition) {
      for (int i = currentLevel + 1; i < level; i++) {
        if (current.hasLeft()) {
          current = current.goLeft()!;
          currentLevel++;
        } else if (currentLevel >= 1) {
          current.reset();
          currentLevel--;
          dontSet = true;
        } else {
          condition = false;
          current.reset();
          return;
        }
      }
      if (dontSet) {
        dontSet = false;
        continue;
      }
      current.setChildren(values, current);
      if (current != root) {
        current = current.parent!;
        currentLevel--;
      } else {
        condition = false;
      }
    }
  }

  BigInt calculate() {
    Node current = root;
    BigInt result = BigInt.from(0);
    final List<int> values = [];

    while (true) {
      print(current.value);
      if (current.hasChildren()) {
        if (current.hasLeft()) {
          if (current.value != 0 && current.visit == 0) {
            values.add(current.value);
          }
          current = current.goLeft()!;
        } else if (current != root) {
          current.reset();
          current = current.parent!;
          values.removeLast();
        } else {
          current.reset();
          return result;
        }
      } else {
        values.add(current.value);
        int handSum = 0;
        int deckSum = 0;
        BigInt product = BigInt.from(1);
        for (int i = 0; i < values.length; i++) {
          handSum += values[i];
          deckSum += inDecks[i];
        }
        product *= choose(numDeck - deckSum, numHand - handSum);
        for (int i = 0; i < values.length; i++) {
          product *= choose(inDecks[i], values[i]);
        }
        current = current.parent!;
        values.removeLast();
        result += product;
      }
    }
  }
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
