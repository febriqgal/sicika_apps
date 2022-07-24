import 'package:ciptakarya/app/modules/akun/views/akun_view.dart';
import 'package:ciptakarya/app/modules/datasatu/views/datasatu_view.dart';
import 'package:ciptakarya/app/modules/home/views/homeutama.dart';
import 'package:ciptakarya/app/modules/semuaberita/views/semuaberita_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final hiddenBottom = ScrollController();
  List<Widget> buildPage = <Widget>[
    const Homeutama(),
    const SemuaberitaView(),
    const DatasatuView(),
    const AkunView(),
  ];
  void onItemTapped(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPage[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        showUnselectedLabels: true,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Berita',
            icon: Icon(
              Icons.newspaper,
            ),
          ),
          BottomNavigationBarItem(
            label: 'SatuData ',
            icon: Icon(
              Icons.data_object,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Akun',
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
