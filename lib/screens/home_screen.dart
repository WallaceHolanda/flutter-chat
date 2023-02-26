import 'package:flutter/material.dart';
import 'package:flutter_chat/helpers.dart';
import 'package:flutter_chat/pages/calls_page.dart';
import 'package:flutter_chat/pages/contacts_page.dart';
import 'package:flutter_chat/pages/messages_page.dart';
import 'package:flutter_chat/pages/notifications_page.dart';
import 'package:flutter_chat/screens/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> pageTitle = ValueNotifier('Messages');

  final pageTitles = const [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts',
  ];

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  void onNavigationItemSelected(int index) {
    pageIndex.value = index;
    pageTitle.value = pageTitles[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: pageTitle,
          builder: (context, value, _) {
            return Center(
              child: Text(
                value,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.search,
            onTap: () => debugPrint('Cliquei..'),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(url: Helpers.randomPictureUrl()),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        onItemSelected: onNavigationItemSelected,
      ),
    );
  }
}
