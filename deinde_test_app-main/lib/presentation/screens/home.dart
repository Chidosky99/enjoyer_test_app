import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_engineer_ui_translation_test/app/constants/strings.dart';
import 'package:flutter_engineer_ui_translation_test/bloc/dog_bloc.dart';
import 'package:flutter_engineer_ui_translation_test/widgets/category_buttion.dart';
import 'package:flutter_engineer_ui_translation_test/widgets/interactions_widget.dart';
import 'package:flutter_engineer_ui_translation_test/widgets/product_card.dart';
import 'package:flutter_engineer_ui_translation_test/widgets/source_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart package
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<String> dogImageUrls = [];

  bool showInteractionsContent = true;

  @override
  void initState() {
    super.initState();
    fetchDogImages();
  }

  Future<void> fetchDogImages() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random/10'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> images = data['message'];

      setState(() {
        dogImageUrls = List<String>.from(images);
      });
    } else {
      throw Exception('Failed to load dog images');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final dogBloc = BlocProvider.of<DogBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.black,
        title: Container(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ruben Bermejo,",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.yellow),
              ),
              Text(
                "@ruben",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Implement navigation logic here
          },
        ),
        leadingWidth: 40, // Reduced from 50 to 40
        actions: [
          Container(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  color: Colors.white,
                  onPressed: () {
                    // Implement action logic here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // CircularAvatar with an image
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_picture.jpg'),
                  ),
                  const SizedBox(
                      width: 20), // Space between the avatar and the column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Citizens of the World 🌍',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5), // Space between the texts
                      const Text(
                        'From Spain 🇪🇸 to the Moon 🌙', // Half crescent moon emoji
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.groups,
                            size: 18,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            '3', // Half crescent moon emoji
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  5), // Adding border radius
                              border: Border.all(
                                // Adding border
                                color: Colors.black, // Border color
                                width: 2, // Border width
                              ),
                            ),
                            // Define the dimensions for the Container
                            width: 60, // Example width
                            height: 30, // Example height
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Edit', // Half crescent moon emoji
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  5), // Adding border radius
                              border: Border.all(
                                // Adding border
                                color: Colors.black, // Border color
                                width: 2, // Border width
                              ),
                            ),
                            // Define the dimensions for the Container
                            width: 125, // Example width
                            height: 30, // Example height
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.article_outlined,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Manage Posts', // Half crescent moon emoji
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  5), // Adding border radius
                              border: Border.all(
                                // Adding border
                                color: Colors.black, // Border color
                                width: 2, // Border width
                              ),
                            ),
                            // Define the dimensions for the Container
                            width: 60, // Example width
                            height: 30, // Example height
                            child: InkWell(
                              onTap: () {
                                showCustomDialog(context);
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bar_chart,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'Stats', // Half crescent moon emoji
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: MediaQuery.of(context).size.height *
                0.15, // Adjust the height as needed
            child: _buildSmallGridOfVideos(), // Small grid of videos
          )),
          SliverToBoxAdapter(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  color: Colors.white,
                  highlightColor: Colors.white,
                  onPressed: () {
                    // Implement action logic here
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "ENJOY MY",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  color: Colors.grey,
                  onPressed: () {
                    // Implement action logic here
                  },
                ),
                const SizedBox(
                  width: 150,
                ),
                Text(
                  "LATEST",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.5, // Adjust the height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  _buildRowOfVideos(),
                  _buildRowOfVideos(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowOfVideos() {
    return Container(
      width: MediaQuery.of(context).size.width, // Constrain the width
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Expanded(
            // Wrap GridView.builder with Expanded
            child: GridView.builder(
              shrinkWrap:
                  true, // Keep this to ensure GridView only takes up necessary space
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: dogImageUrls?.length ?? 0,
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl: dogImageUrls![index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallGridOfVideos() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            dogImageUrls?.length ?? 0, // Number of videos in the small grid
        itemBuilder: (context, index) {
          return SmallProductCard(
            imageUrl: dogImageUrls![index],
          );
        },
      ),
    );
  }

  SliverPersistentHeader makeHeader(String headerText, String actionText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 50.0,
        maxHeight: 50.0,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  headerText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.black, fontSize: 20),
                ),
                Text(actionText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.teal, fontSize: 15)),
              ],
            )),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    // Create a custom dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          // Wrap the Stack with GestureDetector
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Close the dialog when tapped outside
            },
            child: Stack(
              children: [
                // Background overlay
                Positioned.fill(
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.5), // Black background with opacity
                  ),
                ),
                // Custom dialog
                Positioned(
                  top: 0, // Position from the top
                  child: Container(
                    height: 500,
                    width: 600, // Width of the dialog
                    decoration: BoxDecoration(
                      color: Colors.black, // Dialog background color
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Text(
                                "Statistics",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      5), // Adding border radius
                                  border: Border.all(
                                    // Adding border
                                    color: Colors.black, // Border color
                                    width: 2, // Border width
                                  ),
                                ),
                                // Define the dimensions for the Container
                                width: 75, // Example width
                                height: 20, // Example height
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'OTHER FILTERS', // Half crescent moon emoji
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight
                                            .w900, // Increase thickness by setting FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      5), // Adding border radius
                                  border: Border.all(
                                    // Adding border
                                    color: Colors.black, // Border color
                                    width: 2, // Border width
                                  ),
                                ),
                                // Define the dimensions for the Container
                                width: 75, // Example width
                                height: 20, // Example height
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'PROFILE STATS', // Half crescent moon emoji
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight
                                            .w900, // Increase thickness by setting FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      100), // Adding border radius
                                  border: Border.all(
                                    // Adding border
                                    color: Colors.black, // Border color
                                    width: 2, // Border width
                                  ),
                                ),
                                // Define the dimensions for the Container
                                width: 20, // Example width
                                height: 20, // Example height
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '?', // Half crescent moon emoji
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight
                                            .w900, // Increase thickness by setting FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "GUIDES",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 70,
                              ),
                              InkWell(
                                onTap: () {
                                  // Display the pie chart
                                  showPieChart(context);
                                },
                                child: Text(
                                  "FOOD",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 70,
                              ),
                              Text(
                                "TRAVEL",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Madrid', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Text(
                                'Spanish', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 75,
                              ),
                              Text(
                                'USA', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Oviedo', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Text(
                                'Turkish', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 75,
                              ),
                              Text(
                                'Japan', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Baleares', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                'French', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                'France', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Container(
                                height: 2.0, // Set the height of the divider
                                width: 100.0, // Set the width of the divider
                                child: const Divider(
                                  thickness:
                                      3.0, // Set the thickness of the divider
                                  color: Colors
                                      .white, // Set the color of the divider
                                ),
                              ),
                              const SizedBox(width: 35),
                              Container(
                                height: 2.0, // Set the height of the divider
                                width: 100.0, // Set the width of the divider
                                child: const Divider(
                                  thickness:
                                      3.0, // Set the thickness of the divider
                                  color: Colors
                                      .white, // Set the color of the divider
                                ),
                              ),
                              const SizedBox(width: 25),
                              Container(
                                height: 2.0, // Set the height of the divider
                                width: 100.0, // Set the width of the divider
                                child: const Divider(
                                  thickness:
                                      3.0, // Set the thickness of the divider
                                  color: Colors
                                      .white, // Set the color of the divider
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "SERVICES",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                "PRODUCTS",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                "PROMOTIONS",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'RR.HH', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 95,
                              ),
                              Text(
                                'Asturians', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 65,
                              ),
                              Text(
                                'North Pole', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Consultant', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 67,
                              ),
                              Text(
                                'Italian', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 87,
                              ),
                              Text(
                                'Greece', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Turkey', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 95,
                              ),
                              Text(
                                'Healthy', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 78,
                              ),
                              Text(
                                'Argentina', // Half crescent moon emoji
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight
                                      .w900, // Increase thickness by setting FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showPieChart(BuildContext context) {
    // Show pie chart
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.zero,
              child: Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showInteractionsContent = true;
                              });
                            },
                            child: Text(
                              'INTERACTIONS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: showInteractionsContent
                                    ? const Color.fromRGBO(255, 245, 157, 1)
                                    : Colors.grey.shade900,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showInteractionsContent = false;
                              });
                            },
                            child: Text(
                              'SOURCE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: !showInteractionsContent
                                    ? const Color.fromRGBO(255, 245, 157, 1)
                                    : Colors.grey.shade900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: showInteractionsContent
                          ? InteractionsWidget()
                          : SourceWidget(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget InteractionsWidget1(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              color: const Color.fromRGBO(255, 245, 157, 1),
            ),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'LIKE',
              style: TextStyle(
                color: Colors.white, // Change color to golden
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              height: 15,
              width: 15,
              color: Colors.white,
            ),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'COOL',
              style: TextStyle(color: Colors.white // Change color to golden
                  ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(height: 15, width: 15, color: Colors.grey),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'LOVE',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(height: 15, width: 15, color: Colors.blue),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'FUNNY',
              style: TextStyle(
                color: Colors.white, // Change color to golden
              ),
            )
          ],
        ),
        Align(
          // Align the pie chart to the left
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Container(
                height: 150,
                width: 150,
                // width: double.infinity, // Occupy full width
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 23,
                        title: '🙂',
                        color: Colors.white,
                        badgeWidget: Container(
                          height: 15,
                          width: 30,
                          color: Colors.white,
                          child: const Text(
                            '23%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 10,
                        title: '😍',
                        color: Colors.grey,
                        badgeWidget: Container(
                          height: 15,
                          width: 25,
                          color: Colors.white,
                          child: const Text(
                            '10%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 9,
                        title: '😬',
                        color: Colors.blue,
                        badgeWidget: Container(
                          height: 15,
                          width: 20,
                          color: Colors.white,
                          child: const Text(
                            '9%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 58,
                        title: '🤤',
                        color: const Color.fromRGBO(255, 245, 157, 1),
                        badgeWidget: Container(
                          height: 15,
                          width: 25,
                          color: Colors.white,
                          child: const Text(
                            '58%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                    ],
                    sectionsSpace: 0,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'FEELINGS RECEIVED',
                        style: TextStyle(
                          color: Colors.white, // Change color to golden
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '98',
                        style: TextStyle(
                          color: Color.fromRGBO(
                              255, 245, 157, 1), // Change color to golden
                        ),
                      ),
                    ],
                  ),
                  DottedTable1(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'COMMENTS',
                        style: TextStyle(
                          color: Colors.white, // Change color to golden
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '8',
                        style: TextStyle(
                          color: Color.fromRGBO(
                              255, 245, 157, 1), // Change color to golden
                        ),
                      ),
                    ],
                  ),
                  DottedTable2(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget SourceWidget1(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              color: const Color.fromRGBO(255, 245, 157, 1),
            ),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'HOME',
              style: TextStyle(
                color: Colors.white, // Change color to golden
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              height: 15,
              width: 15,
              color: Colors.white,
            ),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'DISCOVER',
              style: TextStyle(color: Colors.white // Change color to golden
                  ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(height: 15, width: 15, color: Colors.grey),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'SEARCH',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(height: 15, width: 15, color: Colors.blue),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'PROFILE',
              style: TextStyle(
                color: Colors.white, // Change color to golden
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(height: 15, width: 15, color: Colors.purple),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'NOTIFICATION',
              style: TextStyle(
                color: Colors.white, // Change color to golden
              ),
            )
          ],
        ),
        Align(
          // Align the pie chart to the left
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Container(
                height: 150,
                width: 150,
                // width: double.infinity, // Occupy full width
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 26,
                        title: '',
                        color: Colors.white,
                        badgeWidget: Container(
                          height: 15,
                          width: 30,
                          color: Colors.white,
                          child: const Text(
                            '26%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 18,
                        title: '',
                        color: Colors.grey,
                        badgeWidget: Container(
                          height: 15,
                          width: 25,
                          color: Colors.white,
                          child: const Text(
                            '18%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 12,
                        title: '',
                        color: Colors.blue,
                        badgeWidget: Container(
                          height: 15,
                          width: 20,
                          color: Colors.white,
                          child: const Text(
                            '12%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 35,
                        title: '',
                        color: const Color.fromRGBO(255, 245, 157, 1),
                        badgeWidget: Container(
                          height: 15,
                          width: 25,
                          color: Colors.white,
                          child: const Text(
                            '35%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 9,
                        title: '',
                        color: Colors.white,
                        badgeWidget: Container(
                          height: 15,
                          width: 30,
                          color: Colors.purple,
                          child: const Text(
                            '9%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                    ],
                    sectionsSpace: 0,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'VIEWS',
                        style: TextStyle(
                          color: Colors.white, // Change color to golden
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '3123',
                        style: TextStyle(
                          color: Color.fromRGBO(
                              255, 245, 157, 1), // Change color to golden
                        ),
                      ),
                    ],
                  ),
                  DottedTable1(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class DottedTable1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(), // CustomPainter for the dashed border
      child: Container(
        padding: EdgeInsets.all(8),
        // width: MediaQuery.of(context).size.width /
        //     4, // Set width to 1/4 of screen width
        // height: MediaQuery.of(context).size.height /
        //     4, // Set height to 1/4 of screen height
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('')),
            DataColumn(label: Text('Value')),
          ],
          rows: const <DataRow>[
            DataRow(cells: [
              DataCell(Text(
                'Followers',
                style: TextStyle(
                  color: Color.fromRGBO(
                      255, 245, 157, 1), // Change color to golden
                ),
              )),
              DataCell(Text(
                '43',
                style: TextStyle(
                  color: Colors.white, // Change color to golden
                ),
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                'Members',
                style: TextStyle(
                  color: Color.fromRGBO(
                      255, 245, 157, 1), // Change color to golden
                ),
              )),
              DataCell(Text(
                '21',
                style: TextStyle(
                  color: Colors.white, // Change color to golden
                ),
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                'Remaining',
                style: TextStyle(
                  color: Color.fromRGBO(
                      255, 245, 157, 1), // Change color to golden
                ),
              )),
              DataCell(Text(
                '34',
                style: TextStyle(
                  color: Colors.white, // Change color to golden
                ),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}

class DottedTable2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(), // CustomPainter for the dashed border
      child: Container(
        padding: EdgeInsets.all(8),
        // width: MediaQuery.of(context).size.width /
        //     4, // Set width to 1/4 of screen width
        // height: MediaQuery.of(context).size.height /
        //     4, // Set height to 1/4 of screen height
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('')),
            DataColumn(label: Text('Value')),
          ],
          rows: const <DataRow>[
            DataRow(cells: [
              DataCell(Text(
                'Followers',
                style: TextStyle(
                  color: Color.fromRGBO(
                      255, 245, 157, 1), // Change color to golden
                ),
              )),
              DataCell(Text(
                '4',
                style: TextStyle(
                  color: Colors.white, // Change color to golden
                ),
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                'Members',
                style: TextStyle(
                  color: Color.fromRGBO(
                      255, 245, 157, 1), // Change color to golden
                ),
              )),
              DataCell(Text(
                '0',
                style: TextStyle(
                  color: Colors.white, // Change color to golden
                ),
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                'Remaining',
                style: TextStyle(
                  color: Color.fromRGBO(
                      255, 245, 157, 1), // Change color to golden
                ),
              )),
              DataCell(Text(
                '4',
                style: TextStyle(
                  color: Colors.white, // Change color to golden
                ),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey // Change this to your preferred border color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final dashWidth = 5;
    final dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }

    double endX = size.width;
    while (endX > 0) {
      canvas.drawLine(
        Offset(endX, size.height),
        Offset(endX - dashWidth, size.height),
        paint,
      );
      endX -= dashWidth + dashSpace;
    }

    double endY = size.height;
    while (endY > 0) {
      canvas.drawLine(
        Offset(size.width, endY),
        Offset(size.width, endY - dashWidth),
        paint,
      );
      endY -= dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

@override
Widget build(BuildContext context) {
  return const Placeholder();
}
