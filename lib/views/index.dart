import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexState();
  }
}

class IndexState extends State<Index> {
  String result = '';
  String a = '';
  String b = '';
  String symbol = "+";

  @override
  void initState() {
    super.initState();
  }

  clear() {
    setState(() {
      this.a = '';
      this.b = '';
      this.symbol = '+';
      this.result = '';
    });
  }

  backspace() {
    if (this.b == '') {
      return;
    }

    setState(() {
      this.b = this.b.substring(0, this.b.length - 1);
    });
  }

  addB(value) {
    if (value == '0' && this.b == '') {
      return;
    }
    if (value == '.' && this.b == '') {
      value = '0.';
    }
    setState(() {
      this.b = this.b + value;
      this.result = this.b.replaceAll('.00', '');
    });
  }

  setSymbol(symbol) {
    calculate();
    setState(() {
      this.symbol = symbol;
    });
  }

  Decimal d(value) {
    return Decimal.parse(value);
  }

  calculate() {
    var an = a == '' ? '0.0' : a;
    var bn = b == '' ? '0.0' : b;
    var rn;
    switch (symbol) {
      case '+':
        rn = d(an) + d(bn);
        break;
      case '-':
        rn = d(an) - d(bn);
        break;
      case '×':
        rn = d(an) * d(bn);
        break;
      case '÷':
        rn = d(an) / d(bn);
        break;
      default:
        rn = d(0.0);
    }

    var rnStr = rn.toString();
    setState(() {
      this.result =
          rnStr.endsWith('.0') ? rnStr.substring(0, rnStr.length - 2) : rnStr;
      this.a = this.result;
      this.b = '';
      this.symbol = '+';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('计算器'),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: DefaultTextStyle(
                  child: Text(result.length == 0 ? '0' : result),
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
                width: 375.0,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: const BorderSide(width: 1.0, color: Colors.black45),
                )),
                padding: EdgeInsets.all(12.0),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              'AC',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              clear();
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {}),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {}),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '÷',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              setSymbol('÷');
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '7',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('7');
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '8',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('8');
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '9',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('9');
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '×',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              setSymbol('×');
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '4',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('4');
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('5');
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '6',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('6');
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              if ('' == this.result) {
                                addB('-');
                              } else {
                                setSymbol('-');
                              }
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('1');
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('2');
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('3');
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              setSymbol('+');
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('0');
                            }),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '•',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              addB('.');
                            }),
                        GestureDetector(
                          child: IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '删除',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              backspace();
                            },
                          ),
                          onLongPress: () {
                            clear();
                          },
                        ),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                            iconSize: 72.0,
                            icon: Text(
                              '=',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              calculate();
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
