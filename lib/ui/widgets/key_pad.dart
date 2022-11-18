import 'package:f_currency_converter_template/utils/constants.dart';
import 'package:flutter/material.dart';
import 'one_key.dart';

// en este widget mostramos el keypad y los valores de las monedas
class KeyPad extends StatefulWidget {
  const KeyPad(
      {Key? key,
      required this.textCurrency1,
      required this.textCurrency2,
      required this.rate})
      : super(key: key);

  // estos tres valores son recibidos de converter_page
  final String textCurrency1;
  final String textCurrency2;
  final double rate;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  // valor de la moneda convertida
  double _currency2 = 0.0;
  // el valor de la moneda que es introducida en el keypad
  int _currency1 = 0;
  double cambio = 0;
  String moneda1 = '0';
  List<int> listamoneda1 = [];

  // función que cambia el estado del widget (_currency1, _currency2)
  void _onPressed(int k) {
    setState(() {
      if (k == 10) {
        // TODO
        // cuando k es 10 se debe volver el estado a cero
        _currency1 = 0;
        _currency2 = 0.0;
        listamoneda1 = [];
      } else {
        // TODO
        // _currency1 debe cambiar con el keypad
        // _currency2 debe cambiar de acuerdo con _currency1 y la tasa de cambio
        listamoneda1.add(k);
        moneda1 = listamoneda1.join();
        _currency1 = int.parse(moneda1);
        cambio = widget.rate;
        _currency2 = _currency1.toDouble() * cambio;
      }
    });
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    // aquí garantizamos que cuando el widget refresca el estado va a cero
    _currency2 = 0.0;
    _currency1 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.textCurrency1),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    _currency1.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 35),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.textCurrency2),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    num.parse(_currency2.toStringAsFixed(4)).toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 35),
                  ))
            ],
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // TODO
                  // en cada OneKey se manda el número y _onPressed para callback
                  // OneKey para 7, 8 y 9
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: MaterialButton(
                          key: const Key("7"),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _onPressed(7);
                          },
                          child: const Text("7",
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: MaterialButton(
                          key: const Key("8"),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _onPressed(8);
                          },
                          child: const Text("8",
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: MaterialButton(
                          key: const Key("9"),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _onPressed(9);
                          },
                          child: const Text("9",
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.white,
                              ))),
                    ),
                  )
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // TODO
                  // en cada OneKey se manda el número y _onPressed para callback
                  //OneKey para 6, 5 y 4
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: MaterialButton(
                          key: const Key("4"),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _onPressed(4);
                          },
                          child: const Text("4",
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: MaterialButton(
                          key: const Key("5"),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _onPressed(5);
                          },
                          child: const Text("5",
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: MaterialButton(
                          key: const Key("6"),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _onPressed(6);
                          },
                          child: const Text("6",
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.white,
                              ))),
                    ),
                  )
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // TODO
                  // en cada OneKey se manda el número y _onPressed para callback
                  //OneKey para 1, 2 y 3
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: MaterialButton(
                          key: const Key("1"),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _onPressed(1);
                          },
                          child: const Text("1",
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: MaterialButton(
                          key: const Key("2"),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _onPressed(2);
                          },
                          child: const Text("2",
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: MaterialButton(
                          key: const Key("3"),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _onPressed(3);
                          },
                          child: const Text("3",
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.white,
                              ))),
                    ),
                  )
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: MaterialButton(
                      key: const Key("reset"),
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        _onPressed(10);
                      },
                      child: const Text("Reset",
                          style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                          ))),
                ),
              ),
              // TODO
              // en cada OneKey se manda el número y _onPressed para callback
              //OneKey para 0
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: MaterialButton(
                      key: const Key("0"),
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        _onPressed(0);
                      },
                      child: const Text("0",
                          style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                          ))),
                ),
              )
            ]),
          )
        ]);
  }
}
