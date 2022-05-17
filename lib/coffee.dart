import 'package:flutter/material.dart';
import '../../person.dart';
import '../../info.dart';
import '../../details.dart';
import '../../coffee.dart';



class CoffeePage extends StatefulWidget {
    final String title;
    final String price;
    final String description;
    final String image;

    const CoffeePage({Key? key, required this.title, required this.price, required this.description, required this.image}) 
        : super(key: key);

    @override
    _CoffeePageState createState() => _CoffeePageState();
}

// details page 
class _CoffeePageState extends State<CoffeePage> {
  bool addtofavorite = false;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap:(){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 24), 
            ), // icon -- push back
            title: Text(
              'Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ), // title text 
            actions: <Widget> [
              IconButton(
                color: Colors.red,
                icon: addtofavorite ? Icon(Icons.favorite_rounded, size: 24) : Icon(Icons.favorite_outline_rounded, size: 24),
                tooltip: 'Add to Favorite',
                onPressed: (){
                  setState(() {
                    addtofavorite = !addtofavorite;
                  });
                },
              ), // favorite button
            ], // widget
          ), // appbar
            body: SafeArea(
                child: ListView(
                    children: [
                        DetailName(title: widget.title),
                        DetailInfo(
                            price: widget.price,
                            description: widget.description,
                            image: widget.image
                        ),
                        const SizedBox(height: 25),
                        const SectionTitle(),
                        const SizedBox(height: 25),
                        const SizeList(),
                        const SizedBox(height: 20),
                        const CoffeePop(),
                    ],
                ),
            ),
        );
    }
}



// name 
class DetailName extends StatelessWidget {
    final String title;

    DetailName({Key? key, required this.title}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Enjoy your coffee',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
    }

}


// info 
class DetailInfo extends StatelessWidget {
  final String price;
  final String description;
  final String image;

  const DetailInfo({Key? key, required this.price, required this.description, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            price,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
              height: 280,
              width: 280,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(image),
                      ),
                    ),
          const SizedBox(height: 30),
          Text(
            description,
            //textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}


//  Select size
class SizeList extends StatelessWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                          MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color.fromRGBO(139,69,0,10),
                              ),
                            ),
                            splashColor: Colors.grey,
                            highlightColor: Colors.black,
                            child: Text(
                              "Small",
                              style: TextStyle(
                                color: Color.fromRGBO(238,154,0,10),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color.fromRGBO(139,69,0,10),
                              ),
                            ),
                            splashColor: Colors.grey,
                            highlightColor: Colors.black,
                            child: Text(
                              "Medium",
                              style: TextStyle(
                                color: Color.fromRGBO(238,154,0,10),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color.fromRGBO(139,69,0,10),
                              ),
                            ),
                            splashColor: Colors.grey,
                            highlightColor: Colors.black,
                            child: Text(
                              "Large",
                              style: TextStyle(
                                color: Color.fromRGBO(238,154,0,10),
                              ),
                            ),
                          ),
                        ],
                      ),
    );
  }
}

// section title -- integradiants

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Select your size',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}



// footer  -- "Order now" button 弹窗测试 
class CoffeePop extends StatelessWidget {
  const CoffeePop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Payment Successful'),
                                content: const Text('Thank you for your ordering!'),
                                actions: <Widget> [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                            height: 55,
                            minWidth: 150,
                            color: Color.fromRGBO(255,165,0,175),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              "Order Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      )
        ],
      ),
    );
  }
}

