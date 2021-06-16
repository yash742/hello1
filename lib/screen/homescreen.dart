import 'package:flutter/material.dart';

class Joogle extends StatefulWidget {
  @override
  JjoogleState createState() => JjoogleState();
}

class JjoogleState extends State<Joogle> {
  bool uploading = true;
  Widget fileViewer(file) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  getFileIcon(file.key.split('/').last),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(file.key.split('/')[1]),
                  )
                ],
              )),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.cloud_download),
                  onPressed: () {},
                ),
                IconButton(icon: Icon(Icons.delete), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getFileIcon(name) {
    String extension = '.' + name.split('.').last;

    if ('.jpg, .jpeg, .png'.contains(extension)) {
      return Icon(Icons.image, color: Colors.blue);
    }
    return Icon(Icons.archive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doogle Grive"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            tooltip: 'Logout',
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder(
              future: null,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return fileViewer(snapshot.data[index]);
                    },
                    itemCount: snapshot.data.length,
                  );
                } else {
                  return ListView();
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: uploading ? Colors.deepOrange : Colors.blueAccent,
        onPressed: () {
          if (!uploading) {
            print('uploading.......');
          }
        },
        child: Icon(uploading ? Icons.watch_later : Icons.cloud_upload),
      ),
    );
  }
}
