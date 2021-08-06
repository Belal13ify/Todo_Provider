import 'package:flutter/material.dart';
import '/screens/all.dart';
import '/screens/complete.dart';
import '/screens/incomplete.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Complete",
              ),
              Tab(
                text: "Incomplete",
              ),
            ],
          ),
          title: Text("Provider Todo App"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => AddTodo());
          },
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TabBarView(
            children: [All(), Complete(), Incomplete()],
          ),
        )),
      ),
    );
  }
}
