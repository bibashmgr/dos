import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// constants
import 'package:client/utils/constants.dart';

// screens
import 'package:client/screens/main_screen/sub_screen/home.dart';
import 'package:client/screens/main_screen/sub_screen/profile.dart';
import 'package:client/screens/main_screen/sub_screen/create_task.dart';

// icons
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: kLightColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.75,
        toolbarHeight: 75,
        backgroundColor: kLightColor,
        title: Text(
          _selectedIndex == 0 ? "Home" : "Profile",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
            color: kDarkColor,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: kDarkColor,
                size: 20.0,
              ),
            ),
          )
        ],
      ),
      body: _selectedIndex == 0 ? const HomeScreen() : const ProfileScreen(),
      bottomNavigationBar: Container(
        height: 70.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5.0,
              blurRadius: 10.0,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0.0,
            iconSize: 22.0,
            backgroundColor: kLightColor,
            selectedItemColor: kSelectedColor,
            unselectedItemColor: kUnselectedColor,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.userLarge),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 65.0,
        height: 65.0,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              builder: (BuildContext context) {
                return const FractionallySizedBox(
                  heightFactor: 0.925,
                  child: CreateTask(),
                );
              },
            );
          },
          backgroundColor: kDarkColor,
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: const FaIcon(
            FontAwesomeIcons.plus,
            color: kLightColor,
            size: 22.0,
          ),
        ),
      ),
    );
  }
}
