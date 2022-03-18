import 'package:flutter/material.dart';

import '../../styles/colors/colors_view.dart';
import '../Home/home.dart';

class Recover extends StatefulWidget {
  const Recover({Key? key}) : super(key: key);

  @override
  State<Recover> createState() => _RecoverState();
}

class _RecoverState extends State<Recover> {
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
            const Text('Recuperar contraseña'),
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
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.only(right: 25, left: 25, top: 25, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: const Text(
                'Ingresa tu email para restablecer tu contraseña',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Hack',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 117, 117, 117)),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Correo electrónico',
                style: _textStyle(bold: true, link: false),
              ),
            ),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Dirección de correo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Ingrese su correo electrónico registrado y le enviaremos un correo electrónico que contiene un enlace para restablecer su contraseña.',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Hack',
                  color: ColorsView.bardisabled),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: 340,
        margin: const EdgeInsets.all(25),
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
            'Enviar solicitud',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
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
}
