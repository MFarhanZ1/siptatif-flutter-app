import 'package:flutter/material.dart';
import 'package:siptatif_app/dialogs/preview_profile_pict.dart';

import 'package:siptatif_app/screens/beranda_screen.dart';
import 'package:siptatif_app/screens/login_screen.dart';
import 'package:siptatif_app/screens/mahasiswa_screen.dart';
import 'package:siptatif_app/screens/penguji_screen.dart';
import 'package:siptatif_app/screens/pembimbing_screen.dart';

import 'package:siptatif_app/datas/user_data.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> _widgetBody = [
    HomeScreen(),
    MahasiswaScreen(),
    PengujiScreen(),
    PembimbingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        key: _scaffoldKey,
        appBar: _appBar(),
        drawer: _drawer(),
        body: _widgetBody[_selectedIndex],
        bottomNavigationBar: _bottomNavigationBar(),

      // initialRoute: '/home',
      // routes: {
      //   '/home': (context) => HomeScreen(),
      //   '/mahasiswa': (context) => MahasiswaScreen(),
      //   '/penguji': (context) => PengujiScreen(),
      //   '/pembimbing': (context) => PembimbingScreen(),
      // },

    );
  }

  /////////////////////////////////////////////////////////////////////////////
  /// Bottom Navigation Bar Assets
  ////////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  int _selectedIndex = 0;

  void _onItemTapped(index){
    setState((){
      _selectedIndex = index;
    });
  }

  SizedBox _bottomNavigationBar() {
    return SizedBox(
      height: 110,
      child: BottomNavigationBar(

        elevation: 30,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: [
          _bottomBarItem(
              icon: "assets/svgs/beranda-icon.svg",
              label: "Beranda"),
          _bottomBarItem(
              icon: "assets/svgs/mahasiswa-icon.svg",
              label: "Mahasiswa"),
          _bottomBarItem(
              icon: "assets/svgs/penguji-icon.svg",
              label: "Penguji"),
          _bottomBarItem(
              icon: "assets/svgs/pembimbing-icon.svg",
              label: "Pembimbing"),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomBarItem(
      {required String icon, required String label}
      ) {

    return BottomNavigationBarItem(

      icon: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: 45.0,
            height: 45.0,
          ),
          Text(label, style: _botNavMenuTextStyle,),
        ],
      ),

      activeIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          width: 90,
          height: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
              border: const Border(
                bottom: BorderSide(
                    color: Colors.black,
                    width: 3.0
                ),
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 45.0,
                  height: 45.0,
                ),
                Text(label, style: _botNavMenuTextStyle,),
              ],
            ),
          ),
        ),
      ),
      label: label,
    );

  }

  final TextStyle _botNavMenuTextStyle = const TextStyle(
    fontSize: 12.0,
    color: Colors.black,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.6,
  );

  /////////////////////////////////////////////////////////////////////////////
  /// Top Navigation Bar Assets
  ////////////////////////////////////////////////////////////////////////////

  AppBar _appBar() {
    return AppBar(
      leading: Row(

        children: [

          Container(
            width: 4.0,
          ),

          IconButton(

            padding: const EdgeInsets.only(top: 1.7),
            onPressed: () {
              print("menu bar pressed");
              _scaffoldKey.currentState?.openDrawer();
            },

            icon: SvgPicture.asset(
              'assets/svgs/menu-icon.svg',
              width: 25.0,
              height: 15.0,
            ),
          ),

          Container(
            width: 3.0,
          ),

          Text(
            'SIPTATIF',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              letterSpacing: -0.8,
            ),
          )
        ],
      ),

      leadingWidth: 180,

      actions: [
        InkWell(
          onLongPress:  () async {
            await showDialog(
              context: context,
              builder: (_) => PreviewProfilePictDialog(imgFile: userData.profilePict)
            );
          },
          onTap: (){

            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Warning: Log-Out Confirmation!'),
                content: const Text('Apakah anda yakin ingin log-out dari akun anda?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text('Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Text('OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              )
            );
          },

          child: CircleAvatar(
            backgroundImage: AssetImage(
                "${userData.profilePict}"
            ),
            radius: 21,
          ),
        ),
        // Icon(
        //   Icons.account_circle_rounded,
        //   size: 40,
        //   color: Colors.grey[850],
        // ),

        Container(
          width: 11.0,
        ),

      ],

      // shape: const Border(
      //   bottom: BorderSide(
      //       color: Colors.black,
      //       width: 1.0
      //   ),
      // ),

      backgroundColor: Colors.grey[200],
      elevation: 3,
    );
  }

  Drawer _drawer() {
    return Drawer(

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0)),
      ),

      child: ListView(
        padding: EdgeInsets.zero,

        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
            child: SizedBox(
              height: 205,
              child: DrawerHeader(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (_) => PreviewProfilePictDialog(imgFile: userData.profilePict)
                            );
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "${userData.profilePict}"
                            ),
                            radius: 33,
                          ),
                        ),
                        const Spacer(
                          flex: 90,
                        ),

                        IconButton.outlined(
                          onPressed: () {
                            _scaffoldKey.currentState?.closeDrawer();
                          },
                          icon: const Icon(Icons.keyboard_double_arrow_right_rounded, size: 25),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${userData.fullName}',
                      style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: -0.5),
                    ),
                    Text(
                      '${userData.email}',
                      style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: -0.5),
                    ),
                    Container(
                      height: 7,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.pending_actions, size: 20,),
                            Container(width: 7,),
                            Text('${userData.roles}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.4
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          ListTile(
            leading: SvgPicture.asset("assets/svgs/beranda-icon.svg", width: 25,),
            title: const Text('Beranda'),
            onTap: () => {
              _onItemTapped(0),
              _scaffoldKey.currentState?.closeDrawer(),
            },          ),
          ListTile(
            leading: SvgPicture.asset("assets/svgs/mahasiswa-icon.svg", width: 25,),
            title: const Text('Mahasiswa'),
            onTap: () => {
              _onItemTapped(1),
              _scaffoldKey.currentState?.closeDrawer(),
            },          ),
          ListTile(
            leading: SvgPicture.asset("assets/svgs/penguji-icon.svg", width: 25,),
            title: const Text('Penguji'),
            onTap: () => {
              _onItemTapped(2),
              _scaffoldKey.currentState?.closeDrawer(),
            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/svgs/pembimbing-icon.svg", width: 25,),
            title: const Text('Pembimbing'),
            onTap: () => {
              _onItemTapped(3),
              _scaffoldKey.currentState?.closeDrawer(),
            },
          ),
          Builder(
              builder: (context) {
                return ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Logout'),
                  onTap: () => {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Warning: Log-Out Confirmation!'),
                        content: const Text('Apakah anda yakin ingin log-out dari akun anda?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                            ),
                            child: const Text('Cancel',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(context, "/login");
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green),
                            ),
                            child: const Text('OK',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  },
                );
              }
          ),
        ],
      ),

    );
  }
}
