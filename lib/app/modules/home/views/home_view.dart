// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ladder/app/utils/cleaning_page.dart';
import 'package:ladder/app/utils/repairing_page.dart';

import 'package:ladder/app/utils/theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;

    final widthC = sizeWidth;
    final heightC = sizeHeight;

    List<Widget> imgList = [
      Container(
        width: widthC - sizeWidth / 8,
        // height: 500,
        // margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sliderimage1.png'),
          ),
        ),
      ),
      Container(
        width: widthC - sizeWidth / 8,
        // height: 500,
        // margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sliderimage1.png'),
          ),
        ),
      ),
      Container(
        width: widthC - sizeWidth / 8,
        // height: 500,
        // margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sliderimage1.png'),
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              width: sizeWidth,
              // height: sizeHeight,
              // color: Colors.amber,
              child: Column(
                children: [
                  SearchField(heightC: heightC, sizeHeight: sizeHeight),
                  const SizedBox(height: 16),
                  CarouselSlider(
                    items: imgList,
                    carouselController: _controller,
                    options: CarouselOptions(
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      height: heightC / 5,
                      // height: 200,
                      autoPlay: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            _current = index;
                          },
                        );
                      },
                    ),
                  ),
                  Dot(
                      imgList: imgList,
                      controller: _controller,
                      current: _current),
                  TextRepairing(sizeWidth: sizeWidth, widthC: widthC),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        RepairingCard(
                          image: 'assets/images/lampu2.png',
                          title: 'Lampu',
                        ),
                        SizedBox(width: 12),
                        RepairingCard(
                          image: 'assets/images/keran2.png',
                          title: 'Plumbing',
                        ),
                        SizedBox(width: 12),
                        RepairingCard(
                            image: 'assets/images/pompa_air2.png',
                            title: 'Pompa Air,'),
                      ],
                    ),
                  ),
                  TextCleaning(sizeWidth: sizeWidth, widthC: widthC),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        CleaningCard(
                          image: 'assets/images/toilet2.png',
                          title: 'Toilet',
                        ),
                        SizedBox(width: 12),
                        CleaningCard(
                          image: 'assets/images/tandon_air2.png',
                          title: 'Tandon Air',
                        ),
                        SizedBox(width: 12),
                        CleaningCard(
                            image: 'assets/images/cuci_ac2.png',
                            title: 'Cuci Ac,'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CleaningCard extends StatelessWidget {
  const CleaningCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      width: 300,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: sliderColor,
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(1, 2),
          ),
        ],
        border: Border.all(
          color: whiteColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 140,
            height: 120,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Text(
                  title,
                  style: semiBoldText14.copyWith(color: blackColor),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 17),
                  Icon(
                    Icons.star,
                    color: Color(0xFFFFC107),
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text('0', style: regularText12),
                ],
              ),
              SizedBox(height: 29),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/komen.png',
                      width: 13,
                      height: 13,
                    ),
                    SizedBox(width: 7),
                    Text('50', style: regularText12),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RepairingCard extends StatelessWidget {
  const RepairingCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 50),
      // padding: EdgeInsets.symmetric(vertical: 50),

      // height: 120,
      width: 300,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: sliderColor,
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(1, 2),
          ),
        ],
        border: Border.all(
          color: whiteColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 140,
            height: 120,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Text(
                  title,
                  style: semiBoldText14.copyWith(color: blackColor),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 17),
                  Icon(
                    Icons.star,
                    color: Color(0xFFFFC107),
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text('0', style: regularText12),
                ],
              ),
              SizedBox(height: 29),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/komen.png',
                      width: 13,
                      height: 13,
                    ),
                    SizedBox(width: 7),
                    Text('50', style: regularText12),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TextRepairing extends StatelessWidget {
  const TextRepairing({
    Key? key,
    required this.sizeWidth,
    required this.widthC,
  }) : super(key: key);

  final double sizeWidth;
  final double widthC;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: sizeWidth - widthC / 9,
      // height: sizeHeight - heightC * 5,
      // width: double.infinity,
      // height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Repairing',
            style: boldText16.copyWith(color: blackColor),
          ),
          Container(
            width: 150,
            height: 1,
            color: sliderColor,
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RepairingPage(),
              ),
            ),
            child: Text(
              'Lihat Semua',
              style: boldText12.copyWith(color: blackColor),
            ),
          ),
        ],
      ),
    );
  }
}

class TextCleaning extends StatelessWidget {
  const TextCleaning({
    Key? key,
    required this.sizeWidth,
    required this.widthC,
  }) : super(key: key);

  final double sizeWidth;
  final double widthC;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: sizeWidth - widthC / 9,
      // height: sizeHeight - heightC * 5,
      // width: double.infinity,
      // height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Cleaning',
            style: boldText16.copyWith(color: blackColor),
          ),
          Container(
            width: 155,
            height: 1,
            color: sliderColor,
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CleaningPage(),
              ),
            ),
            child: Text(
              'Lihat Semua',
              style: boldText12.copyWith(color: blackColor),
            ),
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    Key? key,
    required this.imgList,
    required CarouselController controller,
    required int current,
  })  : _controller = controller,
        _current = current,
        super(key: key);

  final List<Widget> imgList;
  final CarouselController _controller;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 7.0,
            height: 7.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.heightC,
    required this.sizeHeight,
  }) : super(key: key);

  final double heightC;
  final double sizeHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        left: 16,
        right: 16,
      ),
      // color: Colors.red,
      width: double.infinity,
      height: heightC - sizeHeight / 1.15,
      child: TextField(
        decoration: InputDecoration(
          focusColor: whiteColor,
          suffixIcon:
              IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
          border: OutlineInputBorder(
            // gapPadding: ,
            borderSide: BorderSide(color: sliderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
