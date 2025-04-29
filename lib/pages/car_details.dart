import 'package:car_rental/constants/images.dart';
import 'package:car_rental/models/car.dart';
import 'package:car_rental/pages/maps_details_page.dart';
import 'package:car_rental/widgets/car_card.dart';
import 'package:car_rental/widgets/more_card.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatefulWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> with SingleTickerProviderStateMixin {

  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
    ..addListener(() {
     setState(() {});
    });

    _controller!.forward();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller!.forward();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text("Information")
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: CarCard(car: widget.car),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 175,
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f3f3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(radius: 40, backgroundImage: AssetImage(CImages.userAvatarImage),),
                        SizedBox(height: 10),
                        Text("Jane Cooper", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("\$4,253", style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapsDetailsPage(car: widget.car),
                        ),
                      );
                    },
                    child: Container(
                      height: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(CImages.mapsImage, fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: [
                MoreCard(car: widget.car),
                const SizedBox(height: 8),
                MoreCard(car: widget.car),
                const SizedBox(height: 8),
                MoreCard(car: widget.car),
                const SizedBox(height: 8),
                MoreCard(car: widget.car),
              ],
            ),
          )
        ],
      ),
    );
  }
}
