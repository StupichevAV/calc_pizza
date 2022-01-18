import 'package:calc_pizza/reg_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthScreen extends StatelessWidget {
  final maskFormatter = MaskTextInputFormatter(mask: '+7 (###) ###-##-##');
  final TextEditingController numberController = TextEditingController();

  AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFeceff1), width: 2));
    const linkTextStyle = TextStyle(
      fontSize: 16,
      // fontWeight: FontWeight.bold,
      color: Color(0xFF0079D0),
    );

    return MaterialApp(
      home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 38),
            child: SingleChildScrollView(
              child: Column(
                children:  [
                  const SizedBox(height: 150,),
                  const SizedBox(width: 110, height: 84,
                    child: Image(image: AssetImage('assets/dart-logo.png'),),
                  ),
                  const SizedBox(height: 20,),
                  const SizedBox(height: 42, width: 300,
                    child: Text('Введите логин в виде 10 цифр номера телефона',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,
                          color: Color.fromRGBO(0, 0, 0, 0.6)
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
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
                  const SizedBox(height: 20,),
                  const SizedBox(height: 42, width: 244,
                    child: TextField(
                      obscureText: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFeceff1),
                        enabledBorder: borderStyle,
                        focusedBorder: borderStyle,
                        labelText: 'Пароль',
                      ),
                    ),
                  ),
                  const SizedBox(height: 28,),
                  SizedBox(width: 154, height: 42,
                      child: ElevatedButton(
                        child: const Text('Войти'),
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF0079D0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36.0),
                          ),
                        ),
                      )
                  ),
                  const SizedBox(height: 32,),
                  InkWell(child: const Text('Регистрация', style: linkTextStyle,),
                      onTap: (){}
                      ),
                  const SizedBox(height: 20,),
                  InkWell(child: const Text('Забыли пароль?', style: linkTextStyle,),
                      onTap: () {}),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          )
      ),
    );
  }
}


