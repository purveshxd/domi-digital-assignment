import 'package:domi_labs_assignment/screens/chat_page.dart';
import 'package:domi_labs_assignment/screens/profile_page.dart';
import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ));
                },
                icon: const Icon(Icons.account_circle_outlined)),
            Flexible(
              child: ActionChip(
                side: BorderSide.none,
                elevation: 0,
                labelPadding: const EdgeInsets.only(
                    top: 4, bottom: 4, left: 8, right: 12),
                backgroundColor: Colors.black,
                padding: const EdgeInsets.all(3),
                onPressed: () {},
                shape: const StadiumBorder(),
                label: const Text(
                  "100 Martinique Ave",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
                avatar: const CircleAvatar(),
              ),
            ),
            IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatPage(),
                      ));
                },
                icon: const Icon(Icons.chat_outlined)),
          ],
        ),
      ),
    );
  }
}
