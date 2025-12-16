import 'package:flutter/material.dart';

class Lab8 extends StatelessWidget
{
  const Lab8({super.key});

  @override
  Widget build(BuildContext context)
  {
    // Ті самі параметри, що і в 6 лабі, але у власному віджеті
    const double gapK = 100;
    const double gapC = 200;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 5),

                const MyCustomCard(
                  text: "Ще не вмерла Україна, і слава, і воля...",
                  bgColor: Colors.yellow,
                  width: 100,
                  height: 250,
                ),
                SizedBox(width: gapK),
                const MyCustomCard(
                  text: "Згинуть наші вороженьки, як роса на сонці...",
                  bgColor: Colors.lightBlueAccent,
                  width: 200,
                  height: 250,
                ),
              ],
            ),
            SizedBox(height: gapC),
            Align(
              alignment: Alignment.centerRight,
              child: MyCustomCard(
                text: "І покажем, що ми, браття, козацького роду.",
                bgColor: Colors.white,
                width: 200,
                height: 150,
                hasBorder: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Власний Stateless віджет
class MyCustomCard extends StatelessWidget
{
  final String text;
  final Color bgColor;
  final double width;
  final double height;
  final bool hasBorder;

  const MyCustomCard({
    super.key,
    required this.text,
    required this.bgColor,
    required this.width,
    required this.height,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        border: hasBorder ? Border.all(color: Colors.black, width: 1) : null,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
}
