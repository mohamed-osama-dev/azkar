import 'package:flutter/material.dart';
import 'materialList.dart';

class Sebaha extends StatefulWidget {
  const Sebaha({super.key});

  @override
  State<Sebaha> createState() => _SebahaState();
}

class _SebahaState extends State<Sebaha> {
  TextEditingController addChangeTxt = TextEditingController();

  String? txtAdd;
  int counter = 0;

  Widget funTxtAdd() {
    if (txtAdd == null) {
      return const Text(' ');
    } else {
      return Card(
        color: const Color.fromARGB(255, 212, 212, 212),
        child: ListTile(
          leading: IconButton(
              iconSize: 25,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              },
              icon: const Icon(Icons.refresh_outlined)),
          trailing: IconButton(
              iconSize: 25,
              color: Colors.red,
              onPressed: () {
                setState(() {
                  txtAdd = null;
                });
              },
              icon: const Icon(Icons.disabled_by_default_rounded)),
          title: Center(
            child: Text(
              txtAdd!,
              style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: const Text(
          'أَضِفْ',
          style: TextStyle(
            fontSize: 18,
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
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: TextField(
                  controller: addChangeTxt,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: ListView.builder(
                                    itemCount: sugg.length,
                                    itemBuilder: (context, index) {
                                      return TextButton(
                                          onPressed: () {
                                            setState(() {
                                              txtAdd = sugg[index];
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                color: Colors.teal,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            alignment: Alignment.center,
                                            child: Text(
                                              sugg[index],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 2,
                                                    color: Colors.black38,
                                                    offset: Offset(1.5, 2.5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ));
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text('⬅️مُقْترَح')),
                  ],
                ),
                actions: [
                  Card(
                    color: Colors.blue,
                    child: MaterialButton(
                      child: const Text(
                        'أَضِفْ',
                        style: TextStyle(
                          fontSize: 18,
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
                      onPressed: () {
                        setState(() {
                          if (addChangeTxt.text != '') {
                            txtAdd = addChangeTxt.text;
                          }
                        });
                      },
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.asset(
              'images/tasbih.png',
              width: 36,
              height: 36,
              fit: BoxFit.contain,
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          '  تسبيح مطلق',
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 500, height: 220, child: funTxtAdd()),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 173, 95),
                  minimumSize: const Size(300, 300),
                  shape: const CircleBorder(),
                ),
                // color: Colors.black,
                child: Text(
                  '$counter',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 35),
                ),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
