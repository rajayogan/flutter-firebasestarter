import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'profilepage.dart';
import 'dashboard.dart';
import 'chatpage.dart';
import 'groups.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new Material(
        color: Colors.teal,
        child: TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.home)),
            new Tab(icon: Icon(Icons.chat)),
            new Tab(icon: Icon(Icons.group)),
            new Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          DashboardPage(),
          ChatPage(),
          GroupsPage(),
          ProfilePage()
        ],
      ),
        );
  }
}
