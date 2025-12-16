import 'package:flutter/material.dart';

class Lab7 extends StatelessWidget
{
  const Lab7({super.key});

  @override
  Widget build(BuildContext context)
  {
    // Розміри
    const double a = 20;
    const double b = 30;
    const double c = 60;

    return Center(
      child: Container(
        // Загальний контейнер для обмеження області малювання
        width: 350,
        height: 250,
        color: Colors.grey[200], // Фоновий колір
        child: Stack(
          children: [
            // 1. Жовтий фон (основа)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.yellow,
            ),

            // 2. Червоний шар (зсунутий на a)
            Positioned(
              top: a,
              left: a,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.red,
              ),
            ),

            // 3. Синій шар
            Positioned(
              top: a + b,
              left: a + b,
              right: 0,
              bottom: 0,
              child: Container(
                height: c,
                color: Colors.lightBlue,
              ),
            ),

            // 4. Текст RichText (Hi! NLTU)
            Positioned(
              top: 0, // Вирівнювання по верхньому краю жовтого блоку
              right: 10,
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 20),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Hi! ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'NLTU',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
