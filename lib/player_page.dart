import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: const [
            ImageAuthor(),
            PlayControl(),
          ],
        ),
      ),
    );
  }
}


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  Size get preferredSize => new Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
      ),
      title: const Text(""),
      actions: const [
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 23,

            )
        )
      ],
      backgroundColor: Colors.white.withOpacity(0),
    );
  }

}

class ImageAuthor extends StatelessWidget {
  const ImageAuthor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/pucture.jpg"),
            fit: BoxFit.cover,
          ),
      ),
      child: Stack(
        children: const [
          TitleSection(),
          ArtistPictureSection()
        ],
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      // color: Colors.blue,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Artist',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white
            ),
          ),

          Text(
            'It\'s snowing',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}

class ArtistPictureSection extends StatelessWidget {
  const ArtistPictureSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 140),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 65.0,
              child: Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50)
                  )
                ),
              )
          ),

          Positioned(
            top: 50,
              child: Container(
                height: 275,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage("images/pucture.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.blue.withOpacity(1),
                        BlendMode.darken,
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50)
                  )
                ),
              )
          )
        ],
      ),
    );
  }
}


class PlayControl extends StatelessWidget {
  const PlayControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          PlayingMusicTitle(),
          MusicSliderSection(),
          DurationSection(),
          MusicControlButtonSection()
        ],
      ),
    );
  }
}

class PlayingMusicTitle extends StatelessWidget {
  const PlayingMusicTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: const [
          Text(
            "Song 3 Joue",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          SizedBox(width: 3),
          Text(
            "Song 3",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}


class MusicSliderSection extends StatelessWidget {
  const MusicSliderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Slider(
        value: 19,
        min: 1,
        max: 100,
        divisions: 10,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        onChanged: (double newValue){},
      ),
    );
  }
}

class DurationSection extends StatelessWidget {
  const DurationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 27, right: 27, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "1.08",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey
            ),
          ),

          Text(
            "3.14",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}

class MusicControlButtonSection extends StatelessWidget {
  const MusicControlButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.shuffle,
                color: Colors.grey,
                size: 35,
              ),
          ),

          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.skip_previous,
              color: Colors.black,
              size: 40,
            ),
          ),

          ElevatedButton(
              onPressed: null,
              child: Container(
                padding: EdgeInsets.all(10),
                child: const Icon(
                  Icons.pause,
                  color: Colors.black,
                  size: 40,
                ),
              ),
          ),

          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.skip_next,
              color: Colors.black,
              size: 35,
            ),
          ),

          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.repeat,
              color: Colors.grey,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}






