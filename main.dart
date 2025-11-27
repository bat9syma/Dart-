import 'package:flutter/material.dart';

void main()
{
  runApp(const SingersApp());
}

// Модель даних
class Singer
{
  final String name;
  final String description;
  final String assetPath;
  final String fact;

  const Singer({
    required this.name,
    required this.description,
    required this.assetPath,
    required this.fact,
  });
}

// Головний віджет застосунку
class SingersApp extends StatelessWidget
{
  const SingersApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Ukrainian singers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SingerListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Головний екран зі списком
class SingerListPage extends StatefulWidget
{
  const SingerListPage({super.key});

  @override
  State<SingerListPage> createState() => _SingerListPageState();
}

class _SingerListPageState extends State<SingerListPage>
{

  // Список даних
  final List<Singer> singers = const [
    Singer(
      name: 'Svyatoslav Vakarchuk',
      description: 'Frontman of the band "Ocean Elzy"',
      assetPath: 'assets/images/vokarchuk.jpg',
      fact: 'He has a PhD in Physics and Mathematics.',
    ),
    Singer(
      name: 'Jamala',
      description: 'Eurovision winner 2016',
      assetPath: 'assets/images/jamala.jpg',
      fact: 'Born in Kyrgyzstan into a Crimean Tatar family.',
    ),
    Singer(
      name: 'Go_A (Kateryna Pavlenko)',
      description: 'Electro-folk band, Eurovision participants',
      assetPath: 'assets/images/go_a.webp',
      fact: 'Their song "Shum" went viral and hit the world charts.',
    ),
    Singer(
      name: 'Tina Karol',
      description: 'Pop singer and TV presenter',
      assetPath: 'assets/images/tina.jpg',
      fact: 'She was a coach on the Ukrainian version of the show "The Voice of the Nation" a record number of times.',
    ),
    Singer(
      name: 'MONATIK',
      description: 'Singer, dancer, presenter',
      assetPath: 'assets/images/monatik.jpg',
      fact: 'He began his career as a dancer, and then became a successful singer and composer.',
    ),
    Singer(
      name: 'Andriy "Kuzma" Skryabin',
      description: 'Legendary musician, writer, TV presenter',
      assetPath: 'assets/images/kuzma.jpg',
      fact: 'Author of several popular books, including the autobiographical "I, Victory and Berlin", which was made into a film.',
    ),
  ];

  int? _selectedIndex;
  final Set<int> _visibleFacts = {};

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ukrainian singers'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: singers.length,
        itemBuilder: (BuildContext context, int index) {
          final singer = singers[index];
          final bool isSelected = _selectedIndex == index;

          final bool isFactVisible = _visibleFacts.contains(index);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            elevation: isSelected ? 8.0 : 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: isSelected
                  ? const BorderSide(color: Colors.blueAccent, width: 2.5)
                  : BorderSide.none,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected: ${singer.name}'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Photo
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isFactVisible) {
                            _visibleFacts.remove(index);
                          } else {
                            _visibleFacts.add(index);
                          }
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          singer.assetPath,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: double.infinity,
                                height: 200,
                                color: Colors.grey[300],
                                child: Icon(Icons.broken_image, size: 50, color: Colors.grey[600]),
                              ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Name
                    Text(
                      singer.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Description
                    Text(
                      singer.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),

                    // Fact
                    Visibility(
                      visible: isFactVisible,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: isFactVisible ? 1.0 : 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Fact: ${singer.fact}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}