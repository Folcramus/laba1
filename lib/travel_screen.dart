import 'package:flutter/material.dart';
import 'package:laba1/trip_list.dart';

// StatefulWidget, т.к. будет использоваться TabController
class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key});

  @override
  TravelScreenState createState() => TravelScreenState();
}

// Состояние для TravelScreen с миксином SingleTickerProviderStateMixin
class TravelScreenState extends State<TravelScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 2, vsync: this);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Верхняя панель приложения (AppBar)
      appBar: AppBar(
      backgroundColor: Color.fromARGB(228, 21, 27, 49),
        toolbarHeight: 100.0, // Высота панели
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
        // Иконка/логотип справа
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 90.0,
              child: ClipRRect(
                child: Image.asset(
                  'travel_logo.png', 
                  width: 78,
                  height: 78,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        // Нижняя часть AppBar — TabBar
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
                    offset: const Offset(-4, 4),
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
                  color: Colors.white, // Индикатор активной вкладки
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
      // Основное содержимое экрана
      body: TabBarView(
      
        controller: _tabController, 
       children: [
          Container(
            color: const Color.fromARGB(228, 21, 27, 49),
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: Text(
                "No memories yet.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          TripListScreen(),
        ],

      ),
      // Нижняя навигация (меню)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 78, 137, 232),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.support), label: "Assistance"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Premium"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      // Кнопка добавления воспоминаний
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: FloatingActionButton.extended(
          onPressed: () {}, // Пока не реализована логика
          backgroundColor: Color.fromARGB(255, 78, 137, 232),
          label: Text(
            "Add memories",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}