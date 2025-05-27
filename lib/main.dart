import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Instagram'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//------------ top bar widget--------------

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Image(width: 100,
                image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1280px-Instagram_logo.svg.png"))],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border,size: 25,),)
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Image.asset('assets/images/msg.png',width: 25,),],
          ),
        ],
      ),
    );
  }
}

// --------Story section --------
class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  decoration: BoxDecoration(gradient: LinearGradient(colors: [
                    Color(0xFFf9ce34),
                    Color(0xFFee2a7b),
                    Color(0xFF6228d7),
                  ]),shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 30,
                    ),
                  ),
                ),
                Text("username"),
              ],
            ),
          ],
        );
      },
    );
  }
}

//---------your story--------------
class YourStory extends StatelessWidget {
  const YourStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(width: 20),
            CircleAvatar(radius :30,backgroundColor: Colors.grey),
            Positioned(
              bottom: 5,
              left: 40,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.blue,
                child: Icon(Icons.add, size: 10),
              ),
            ),
          ],
        ),
        Text("your story"),
      ],
    );
  }
}

// --------post section --------
class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [
                      Color(0xFFf9ce34),
                      Color(0xFFee2a7b),
                      Color(0xFF6228d7),
                    ]),shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        foregroundImage: AssetImage("assets/images/person.jpg",),
                        radius: 15,
                      ),
                    ),
                  ),
                ),
                Text("username"),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],
                ))

              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 400,
                    color: Colors.grey[200],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Image.asset("assets/images/heart.png",width: 25)),
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Image.asset("assets/images/chat.png",width: 25)),

                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Image.asset("assets/images/send.png",width: 25)),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      IconButton(onPressed: (){}, icon: Image.asset("assets/images/bookmark.png",width: 25)),
                    ],
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}



//----------MAIN PAGE---------------
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // top bar widget
    // story - list view builder
    //bottom nav bar
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TopBar(),
            Divider(height: 10),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      YourStory(),
                      Expanded(child: Story())]),
              ),
            ),
            Divider(height: 10),
           Expanded(
             child: SizedBox(
               height: 300,
               child: Column(children: [Expanded(child: Posts())],),
             ),
           )
          ],
        ),

        //Bottom navigation bar
        bottomNavigationBar: bottomNav(),
      ),
    );
  }
}

class bottomNav extends StatelessWidget {
  const bottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      children: [
        IconButton(onPressed: (){}, icon: Image.asset("assets/images/home.png",width: 25)),
        IconButton(onPressed: (){}, icon: Image.asset("assets/images/search.png",width: 25)),
        IconButton(onPressed: (){}, icon: Image.asset("assets/images/more.png",width: 25)),
        IconButton(onPressed: (){}, icon: Image.asset("assets/images/reel.png",width: 25)),
        IconButton(onPressed: (){}, icon: Image.asset("assets/images/user.png",width: 25)),
      ],
    );
  }
}
