import 'package:flutter/material.dart';
import 'package:kfahi/constants.dart';

class ProductCard extends StatelessWidget {
  final String text;
  final String imagePath; // <-- تغيير إلى String imagePath

  const ProductCard({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultpadding,
        vertical: kDefaultpadding,
      ),
      height: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(255, 5, 134, 219),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 15),
                  blurRadius: 35,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultpadding),
                width: 150,
                height: 100,
                child: Image.asset(imagePath),
              )),
          Positioned(
            right: 0,
            top: 0,
            child: SizedBox(
              height: 100,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultpadding),
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 25.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
