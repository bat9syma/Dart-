import 'package:flutter/material.dart';

class Lab6 extends StatelessWidget
{
  const Lab6({super.key});

  @override
  Widget build(BuildContext context)
  {
    // Розміри
    const double b = 250; // Висота верхніх блоків
    const double c = 200; // Відступ між рядами
    const double d = 150; // Висота нижнього блоку
    const double i = 100; // Ширина жовтого блоку
    const double k = 100; // Відступ між верхніми блоками
    const double m = 500; // Ширина синього блоку
    const double n = 5;   // Відступ зліва
    const double p = 4;   // Відступ справа (для нижнього блоку)
    // const double a_min = 20; // Умовний відступ зверху (a=min)

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Верхній ряд (Жовтий та Синій блоки)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: n), // Відступ зліва n

                // Лівий блок (Жовтий)
                Container(
                  width: i,
                  height: b,
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "Ще не вмерла Україна, і слава, і воля, ще нам, браття молодії, усміхнеться доля.",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),

                SizedBox(width: k), // Проміжок k

                // Правий блок (Синій - LightBlue)
                Container(
                  width: m,
                  height: b,
                  color: Colors.blue[200],
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "Згинуть наші вороженьки, як роса на сонці, запануєм і ми, браття, у своїй сторонці.",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),

            SizedBox(height: c), // Вертикальний відступ c

            // Нижній блок (Білий з рамкою)
            Row(
              children: [
                const Spacer(),
                Container(
                  width: m,
                  height: d,
                  margin: const EdgeInsets.only(right: p, left: n),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Text(
                      "І покажем, що ми, браття, козацького роду.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
