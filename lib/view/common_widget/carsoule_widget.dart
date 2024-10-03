import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CarsouleWidget extends StatefulWidget {
  final List<Map<String, dynamic>> itemsList;
  final int currentSlide;
  final void Function(int, CarouselPageChangedReason) onPageChanged;

  const CarsouleWidget(
      {super.key,
      required this.itemsList,
      required this.currentSlide,
      required this.onPageChanged});

  @override
  State<CarsouleWidget> createState() => _CarsouleWidgetState();
}

class _CarsouleWidgetState extends State<CarsouleWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Builder(
      builder: (context) {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: screenHeight,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: List.generate(
                widget.itemsList.length.ceil(),
                (index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      SvgPicture.asset(
                        widget.itemsList[index]['svg_path']!,
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          // height: screenHeight * 0.4,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                widget.itemsList[index]['title'].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10),
                              ),
                              const Gap(10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 0),
                                child: Text(
                                  widget.itemsList[index]['description']
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
