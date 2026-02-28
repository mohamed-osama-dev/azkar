import 'package:azkar/sebha.dart';
import 'package:flutter/material.dart';
import 'materialList.dart';

class ZikrType extends StatefulWidget {
  final String name;
  final List<ZikrItem> zcontent;

  // final List<Azkar> azkarItem;
  const ZikrType({super.key, required this.name, required this.zcontent});

  @override
  State<ZikrType> createState() => _ZikrTypeState();
}

class _ZikrTypeState extends State<ZikrType> {
  double fontZiker = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(12, 50, 12, 0),
              color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          fontZiker -= 1;
                        });
                      },
                      icon: const Icon(Icons.remove)),
                  Text(
                    'حجم الخط',
                    style: TextStyle(
                      fontSize: fontZiker,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          fontZiker += 1;
                        });
                      },
                      icon: const Icon(Icons.add)),
                ],
              ),
            ),
            SingleChildScrollView(
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
                            backgroundColor:
                                const Color.fromARGB(255, 57, 198, 69),

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
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: ListView.builder(
        itemCount: widget.zcontent.length,
        itemBuilder: (context, i) {
          return Card(
            color: const Color.fromARGB(255, 212, 212, 212),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      if (widget.zcontent[i].repeat > 0) {
                        widget.zcontent[i].repeat--;
                      }
                    });
                  },
                  title: Text(
                    widget.zcontent[i].zekr,
                    style: TextStyle(
                      fontSize: fontZiker,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(widget.zcontent[i].bless),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 15),
                  color: Colors.teal,
                  child: Center(
                    child: Text(
                      '${widget.zcontent[i].repeat}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
