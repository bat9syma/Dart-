import 'package:flutter/material.dart';

class Lab9 extends StatelessWidget
{
  const Lab9({super.key});

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(width: 5),
                // Використання власного Stateful віджету
                MyActiveCard(
                  initialText: "Ще не вмерла Україна...",
                  cardColor: Colors.yellow,
                  width: 100,
                  height: 250,
                ),
                SizedBox(width: 100), // gap k
                MyActiveCard(
                  initialText: "Згинуть наші вороженьки...",
                  cardColor: Colors.lightBlueAccent,
                  width: 200,
                  height: 250,
                ),
              ],
            ),
            const SizedBox(height: 200),
            const Align(
              alignment: Alignment.centerRight,
              child: MyActiveCard(
                initialText: "І покажем, що ми, браття...",
                cardColor: Colors.white,
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

// Власний Stateful віджет
class MyActiveCard extends StatefulWidget
{
  final String initialText;
  final Color cardColor;
  final double width;
  final double height;
  final bool hasBorder;

  const MyActiveCard({
    super.key,
    required this.initialText,
    required this.cardColor,
    required this.width,
    required this.height,
    this.hasBorder = false,
  });

  @override
  State<MyActiveCard> createState() => _MyActiveCardState();
}

class _MyActiveCardState extends State<MyActiveCard>
{
  // Змінна стану: чи є текст жирним
  bool isBold = false;

  void _toggleBold()
  {
    setState(()
    {
      isBold = !isBold;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: _toggleBold, // Зміна стану при натисканні
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.cardColor,
          border: widget.hasBorder ? Border.all(color: Colors.black) : null,
          boxShadow: isBold
              ? [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)]
              : [],
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              widget.initialText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Text(
              isBold ? "(Clicked!)" : "(Tap me)",
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
