// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvp_all/styles/colors/colors_view.dart';
import 'dart:ui' as ui;

// Importaciones clase Vistas
import '../pages/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    _loadImage('assets/images/splash.png');
    _toOnbording();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: CustomPaint(
            painter: _SplashCanvas(image),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  _toOnbording() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoarding(),
      ),
    );
  }

  _loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);

    setState(() => this.image = image);
  }
}

class _SplashCanvas extends CustomPainter {
  final ui.Image? imageCanvas;
  const _SplashCanvas(this.imageCanvas);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final paintBottom = Paint();

    paintBottom.color = ColorsView.bgEnabled;
    paintBottom.style = PaintingStyle.fill;
    paintBottom.strokeWidth = 5;

    paint.color = ColorsView.bgEnabled;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    final pathBottom = Path();

    path.lineTo(0, size.height * 0.10);
    path.quadraticBezierTo(
      size.width * .20, //izq
      size.height * .16, //inmedio izq
      size.width * .35, //inmedio der
      size.height * .10, //der
    );
    path.quadraticBezierTo(
      size.width * .48, //izq
      size.height * 0.06, //medio izq
      size.width * 0.80, // med der
      size.height * .10, //der
    );
    path.quadraticBezierTo(
      size.width, //izq
      size.height * .13, //inmedio izq
      size.height * 0.60, //inmedio der
      size.width * 0.06, //de);
    );
    path.lineTo(size.width, 0);

    pathBottom.moveTo(size.width * 0.05, size.height);
    pathBottom.quadraticBezierTo(
        size.width * .70, size.height * .80, size.width * 0.95, size.height);

    canvas.drawPath(path, paint);
    canvas.drawPath(pathBottom, paintBottom);

    canvas.scale(.25, .22);
    canvas.drawImage(imageCanvas!, const Offset(300 * 1.5, 435 * 3.0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
