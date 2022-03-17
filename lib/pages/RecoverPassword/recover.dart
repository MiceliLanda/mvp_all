import 'package:flutter/material.dart';

import '../../styles/colors/colors_view.dart';
import '../Home/home.dart';

class Recover extends StatelessWidget {
  const Recover({Key? key}) : super(key: key);

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
        margin: const EdgeInsets.all(25.0),
        height: 40,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                  child: const Icon(
                    Icons.radio_button_checked,
                    color: Colors.blue,
                    size: 20,
                  ),
                  onTap: () {}),
            ),
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Al registrarme acepto los ',
                        style: stylesText(click: false),
                      ),
                      Text(
                        'términos y ',
                        style: stylesText(click: true),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'condiciones',
                      style: stylesText(click: true),
                    ),
                    Text(
                      'y la ',
                      style: stylesText(click: false),
                    ),
                    Text(
                      'política de privacidad.',
                      style: stylesText(click: true),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle stylesText({required bool click}) => TextStyle(
        color: click ? ColorsView.barused : Colors.black,
        fontSize: 15,
      );
}
