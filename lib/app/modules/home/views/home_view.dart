// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ladder/app/modules/home/controllers/home_controller.dart';
import 'package:ladder/app/modules/search/views/components/cleaning.dart';
import 'package:ladder/app/modules/search/views/components/repairing_card.dart';
import 'package:ladder/app/modules/search/views/components/search_field.dart';
import 'package:ladder/app/modules/search/views/components/text_cleaning.dart';
import 'package:ladder/app/modules/search/views/components/text_repairing.dart';
import 'package:ladder/app/utils/loading_screen.dart';

import 'package:ladder/app/utils/theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _current = 0;
  HomeController producsController = Get.put(HomeController());

  final CarouselController _controller = CarouselController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

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
        child: isLoading
            ? LoadingScreen()
            : ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: sizeWidth,
                    // height: sizeHeight,
                    // color: Colors.amber,
                    child: Column(
                      children: [
                        SearchField(heightC: heightC, sizeHeight: sizeHeight),
                        // IconChat(),
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
                                  setState(() {
                                    _current = index;
                                  });
                                })),
                        Dot(
                            imgList: imgList,
                            controller: _controller,
                            current: _current),
                        TextRepairing(sizeWidth: sizeWidth, widthC: widthC),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Row(
                              children: producsController.repairing_products
                                  .map(
                                    (product) =>
                                        RepairingCard(product: product),
                                  )
                                  .toList()),
                        ),
                        TextCleaning(sizeWidth: sizeWidth, widthC: widthC),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                              children: producsController.cleaning_products
                                  .map(
                                    (product) => CleaningCard(product: product),
                                  )
                                  .toList()),
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
