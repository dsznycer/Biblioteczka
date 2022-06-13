import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class bookShelf extends StatelessWidget {
  bookShelf({Key? key}) : super(key: key);

  FirebaseFirestore db = FirebaseFirestore.instance;

  void getData() async {
    await for (var snapshot in db.collection('log').snapshots()) {
      for (var info in snapshot.docs) {
        print(info.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              width: 200,
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                width: 150,
                height: 50,
                color: Colors.green,
              ),
            ),
            FloatingActionButton(onPressed: () {
              getData();
            })
            // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            //     stream: db.collection('log').doc().snapshots(),
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return Text('Jebać sektor gosci');
            //       } else {
            //         var times = snapshot.data;
            //         List<Text> datasy = [];
            //         for (var i in times) {
            //           print(i.data());
            //           final item = i.data().toString();
            //           datasy.add(Text(item));
            //         }
            //         return Column(children: datasy);
            //       }
            //     }),
          ],
        ),
      ),
    );
  }
}
