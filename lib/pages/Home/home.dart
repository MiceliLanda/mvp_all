import 'package:flutter/material.dart';
import 'package:mvp_all/pages/Login/user_login.dart';
import 'package:mvp_all/pages/Register/register.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: null,
      body: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 150,
              margin: const EdgeInsets.only(
                  top: 50, bottom: 50, right: 24, left: 24),
              child: (Image.asset('assets/images/splash.png')),
            ),
            SizedBox(
              height: 48,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(49, 105, 245, 1)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.account_box,
                    ),
                    Text(
                      'Continuar con Google',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 40),
              height: 48,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(50, 79, 165, 1)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.facebook_sharp),
                    Text(
                      'Continuar con Facebook',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 48,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            side: const BorderSide(
                                width: 3,
                                color: Color.fromRGBO(100, 104, 111, 1))))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Register(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.email_sharp,
                      color: Colors.grey,
                    ),
                    Text(
                      'Registrarse con e-mail',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromARGB(255, 119, 119, 119)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // color: Colors.orange,
        height: 150,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 300,
                margin: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                    child: const Text('Entrar como invitado',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(252, 20, 96, 1))),
                    onTap: () => {})),
            SizedBox(
                width: 300,
                child: InkWell(
                    child: const Text('Entrar como vendedor',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(118, 170, 117, 1))),
                    onTap: () => {})),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: const Text(
                      '¿Ya tienes una cuenta?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  InkWell(
                      child: const Text('Iniciar sesión',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(252, 20, 96, 1))),
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()))
                          })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
