import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/calls_page.dart';
import 'package:flutter_chat/pages/contacts_page.dart';
import 'package:flutter_chat/pages/messages_page.dart';
import 'package:flutter_chat/pages/notifications_page.dart';
import 'package:flutter_chat/screens/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        onItemSelected: (index) => pageIndex.value = index,
      ),
    );
  }
}
