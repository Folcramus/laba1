import 'package:flutter/material.dart';
// Данные для списка поездок
final List<String> titles = <String>[
  'My first travel with my wife and kids',
  'My second travel with my wife and kids'
];

final List<String> dates = <String>[
  '08.08.2023 - 30.08.2023',
  '08.08.2023 - 30.08.2023'
];

final List<String> images = <String>[
  'trip1.png',
  'trip2.png'
];

// Виджет, отображающий список поездок
class TripList extends StatelessWidget {
  const TripList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 2, // Количество элементов в списке
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromARGB(255, 240, 240, 242), // Цвет фона карточки
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // Скругление картинки
              child: Image.asset(
                images[index], // Изображение поездки
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              titles[index],
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            subtitle: Text(dates[index]), // Дата поездки
          ),
        );
      },
    );
  }
}