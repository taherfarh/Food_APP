import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_application/cart/cart.dart';
import 'package:food_application/core/home/cubit/home_cubit.dart';
import 'package:food_application/core/home/cubit/home_state.dart';
import 'package:food_application/details/productdetails.dart';
import 'package:food_application/person/person.dart';
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

  int _currentIndex = 0;

  // List of widgets for each screen/tab
  final List<Widget> _screens = [
    const HomeContent(), // Home content widget
    CartScreen(), // Cart screen
    PersonScreen(), // Profile screen
  ];

  // Method to handle tap on BottomNavigationBar
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // Update current index
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getdata(),
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, -3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: BottomNavigationBar(
              currentIndex: _currentIndex, // Set the current index
              onTap: onTabTapped, // Handle tap on BottomNavigationBar
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 30),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart, size: 30),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 30),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: const Color.fromARGB(255, 238, 167, 52),
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType
                  .fixed, // Keep all items on the bottom bar
              iconSize: 30,
              elevation: 5,
            ),
          ),
        ),
      ),
    );
  }
}

// A separate widget for the Home content
class HomeContent extends StatelessWidget {
  const HomeContent(
      {super.key}); // Use const constructor for better performance

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(); // Controller for PageView
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

    final List<String> _dropdownItems = [
      'New York, USA',
      'EGY',
      'UEA',
      'SUA',
      'CHINA',
      'INDIA'
    ];
    int i = 0 ;
    String? _selectedItem = _dropdownItems[i];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(height: 15),
          const Center(
            child: Text(
              "Delivery To",
              style: TextStyle(color: Color.fromARGB(255, 238, 167, 52)),
            ),
          ),
          SizedBox(
            height: 60,
            child: DropdownButton<String>(
              value: _selectedItem,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 40,
              elevation: 16,
              style: const TextStyle(color: Colors.black, fontSize: 20),
              isExpanded: true,
              items:
                  _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                _selectedItem = value; // Update selected item
              },
            ),
          ),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(10, 10),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: SizedBox(
              height: 250,
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
              ),
            ),
          ),
          // SmoothPageIndicator
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: images.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.blue,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Featured \nPartners",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(
                      color: Color.fromARGB(255, 238, 167, 52), fontSize: 18),
                ),
              ),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        // Navigate to the product details screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              imageUrl: user.strMealThumb,
                              productName: user.strMeal,
                              productDescription:
                                  "Description of ${user.strMeal}", // You can modify this based on your API data
                            ),
                          ),
                        );
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
                                  user.strMealThumb,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(user.strMeal,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Text("",
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
    );
  }
}
