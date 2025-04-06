import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelScreen(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
      ),
    );
  }
}

class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TravelScreenState createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
          title: const Text(
                  "Your dream travels in one place",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
  
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 90.0,
                
                child: ClipRRect(
                
                  child: Image.asset(
                    'travel_logo.png',  // Путь к картинке
                    width: 78,              // Размер картинки
                    height: 78,
                    fit: BoxFit.cover,      // Масштабирование
                      ),
                    ),
                    ),
                  ),
                ],
                    bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(230, 231, 233, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                        color: Colors.black,
                        offset: const Offset(-4, 4), // Влево и вниз
                        blurRadius: 6,
                        spreadRadius: 1,
                        
                        ),
                      ],
                    ),
                    child: TabBar(
                      padding: const EdgeInsets.all(3),
                      dividerColor: Colors.transparent,
                      controller: _tabController,
                      indicator: BoxDecoration(
                        
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelColor: Colors.black,
                      unselectedLabelColor: const Color.fromARGB(255, 0, 0, 0),
                      tabs: const [
                        Tab(text: "Trips"),
                        Tab(text: "Memories"),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
              body: TabBarView(
                controller: _tabController,
                
                children: [
                  Center(child: Text("No memories yet.")),
                  TripList()
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white, // Устанавливаем белый фон
                type: BottomNavigationBarType.fixed, // Чтобы фон полностью был белым
                selectedItemColor: const Color.fromARGB(255, 78, 137, 232), // Цвет выбранного элемента
                unselectedItemColor: Colors.grey, // Цвет невыбранных элементов
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Calendar"),
                  BottomNavigationBarItem(icon: Icon(Icons.support), label: "Assistance"),
                  BottomNavigationBarItem(icon: Icon(Icons.star), label: "Premium"),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
                ],
              ),
              floatingActionButton:  Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: Color.fromARGB(255, 78, 137, 232),
              
                label: Text("Add memories",
                style: TextStyle(
                  color: Colors.white
                ),),
              ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            );
          }
        }

        class TripList extends StatelessWidget {
          const TripList({super.key});

          @override
          Widget build(BuildContext context) {
            return ListView(
              padding: const EdgeInsets.all(16.0),
              
              children: [
                travelCard("My first travel with my wife and kids", "08.08.2023 - 30.08.2023", "trip1.png"),
                travelCard("My second travel with my wife and kids", "08.08.2023 - 30.08.2023", "trip2.png"),
              ],
            );
          }

          Widget travelCard(String title, String date, String imagePath) {
            return Card(
              
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              color: Color.fromARGB(255, 240, 240, 242),
              child: ListTile(
                
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
                ),
                title: Text(title, 
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                subtitle: Text(date),
              ),
            );
          }
        }
