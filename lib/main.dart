import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
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
  @override
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
  title: const Text("Your dream travels in one place"),
  
  actions: [
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
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
        bottom: TabBar(
          controller: _tabController,
          padding: const EdgeInsets.all(8.0),
          
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(40), 
            color: Colors.white,
        
            ),
            labelColor: Colors.black, // Цвет текста активного таба
        unselectedLabelColor: const Color.fromARGB(255, 255, 255, 255), // Цвет текста неактивного таба
          tabs: const [
            Tab(text: "Trips"),
            Tab(text: "Memories"),
          ],
         
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
         selectedItemColor: Colors.grey, // Цвет выбранного элемента
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        travelCard("My first travel with my wife and kids", "08.08.2023 - 30.08.2023", "assets/trip1.jpg"),
        travelCard("My second travel with my wife and kids", "08.08.2023 - 30.08.2023", "assets/trip2.jpg"),
      ],
    );
  }

  Widget travelCard(String title, String date, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
        ),
        title: Text(title),
        subtitle: Text(date),
      ),
    );
  }
}
