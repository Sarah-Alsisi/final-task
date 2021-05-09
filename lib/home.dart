
import 'package:final_task/list/drawer.dart';
import 'package:final_task/list/list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navBarIndex = 0;
  bool checkBoxValue=false;
  addNews(String input) {
    News.homeNews.add(input);
    print(News.homeNews);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = [
      Center(
        child: ListView.builder(
            itemCount: News.homeNews.length,
            itemBuilder: (context, i) => NewsContainer(
              index: i,
            )),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: bodyWidgets[navBarIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.indigo,
          iconSize: 30.0,
          onTap: (index) {
            setState(() {
              navBarIndex = index;
            });
          },
          selectedItemColor: Colors.greenAccent,
          currentIndex: navBarIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              label: 'delete',
            ),
          ],
        ),
        drawer: drawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          //leading: Icon(Icons.description),
          title: Text(" "),
          iconTheme: IconThemeData(color: Colors.teal),
          actions: <Widget>[

            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.teal,
              ),
              onPressed: () {
                // do something
              },
            ),
          ],
        ),
      ),
    );
  }
}



class NewsContainer extends StatelessWidget {
  final int index;

  NewsContainer({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      width: double.infinity,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(11.0),
      decoration: BoxDecoration(
        color: Colors.tealAccent,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: Colors.green, spreadRadius: 1),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (bool value){
            },
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Text(
                News.homeNews[index],
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}