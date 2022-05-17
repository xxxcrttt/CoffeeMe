//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:ui';



class Person extends StatefulWidget {
    const Person({Key? key}) : super(key: key);

    @override 
    _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
    @override
    Widget build (BuildContext context) {
        return Scaffold(
          resizeToAvoidBottomInset: false, 
            body: SafeArea(
                child: ListView(
                    children: const [
                        PersonHeader(),
                        //SizedBox(height:10),
                        PersonInfo(),
                        //SizedBox(height: 25),
                        PersonFooter(),
                    ],
                ),
            ),
        );
    }
}

// header -- personal  
class PersonHeader extends StatelessWidget {

  const PersonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios_new), 
              ),
              const Text(
                'My Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset('assets/images/profile.png')
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}


// person info
class PersonInfo extends StatelessWidget {
  const PersonInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name 
          Text(
            'Name',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // name 2
          const SizedBox(height: 10),
          Text(
            'Cherry Chen',
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
          // birth
          Text(
            'Birth Date',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // birth 2
          const SizedBox(height: 10),
          Text(
            '25-05-1999',
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
          // phone number 
          Text(
            'Phone Number',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // number 2
          const SizedBox(height: 10),
          Text(
            '+44 07536253090',
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
          // email
          Text(
            'Email Address',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // email 2
          const SizedBox(height: 10),
          Text(
            'ucfnrc0@ucl.ac.uk',
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
          // location
          Text(
            'Location',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // location 2
          const SizedBox(height: 10),
          Text(
            'London',
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
        ]
      )
    );
  }
}


// footer  -- "Order now" button 
class PersonFooter extends StatelessWidget {
  const PersonFooter({Key? key}) : super(key: key);

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
                            onPressed: () {},
                            height: 55,
                            minWidth: 200,
                            color: Color.fromRGBO(55, 22, 17, 175),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              "Edit details",
                              style: TextStyle(
                                color: Colors.white,
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





