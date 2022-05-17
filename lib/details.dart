import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../info.dart';
import '../../person.dart';
import '../../details.dart';
import '../../coffee.dart';



class DetailPage extends StatefulWidget {
    final String title;
    final String location;
    final String information;
    final String rating;
    final String image1;

    const DetailPage({Key? key, required this.title, required this.location, required this.information, required this.rating, required this.image1}) 
        : super(key: key);

    @override
    _DetailPageState createState() => _DetailPageState();
}

// details page 
class _DetailPageState extends State<DetailPage> {
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
                        DetailHeader(title: widget.title, location: widget.location),
                        const SizedBox(height: 15),
                        SectionTitle(image1: widget.image1),
                        
                        //const PhotoList(),
                        
                        // suggestion text 
                        DetailInfo(
                            title: 'Information',
                            information: widget.information,
                            rating: widget.rating,
                        ),
                        const SizedBox(height: 20),
                        const DetailFooter(),
                    ],
                ),
            ),
        );
    }
}

// header
class DetailHeader extends StatelessWidget {
  final String title;
  final String location;

  DetailHeader({Key? key, required this.title, required this.location}) : super(key: key);

  Color _iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical:0),
      child: Column(
        children: [
          const SizedBox(height: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// info 
class DetailInfo extends StatelessWidget {
  final String title;
  final String information;
  final String rating;
  

  const DetailInfo({Key? key, required this.title, required this.information, required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            information,
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            rating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}



// section 

class SectionTitle extends StatelessWidget {
  final String image1;

  SectionTitle({Key? key, required this.image1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 200,
              width: 280,
              child: Image.asset(image1),
                    ),
        ],
      ),
    );
  }
}

// footer 
class DetailFooter extends StatelessWidget {
  const DetailFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/profile.png'),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Cherry Chen',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Love it!',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset('assets/icons/like.svg'),
        ],
      ),
    );
  }
}