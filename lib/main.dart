import 'package:flutter/material.dart';
import 'package:flutter_music_ui/player_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return const MaterialApp( //MaterialApp est le widget pour l'application flutter
      debugShowCheckedModeBanner: false,
      title: "Sound Player",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold( // Scafold est le widget pour une page
      extendBodyBehindAppBar: true, // nous permet d'etendre la partie body de la page sur l'appBar
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: HomePageBody(),
      bottomNavigationBar: BottomSection(),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);
  Size get preferredSize => new Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0),
      elevation: 0,

      leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          )
      ),
      actions: const [
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            )
        )
      ],
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeaderSection(),
          PlayListSection(),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage("images/pucture.jpg"),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        )
      ),
      child: Stack(
        children:  [
          const Positioned(
            left: 30,
            bottom: 30,
            child: Text(
              'La neige c\'est Belle',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w800
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
              child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                      MaterialPageRoute(
                          builder: (context) => const PlayerPage(),
                      )
                    );
                  },
                  color: Colors.blue,
                  shape: const CircleBorder(),
                  child: const Padding(
                      padding: EdgeInsets.all(17),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                  ),
              ),
          ),
        ],
      ),
    );
  }
}

class PlayListSection extends StatelessWidget {
  const PlayListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List playList = [
      {
        "title": "Song 1",
        "played":false,
        "duration": "3.24"
      },
      {
        "title": "Song 2",
        "played":false,
        "duration": "3.34"
      },
      {
        "title": "Song 3",
        "played":true,
        "duration": "4.00"
      },
      {
        "title": "Song 4",
        "played":false,
        "duration": "3.00"
      },
    ];
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Populaires',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: const Text(
                  'Tous',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Column(
              children: playList.map((song) =>
                  Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          song['title'],
                          style: TextStyle(
                            color: song['played'] ? Colors.blue : Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              song['duration'],
                              style: TextStyle(
                                color: song['played'] ? Colors.blue : Colors.black,
                              ),
                            ),
                            Icon(
                                Icons.more_vert,
                                color: song['played'] ? Colors.blue : Colors.grey,
                            )
                          ],
                        )
                      ],
                    ),
                  )
              ).toList()
          ),
        ],
      ),
    );
  }
}

//Le bottom navigation bar
class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
      BottomNavigationBarItem(
          icon: Icon(
              Icons.pause,
              color: Colors.white,
          ),
        label: " "
      ),
      BottomNavigationBarItem(
          icon: Text(
            "Song 3",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
          ),
        label: " "
      ),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.arrow_circle_up,
            color: Colors.white,
          ),
        label: " "
      ),
    ]);
  }
}


