import 'package:flutter/material.dart';
import 'package:mvp_all/pages/Home/home.dart';
import 'package:mvp_all/styles/colors/colors_view.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Map<String, String>> boardingData = [
    {
      'image': "assets/images/B1.png",
      'text': "ESPARCIMIENTO",
      'text2': "Brindamos todos los servicios para consentir a tu mascota"
    },
    {
      'image': "assets/images/B2.png",
      'text': "ADOPCIÓN",
      'text2':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore"
    },
    {
      'image': "assets/images/B3.png",
      'text': "HOSPITALIDAD",
      'text2':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore"
    },
    {
      'image': "assets/images/B4.png",
      'text': "VETERINARIA",
      'text2':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore"
    },
    {
      'image': "assets/images/B5.png",
      'text': "TIENDA",
      'text2': "Compra todas las necesidades de tu mascota sin salir de casa"
    },
  ];

  int page = 0;
  final PageController _pControler = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: _pageChanged(),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(boardingData.length,
                                (index) => _animatedContainer(index: index)))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: 200,
        height: 50,
        margin: const EdgeInsets.only(
            left: 30.0, right: 30.0, bottom: 30.0, top: 0),
        child: _elevatedButton(index: page),
      ),
    );
  }

  PageView _pageChanged() {
    return PageView.builder(
      controller: _pControler,
      onPageChanged: (value) {
        setState(() {
          page = value;
        });
      },
      itemCount: boardingData.length,
      itemBuilder: (context, index) => ContainerBoarding(
        image: boardingData[index]['image']!,
        textHeader: boardingData[index]['text']!,
        textSecondary: boardingData[index]['text2']!,
      ),
    );
  }

  ElevatedButton _elevatedButton({required int index}) {
    // print('index de elevated $index');
    return ElevatedButton(
      style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(color: ColorsView.txtheader2, width: 2)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
          backgroundColor: index == boardingData.length - 1
              ? MaterialStateProperty.all<Color>(ColorsView.bgEnabled)
              : MaterialStateProperty.all<Color>(ColorsView.bgDisabled)),
      onPressed: () => {
        _pControler.nextPage(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOutQuint),
        if (boardingData.length - 1 == index)
          {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Home()))
          },
      },
      child: index == boardingData.length - 1
          ? const Text(
              'Continuar',
              style: TextStyle(color: ColorsView.textWhite, fontSize: 16),
            )
          : const Text(
              'Siguiente',
              style: TextStyle(color: ColorsView.txtheader2, fontSize: 16),
            ),
    );
  }

  AnimatedContainer _animatedContainer({required int index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      height: 4,
      width: page == index ? 20 : 12,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: page == index ? ColorsView.barused : ColorsView.bardisabled),
    );
  }
}

class ContainerBoarding extends StatelessWidget {
  final String image;
  final String textHeader;
  final String textSecondary;

  const ContainerBoarding({
    Key? key,
    required this.image,
    required this.textHeader,
    required this.textSecondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              height: 200,
              width: 200,
            ),
            Text(textHeader,
                style: const TextStyle(
                    color: ColorsView.txtheader,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(
                top: 15.0, left: 50, right: 50, bottom: 0),
            child: Text(
              textSecondary,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorsView.txtheader2,
                fontSize: 15,
              ),
            )),
      ],
    );
  }
}
