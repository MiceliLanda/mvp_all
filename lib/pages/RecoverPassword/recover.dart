import 'package:flutter/material.dart';

import '../../styles/colors/colors_view.dart';
import '../Home/home.dart';

class Recover extends StatelessWidget {
  const Recover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
