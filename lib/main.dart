import 'package:chat_ui/users.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "SourceSansPro"),
      home: Home(),
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 30),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      drawer: Container(
        width: MediaQuery.of(context).size.width * .7,
        decoration: BoxDecoration(
          color: darkColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SafeArea(
            child: Column(
              children: [
                IconText(
                  iconData: Icons.settings,
                  text: "Setting",
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("images/AnimeX_908706.jpeg"),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Shogun",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 30),
                IconText(
                  iconData: Icons.vpn_key,
                  text: "Account",
                ),
                const SizedBox(height: 10),
                IconText(
                  iconData: Icons.chat_bubble,
                  text: "Chats",
                ),
                const SizedBox(height: 10),
                IconText(
                  iconData: Icons.notifications,
                  text: "Notifications",
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                IconText(
                  iconData: Icons.people,
                  text: "Invite friends",
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: darkColor,
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
              );
            }),
            elevation: .0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: TabBar(
              isScrollable: true,
              controller: tabController,
              indicatorColor: darkColor,
              indicatorWeight: 0.0001,
              tabs: List<Widget>.generate(6, (index) {
                final List<String> tabsStrings = [
                  "Messages",
                  "Online",
                  "Groups",
                  "Calls",
                  "Status",
                  "Profile"
                ];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    tabsStrings[index],
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: index == tabController.index
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                );
              }),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: onlineBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Favorite contacts",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OnlineItem();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final User user = users[index];
                return ListItem(
                  user: user,
                  index: index,
                );
              },
              childCount: users.length,
            ),
          ),
          if (users.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: onlineBg,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
            )
          else
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(color: Colors.white),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: onlineBg,
        child: Icon(Icons.edit),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  final User user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Chat(user)));
      },
      child: Container(
        color: onlineBg,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: index == 0
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                : BorderRadius.zero,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(user.asset),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.lastText,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(user.lastTime),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: onlineBg,
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      user.unread.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnlineItem extends StatelessWidget {
  const OnlineItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage("images/AnimeX_908706.jpeg"),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "July",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
