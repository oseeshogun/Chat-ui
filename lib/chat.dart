import 'package:chat_ui/data.dart';
import 'package:chat_ui/users.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.status,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: onlineBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.emoji_emotions,
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.ios_share,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.attach_file,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: onlineBg,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
