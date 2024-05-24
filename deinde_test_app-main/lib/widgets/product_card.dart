import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_engineer_ui_translation_test/app/constants/strings.dart';
import 'package:flutter_engineer_ui_translation_test/bloc/dog_bloc.dart';
import 'package:flutter_engineer_ui_translation_test/presentation/screens/product_details_screen.dart';

class ProductCard extends StatefulWidget {
  final String imageUrl;

  const ProductCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late final String imageUrl;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ProductDetails(
              imagePath: imageUrl, // Pass imageUrl directly
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 2,
        width: MediaQuery.of(context).size.width * 0.42,
        child: Padding(
          padding: const EdgeInsets.all(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: MediaQuery.of(context).size.height *
                              0.237, // Adjusted height
                          width: MediaQuery.of(context).size.width *
                              0.6, // Adjusted width
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Positioned(
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.0, right: 1.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallProductCard extends StatefulWidget {
  final String imageUrl;
  const SmallProductCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<SmallProductCard> createState() => _SmallProductCardState();
}

class _SmallProductCardState extends State<SmallProductCard> {
  late final String imageUrl;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ProductDetails(
              imagePath: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        height: (MediaQuery.of(context).size.height * 2) / 3,
        width: (MediaQuery.of(context).size.width * 0.42) / 3,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: (MediaQuery.of(context).size.height * 0.237) /
                              3, // Adjusted height
                          width: (MediaQuery.of(context).size.width * 0.6) /
                              3, // Adjusted width
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(
                                  imageUrl), // Use the dog image here
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Positioned(
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.0, right: 1.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
