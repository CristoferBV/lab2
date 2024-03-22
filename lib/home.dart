import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(bottomNavigationBar: BottonNavigator());
  }
}

class BottonNavigator extends StatefulWidget {
  const BottonNavigator({super.key});

  @override
  State<BottonNavigator> createState() => _BottonNavigatorState();
}

class _BottonNavigatorState extends State<BottonNavigator> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            title: const Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Sismos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "MAPA",
                    style: TextStyle(color: Color.fromARGB(255, 237, 182, 16)),
                  ),
                ),
                Tab(
                  child: Text("LISTA",
                      style:
                          TextStyle(color: Color.fromARGB(255, 237, 182, 16))),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/Mapa.jpg"),
                            fit: BoxFit.fill)),
                  ),
                  const Positioned(
                      top: 590,
                      left: 75,
                      child: FloatingActionButton.extended(
                        backgroundColor: Colors.amber,
                        onPressed: null,
                        label: Text(
                          '24 horas',
                        ),
                        icon: Icon(Icons.restart_alt),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15))),
                      )),
                  const Positioned(
                      top: 590,
                      left: 199,
                      child: FloatingActionButton.extended(
                          backgroundColor: Color.fromARGB(255, 2, 78, 141),
                          onPressed: null,
                          label: Text('24 horas'),
                          icon: Icon(Icons.restart_alt),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))))),
                ],
              ),
              const Center(
                child: Text("LISTA"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.radar),
            label: 'Sismos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.broadcast_on_personal_rounded),
            label: '¿Lo sentiste?',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            label: 'Más',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
