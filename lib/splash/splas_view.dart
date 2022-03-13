// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    paint.color = Colors.amber;

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 5;

    final path = Path();

    path.lineTo(0, size.height * 0.10);
    path.quadraticBezierTo(size.height * 0.10, size.height * 0.25,
        size.height * 0.32, size.height * 0.10);

    // path.quadraticBezierTo(size.height * 0.25, size.height * 0.20,
    //     size.height * 0.40, size.height * 0.10);

    // path.quadraticBezierTo(x1, y1, x2, y2)
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
    canvas.scale(.25, .22);

    canvas.drawImage(imageCanvas!, const Offset(300 * 1.5, 430 * 3.0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
