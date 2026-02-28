import 'package:azkar/sebha.dart';
import 'package:flutter/material.dart';
import 'materialList.dart';
import 'zikrScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 42, 158, 117),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 4,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Image.asset(
            'images/beads.png',
            width: 36,
            height: 36,
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'أذكار',
          style: TextStyle(
            fontSize: 33,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.black38,
                offset: Offset(1.5, 2.5),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: azkarr.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 57, 198, 69),
                  margin: const EdgeInsets.fromLTRB(8, 14, 8, 0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 57, 198, 69),

                      minRadius: 10,
                      maxRadius: 25,
                      child: Image.asset(
                        azkarr[index].image,
                        fit: BoxFit.cover,
                      ),
                      // backgroundImage: AssetImage(azkarr[index].image),
                    ),
                    title: Center(
                      child: Text(
                        azkarr[index].title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 2,
                              color: Colors.black38,
                              offset: Offset(1.5, 2.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ZikrType(
                          name: azkarr[index].title,
                          zcontent: azkarr[index].content,
                        ),
                      ));
                    },
                  ),
                );
              },
            ),
            Card(
              color: const Color.fromARGB(255, 57, 198, 69),
              margin: const EdgeInsets.fromLTRB(8, 14, 8, 0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Sebaha(),
                  ));
                },
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 57, 198, 69),
                  minRadius: 10,
                  maxRadius: 25,
                  child: Image.asset(
                    "images/tasbih.png",
                    fit: BoxFit.cover,
                  ),
                  // backgroundImage: AssetImage(azkarr[index].image),
                ),
                title: const Center(
                  child: Text(
                    "سبحة | ذكر مطلق ",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 2,
                          color: Colors.black38,
                          offset: Offset(1.5, 2.5),
                        ),
                      ],
                    ),
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(8, 22, 8, 20),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset('images/hades.png'),
            )
          ],
        ),
      ),
    );
  }
}
