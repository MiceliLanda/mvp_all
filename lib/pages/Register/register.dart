import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/pages/Login/user_login.dart';

import '../../styles/colors/colors_view.dart';
import '../Home/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isHide = true;
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorsView.txtheader,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
          onPressed: () => {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => const Home())))
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsView.barused,
            size: 30,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Regístrate'),
            SizedBox(
              width: 85,
              height: 45,
              child: Image.asset(
                'assets/images/splash.png',
                color: ColorsView.textWhite,
                fit: BoxFit.fill,
                // height: 100,
                // width: 40,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
            width: double.infinity,
            // color: ColorsView.bgEnabled,
            child: Column(
              textDirection: TextDirection.ltr,
              children: [
                const Text(
                  'Crea una cuenta para empezar a usar la app',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Hack',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 117, 117, 117)),
                ),
                const SizedBox(
                  height: 40,
                ),
                containerText(name: 'Nombre'),
                _textField(field: 'Nombre completo'),
                const SizedBox(
                  height: 25,
                ),
                containerText(name: 'Correo Electrónico'),
                _textField(field: 'Email Address'),
                const SizedBox(
                  height: 25,
                ),
                containerText(name: 'Contraseña'),
                _textFieldPassword(field: 'Password'),
                Container(
                  margin: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 20),
                  height: 30,
                  child: const Text(
                    'La contraseña debe tener caracteres, números y simbolos con un mínimo de 6 caracteres.',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Hack',
                        color: Color.fromARGB(239, 189, 189, 189)),
                  ),
                ),
                containerCheckbox(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 130,
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 340,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorsView.bgEnabled),
                ),
                onPressed: () {},
                child: const Text(
                  'Crear cuenta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: const Text(
                      '¿Ya tienes una cuenta?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  InkWell(
                    child: const Text('Iniciar sesión',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(252, 20, 96, 1))),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()))
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox containerCheckbox() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _checked = !_checked;
                });
              },
              child: _checked
                  ? const Icon(
                      Icons.radio_button_checked,
                      color: Colors.blue,
                      size: 20,
                    )
                  : const Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.grey,
                      size: 20,
                    ),
            ),
          ),
          Expanded(
            flex: 5,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Al registrarme, acepto los ',
                    style: _textStyle(bold: false, link: false),
                  ),
                  TextSpan(
                    text: 'términos y condiciones',
                    style: _textStyle(bold: false, link: true),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          ),
                  ),
                  TextSpan(
                    text: ' y la',
                    style: _textStyle(bold: false, link: false),
                  ),
                  TextSpan(
                    text: ' política de privacidad.',
                    style: _textStyle(bold: false, link: true),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Long Pressed.
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextField _textField({required String field}) {
    return TextField(
      style: _textStyle(bold: false, link: false),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: field,
      ),
    );
  }

  TextStyle _textStyle({required bool bold, required bool link}) {
    return TextStyle(
        fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
        color: link ? ColorsView.barused : ColorsView.txtBlack,
        fontSize: 15,
        fontFamily: 'Hack');
  }

  TextField _textFieldPassword({required String field}) {
    return TextField(
      obscureText: _isHide,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        suffixIcon: IconButton(
          icon: Icon(_isHide ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(
              () {
                _isHide = !_isHide;
              },
            );
          },
        ),
      ),
    );
  }

  Container containerText({required String name}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        name,
        style: _textStyle(bold: true, link: false),
      ),
    );
  }
}
