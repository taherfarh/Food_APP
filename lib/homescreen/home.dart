import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_application/core/home/cubit/home_cubit.dart';
import 'package:food_application/core/home/cubit/home_state.dart';
import 'package:http/http.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController =
      PageController(); // Controller for the PageView
  final List<String> images = [
    "assets/images/b6060a23fec30411dbe038537cb94f97.jpg",
    "assets/images/1324862.jpg",
    "assets/images/1324879.webp",
    "assets/images/R (1).jpeg",
    "assets/images/R.jpeg",
    "assets/images/wp8465834.jpg",
    "assets/images/R (2).jpeg",
    "assets/images/d231201690345d2c204c03b861f79b1a.jpeg",
    "assets/images/shutterstock_758819113-1200x853.jpg",
    "assets/images/wp8465834.jpg",
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<String> _dropdownItems = [
    'New York, USA',
    'EGY',
    'UEA',
    'SUA',
    'CHINA',
    'INDIA'
  ];
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = _dropdownItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getdata(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const SizedBox(height: 15),
            const Center(
              child: Text(
                "Delivery To",
                style: TextStyle(color: Color.fromARGB(255, 238, 167, 52)),
              ),
            ),
            SizedBox(
              height: 60, // Use SizedBox instead of Expanded
              child: DropdownButton<String>(
                value: _selectedItem,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 40,
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                isExpanded: true,
                items: _dropdownItems
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.5), // Shadow color with 50% opacity
                    offset: Offset(10, 10), // Horizontal and vertical offset
                    blurRadius: 20, // Blur radius
                    spreadRadius: 2, // Spread radius
                  ),
                ],
              ),
              child: SizedBox(
                height: 250, // Specify height for PageView
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(18)),
                  child: PageView.builder(
                    controller: _pageController, // Attach the controller
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(
                            18), // Apply border radius to the image
                        child: Image.asset(
                          images[index], // Load images from asset
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // SmoothPageIndicator
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController, // Attach the PageController
                  count: images.length, // Number of images
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 3, // Controls dot expansion
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured \nPartners",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "See all",
                    style: TextStyle(
                        color: Color.fromARGB(255, 238, 167, 52), fontSize: 18),
                  ),
                )
              ],
            ),

            const SizedBox(height: 8),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is Homeloading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeSuccess) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: state.userlist.length,
                    itemBuilder: (context, index) {
                      final user = state.userlist[index];
                      return InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) =>
                          //         ProductDetailScreen(product: user)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 246, 245, 244),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    user.strCategoryThumb,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(user.strCategory,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text("\$${user.idCategory.toString()}",
                                  style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is HomeError) {
                  return Center(
                    child: Text(
                      state.errormsg,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
