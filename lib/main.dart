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
                Image.asset('assets/images/msg.png'),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.message))],
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
      itemCount: 3,
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
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 30,
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
                radius: 7,
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      YourStory(),
                      Expanded(child: Story())]),
              ),
            ),
            Divider(height: 10),
            Expanded(child: SizedBox()),
            Divider(height: 10),
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
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 40,
      children: [
        IconButton(onPressed: (){}, icon: Image.asset("assets/images/home.png",width: 10,height: 10,)),
        IconButton(onPressed: (){}, icon: Image.asset("images/search-interface-symbol.png",width: 10,height: 10,)),
        IconButton(onPressed: (){}, icon: Image.asset("images/more.png",width: 10,height: 10,)),
        IconButton(onPressed: (){}, icon: Image.asset("images/reel.png",width: 10,height: 10,)),
        IconButton(onPressed: (){}, icon: Image.asset("images/user.png",width: 10,height: 10,)),
      ],
    );
  }
}
