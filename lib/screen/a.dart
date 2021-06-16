import 'package:flutter/material.dart';

class Scrlitem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              height: 20,
              color: Colors.green,
              child: Text("jo"),
            );
          }, childCount: 10),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 5,
          ),
        ),
      ],
      scrollDirection: Axis.horizontal,
    )));
  }
}
/*  Column(
          children: <Widget>[
            Container(
              height: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        height: 350,
                        width: 230,
                        color: Colors.greenAccent,
                      ),
                    );
                  }),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        height: 200,
                        width: 230,
                        color: Colors.orange,
                      ),
                    );
                  }),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        height: 200,
                        width: 230,
                        color: Colors.pink,
                      ),
                    );
                  }),
            )
          ],
        ),
      )),*/
