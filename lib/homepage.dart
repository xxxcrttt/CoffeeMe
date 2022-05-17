import 'package:flutter/material.dart';
import '../../person.dart';
import '../../info.dart';
import '../../details.dart';
import '../../coffee.dart';



class HomePage extends StatefulWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    _HomePageState createState() => _HomePageState();   
}

class _HomePageState extends State<HomePage> {
    @override
    Widget build (BuildContext context) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: ListView(
                    children: const [
                        HomeHeader(),
                        SizedBox(height:25),
                        SearchBar(),
                        SizedBox(height: 25),
                        SecTitle(title: 'Recommondation'),
                        SizedBox(height: 25),
                        CoffeeList(),
                        SizedBox(height: 25),
                        SecTitle(title: 'Shops near you'),
                        SizedBox(height: 25),
                        ShopList(),
                        SizedBox(height: 25),
                    ],
                ),
            ),
        );
    }
}

// Header 
class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        // 
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.add_location_rounded),
                  SizedBox(width: 6),
                  Text(
                    'LONDON',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.3,
                    ),
                  ),
                ],
              ),
              // navigate to person page 
              MaterialButton(
                  onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder:(context) => Person(),
                          ),
                      );
                  },
                  // set image 
                  child: Image.asset('assets/images/profile.png') //-- circle 
              )
            ],
          ),
          // second column -- 文字
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hello, Cherry !',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Find your coffee',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// Search Bar 
class SearchBar extends StatelessWidget {
    const SearchBar({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                    BoxShadow(
                        color: Colors.brown,
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1),
                    ),
                ],
            ),
            child: const TextField(
                decoration: InputDecoration(
                    hintText: 'Search for coffee',
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                ),
            ),
        );
    }
}

// title -- 小标题
class SecTitle extends StatelessWidget {
    final String title;

    const SecTitle({Key? key, required this.title}) : super(key : key);

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                title,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                ),
            ),
        );
    }
}

// shop list 
class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 30),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: shops.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: shops[index]['title'],
                      location: shops[index]['location'],
                      information: shops[index]['information'],
                      rating: shops[index]['rating'],
                      image1: shops[index]['image1'],
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: 350,
                    width: 240,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        shops[index]['imageUrl'],
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.1),
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shops[index]['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          shops[index]['location'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// COFFEE LIST 
class CoffeeList extends StatelessWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 30),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: coffee.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CoffeePage(
                      title: coffee[index]['title'],
                      price: coffee[index]['price'],
                      description: coffee[index]['description'],
                      image: coffee[index]['imageUrl'],
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        coffee[index]['imageUrl'],
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.1),
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffee[index]['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          coffee[index]['price'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
