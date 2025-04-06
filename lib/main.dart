import 'package:flutter/material.dart';
import 'package:laba1/travel_screen.dart';

void main() {
  runApp(TravelApp()); // Запуск главного виджета приложения
}

// Основной StatelessWidget приложения
class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Убираем баннер отладки
      home: TravelScreen(), // Указываем основной экран
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue, // Устанавливаем тему приложения
      ),
    );
  }
}
