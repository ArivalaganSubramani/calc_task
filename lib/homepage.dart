import 'package:flutter/material.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => HomePageState();
}


class HomePageState extends State<HomePage> {
  List<String> operators = ["+", "-", "×", "÷"];
  List<String> hist = [];
  var history = "", output = "0.0", answer = 0.0;
  void click1() {
    setState(() {
      debugPrint('output$output');
      if (double.parse(output) != 0.0) {
        output += "1";
      } else {
        output = "1";
      }
    });
  }

  void click2() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "2";
      } else {
        output = "2";
      }
    });
  }

  void click3() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "3";
      } else {
        output = "3";
      }
    });
  }

  void click4() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "4";
      } else {
        output = "4";
      }
    });
  }

  void click5() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "5";
      } else {
        output = "5";
      }
    });
  }

  void click6() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "6";
      } else {
        output = "6";
      }
    });
  }

  void click7() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "7";
      } else {
        output = "7";
      }
    });
  }

  void click8() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "8";
      } else {
        output = "8";
      }
    });
  }

  void click9() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "9";
      } else {
        output = "9";
      }
    });
  }

  void click0() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "0";
      } else {
        output = "0";
      }
    });
  }

  void clickDot() {
    setState(() {
      output += ".";
    });
  }

  void clear() {
    setState(() {
      history = "";
      output = "0";
      answer = 0.0;
      hist = [];
    });
  }

  void sign() {
    setState(() {
      if (double.parse(output) == 0.0) {
      } else {
        if (output[0] == '-') {
          output = output.substring(1);
        } else {
          output = '-' + output;
        }
      }
    });
  }

  void percent() {
    setState(() {
      double percent = 0.0;
      percent = answer / 100;
      history = answer.toString() + " ÷ 100 =";
      output = percent.toString();
    });
  }

  String getTape() {
    return hist.join(" ");
  }

  bool isOperator(String s) {
    return (operators.contains(s));
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s) != null;
  }

  void equals() {
    setState(() {
      if (hist.length <= 3) {
        hist.add(output);
      }
      history = getTape() + " =";
      var opr1, opr2, op;
      opr1 = double.parse(hist.removeAt(0));
      op = hist.removeAt(0);
      opr2 = double.parse(hist.removeAt(0));


      switch (op) {
        case "+":
          answer = opr1 + opr2;
          break;
        case "-":
          answer = opr1 - opr2;
          break;
        case "×":
          answer = opr1 * opr2;
          break;
        case "÷":
          answer = opr1 / opr2;
          break;
        default:
      }
      output = answer.toString();
    });
  }

  void add() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("+");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  void sub() {
    setState(() {
      debugPrint('output sub$output');
      answer = double.parse(output);
      hist.add(output);
      hist.add("-");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  void div() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("÷");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  void mul() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("×");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,

      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25.0, right: 15.0),
              child: Text(
                history,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 15.0, bottom: 15.0),
              child: Text(
                output,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 60.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: clear,
                      child: const Text(
                        "AC",
                        style: TextStyle(
                            fontSize: 35.0, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.grey,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: sign,
                      child: const Text(
                        "+/_",
                        style: TextStyle(
                            fontSize: 35.0, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.grey,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: percent,
                      child: const Text(
                        "%",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.grey,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: div,
                      child: const Text(
                        "÷",
                        style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.orange,
                      padding: const EdgeInsets.all(15.0),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: click7,
                      child: const Text(
                        "7",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: click8,
                      child: const Text(
                        "8",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: click9,
                      child: const Text(
                        "9",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.all(15.0),
                    ),

                    RawMaterialButton(
                      onPressed: mul,
                      child: const Text(
                        "×",
                        style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.orange,
                      padding: const EdgeInsets.all(15.0),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: click4,
                      child: const Text(
                        "4",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: click5,
                      child: const Text(
                        "5",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: click6,
                      child: const Text(
                        "6",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: sub,
                      child: const Text(
                        "-",
                        style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.orange,
                      padding: const EdgeInsets.all(15.0),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: click1,
                      child: const Text(
                        "1",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: click2,
                      child: const Text(
                        "2",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: click3,
                      child: const Text(
                        "3",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: add,
                      child:  const Text(
                        "+",
                        style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.orange,
                      padding: const EdgeInsets.all(15.0),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 5.0, bottom: 6.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: click0,
                      child: const Text(
                        "0",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      constraints: const BoxConstraints.tightFor(width: 170.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45.0)),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.only(
                          left: 18.0, top: 15.0, bottom: 15.0, right: 15.0),
                    ),
                    RawMaterialButton(
                      onPressed: clickDot,
                      child: const Text(
                        ".",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: buttonBg,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: equals,
                      child: const Text(
                        "=",
                        style: TextStyle(
                            fontSize: 35.0,color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.orange,
                      padding: const EdgeInsets.all(15.0),
                    )
                  ]),
            ),
          ]),
    );
  }
}