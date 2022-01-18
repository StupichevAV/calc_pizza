import 'package:flutter/material.dart';
//import 'package:flutter/src/material/theme_data.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class PizzaCalculatorScreen extends StatefulWidget {
  const PizzaCalculatorScreen({Key? key}) : super(key: key);

  @override
  _PizzaCalculatorScreenState createState() => _PizzaCalculatorScreenState();
}

enum Sauce { hot, sweet, cheese }

class _PizzaCalculatorScreenState extends State<PizzaCalculatorScreen> {
  bool _isSlimDough = false;
  double _pizzaSize = 40;
  int _cost = 100;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = true;

  int _calcCost() {
    _cost = _pizzaSize.round() + 100;

    if (_isSlimDough) _cost += 30;
    if (_addCheese) _cost += 50;

    switch (_sauce) {
      case Sauce.hot:
        _cost += 10;
        break;

      case Sauce.sweet:
        _cost += 20;
        break;

      case Sauce.cheese:
        _cost += 40;
        break;

      default:
        _sauce = Sauce.hot;
    }
    return _cost;
  }

  void _onSauceChanged(Sauce? value) {
    setState(() {
      _sauce = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*
        appBar: AppBar(
          title: const Text('Home'),
        ),
         */
        body: Container(
          width: double.infinity,
         // height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(
                  height: 62,
                ),

                SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/pizza.png'),
                ),
                const Text('Калькулятор пиццы',
                    style: TextStyle(fontSize: 36, color: Color(0xFF000000))),
                const Text('Выберите параметры',
                    style: TextStyle(fontSize: 16, color: Color(0xFF000000))),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: 300,
                  child: SlidingSwitch(
                    value: false,
                    width: 300,
                    onChanged: (bool value) {
                      _isSlimDough = value;
                      setState(() {
                        _calcCost();
                      });
                    },
                    height: 34,
                    animationDuration: const Duration(milliseconds: 100),
                    onTap: () {},
                    onDoubleTap: () {},
                    onSwipe: () {},
                    textOff: 'Обычное тесто',
                    textOn: 'Тонкое тесто',
                    colorOn: const Color(0xffFFFFFF),
                    colorOff: const Color(0xf0FFFFFF),
                    background: const Color(0xffECEFF1),
                    buttonColor: const Color(0xff0079D0),
                  ),
                ),
                // Pizza size selector slider

                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: const Text('Размер',
                      style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
                ),
                SizedBox(
                    width: 300,
                    child: SfSlider(
                      min: 20,
                      max: 60,
                      value: _pizzaSize,
                      interval: 20,
                      showTicks: true,
                      showLabels: true,
                      numberFormat: NumberFormat('## см'),
                      enableTooltip: false,
                      minorTicksPerInterval: 0,
                      stepSize: 20,
                      onChanged: (dynamic value) {
                        setState(() {
                          _pizzaSize = value;
                          _calcCost();
                        });
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: const Text('Соус',
                      style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
                ),

                RadioListTile<Sauce>(
                  title: const Text('Острый'),
                  value: Sauce.hot,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  //  visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),
                RadioListTile<Sauce>(
                  title: const Text('Кисло-сладкий'),
                  value: Sauce.sweet,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  //  visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),
                RadioListTile<Sauce>(
                  title: const Text('Сырный'),
                  value: Sauce.cheese,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  //  visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),

                // Дополнительный сыр
                SizedBox(
                  width: 300,
                  child: Card(
                    elevation: 0,
                    color: Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                          ),
                          child: SizedBox(
                            width: 38,
                            height: 56,
                            child: Image.asset('assets/images/cheese.png'),
                          ),
                        ),
                        const Text('Дополнительный сыр',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF263238))),
                        Switch(
                          value: _addCheese,
                          onChanged: (bool value) {
                            setState(() {
                              _addCheese = value;
                              _calcCost();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),

                // Выводим итоговую стоимость
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: const Text('Стоимость: ',
                      style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
                ),

                // Цена в отдельной строке
                SizedBox(
                  width: 300,
                  height: 50,
                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('${_calcCost()} руб. ',
                        style: const TextStyle(
                            fontSize: 32, color: Color(0xFF000000)),
                        textAlign: TextAlign.center),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                SizedBox(width: 154, height: 42,
                    child: ElevatedButton(
                      child: const Text('Заказать'),
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF0079D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                      ),
                    )
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
