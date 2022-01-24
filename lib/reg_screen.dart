//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegScreen extends StatelessWidget {
  final maskFormatter = MaskTextInputFormatter(mask: '+7 (###) ###-##-##');
  final TextEditingController numberController = TextEditingController();

  RegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: Color(0xFFeceff1), width: 2)
    );

    const commentStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFFC4C4C4));

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 62,),
                SizedBox(height: 42, width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 9),
                        child: Icon(Icons.people),
                      ),
                      Text('Регистрация',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                           fontFamily: "Nunito",
                            fontSize: 20,
                           //fontWeight: FontWeight.bold,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF5C5C5C)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),

                Container(
                   // width: 300,
                    height: 0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Color(0xFFC4C4C4)),
                      )
                    ),

                ),
                const SizedBox(height: 10),
                const SizedBox(width: 300, height: 38,
                  child: Text('Чтобы зарегистрироваться введите свой номер телефона и почту',
                    textAlign: TextAlign.center,
                    style: commentStyle,
                  ),
                ),
                const SizedBox(height: 24,),
                SizedBox(height: 42, width: 244,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: numberController,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: const InputDecoration(
                      hintText: '+7 (___) ___-__-__',
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'Телефон',
                    ),
                    inputFormatters: [maskFormatter],
                  ),
                ),
                const SizedBox(height: 24,),
                const SizedBox(height: 42, width: 244,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'Почта',
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(width: 300, height: 38,
                  child: Text('Вам придет четырехзначный код, который будет вашим паролем',
                    textAlign: TextAlign.center,
                    style: commentStyle,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(width: 252, height: 57,
                  child: Text('Изменить пароль можно будет в личном кабинете после регистрации',
                    textAlign: TextAlign.center,
                    style: commentStyle,
                  ),
                ),

                const SizedBox(height: 32,),
                SizedBox(width: 154, height: 42,
                    child: ElevatedButton(onPressed: () {},
                      child: const Text('Отправить код',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF0079D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 32,),

              ],),
            ),
          )
      ),
    );
  }
}
