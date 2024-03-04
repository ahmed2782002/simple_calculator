import 'package:flutter/material.dart';

import 'calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  static const String RoutName = "CalculatorScreen";

  @override
  State<CalculatorScreen> createState() {
    return CalculatorScreenState();
  }
}

class CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            //Expanded the text
            Expanded(
                child: Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      resultTextView,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ))),
            Container(
              height: 100,
            ),

            //Expanded the button in Rows
            Divider(color: Colors.grey, height: 10, endIndent: 20, indent: 20),
            //the Line before button

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                    onButtonClicked: clearData,
                    title: "AC",
                    buttonColor: Color(0XFF4C4C4F),
                    textColor: Colors.red,
                  ),
                  CalculatorButton(
                    onButtonClicked: onDeleteClicked,
                    title: "C",
                    buttonColor: Color(0XFF4C4C4F),
                    textColor: Colors.red,
                  ),
                  CalculatorButton(
                      onButtonClicked: onOperatorButtonClick,
                      title: "%",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.green),
                  CalculatorButton(
                      onButtonClicked: onOperatorButtonClick,
                      title: "/",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.green),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "7",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "8",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "9",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "*",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.green),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "4",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "5",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "6",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onOperatorButtonClick,
                      title: "-",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.green),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "1",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "2",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "3",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onOperatorButtonClick,
                      title: "+",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.green),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "0",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: "00",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onDigitClicked,
                      title: ".",
                      buttonColor: Color(0XFF4C4C4F),
                      textColor: Colors.white),
                  CalculatorButton(
                      onButtonClicked: onEqualClicked,
                      title: "=",
                      buttonColor: Colors.green,
                      textColor: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Calculator logic
  String SavedNumber = "";
  String SavedOperator = "";
  String resultTextView = "";

  onOperatorButtonClick(String operator) {
    if (SavedNumber.isEmpty) {
      SavedNumber = resultTextView;
      SavedOperator = operator;

      setState(() {
        resultTextView = "";
      });
    } else {
      var lhs = SavedNumber;
      var rhs = resultTextView;
      var res = calculate(lhs, SavedOperator, rhs);

      SavedNumber = res;

      setState(() {
        resultTextView = "";
      });
    }
  }

  onEqualClicked(String operator) {
    var lhs = SavedNumber;
    var rhs = resultTextView;
    var res = calculate(lhs, SavedOperator, rhs);
    resultTextView = res;

    setState(() {
      SavedNumber = "";
      SavedOperator = "";
    });
  }

  onDigitClicked(String title) {
    print("clicked digit : $title");
    setState(() {
      resultTextView += title;
    });
    print("$resultTextView");
  }

  String calculate(String lhs, String SavedOperator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double res = 0.0;
    if (SavedOperator == "+") {
      res = n1 + n2;
    } else if (SavedOperator == "-") {
      res = n1 - n2;
    } else if (SavedOperator == "*") {
      res = n1 * n2;
    } else if (SavedOperator == "/") {
      res = n1 / n2;
    } else {
      res = n1 % n2;
    }
    return res.toString();
  }

  clearData(String title) {
    if (resultTextView.isNotEmpty) {
      setState(() {
        resultTextView = "";
      });
    }
  }

  void onDeleteClicked(String title) {
    setState(() {
      if (resultTextView.isNotEmpty) {
        resultTextView = resultTextView.substring(0, resultTextView.length - 1);
      }
    });
  }
}
