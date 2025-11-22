import 'package:cloneyoutube/library.dart';
import 'package:cloneyoutube/mail.dart';
import 'package:cloneyoutube/main.dart';
import 'package:cloneyoutube/subscription.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
   
   int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffEBF2F2),
          elevation: 0.0,
          title: Row(
            children: [
              Image.asset('assets/logoyoutube.png', height: 50, width: 50),
              SizedBox(width: 5),
              Text(
                'YouTube',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                Icon(FontAwesomeIcons.video, size: 20, color: Colors.black45),
                SizedBox(width: 25),
                Icon(
                  FontAwesomeIcons.searchengin,
                  size: 20,
                  color: Colors.black45,
                ),
                SizedBox(width: 25),
                Icon(FontAwesomeIcons.user, size: 20, color: Colors.black45),
                SizedBox(width: 25),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(color: Colors.red),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped, 
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
                },
              
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.house),
              ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Trending()));
                },
              
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.fire),
              ),
              ),
              label: 'Trending',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Subscription()));
                },
              
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.video_call_rounded),
              ),
              ),
              label: 'Subscription',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mail()));
                },
              
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.mail),
              ),
              ),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Folder()));
                },
              
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.folder),
              ),
              ),
              label: 'Library',
            ),
          ],
        ),
      ),
    );
  }
}