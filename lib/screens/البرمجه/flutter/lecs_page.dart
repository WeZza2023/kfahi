import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/flutter/flutterpage.dart';
import '../../../constants/lectures.dart';

class FlutterLecsPage extends StatefulWidget {
  FlutterLecsPage({super.key});

  @override
  State<FlutterLecsPage> createState() => _FlutterLecsPagePageState();
}

class _FlutterLecsPagePageState extends State<FlutterLecsPage> {
  late List<int> doneLecs = [];

  @override
  void initState() {
    super.initState();
    getDoneLecs();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getDoneLecs() async {
    final db = FirebaseFirestore.instance;
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    final docRef = db
        .collection('users')
        .doc(userUid)
        .collection("courses")
        .doc("Flutter");
    final snapshot = await docRef.get();
    if (snapshot.exists) {
      List<dynamic> doneLecs = snapshot.get('DoneLecs');
      setState(() {
        this.doneLecs = doneLecs.cast<int>();
      });
    } else {
      await docRef.set({'DoneLecs': []});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // العودة للصفحة السابقة
          },
        ),
        centerTitle: true,
        title: const Text('المحاضرات', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return FlutterPage(
                            videoId: FlutterVids[index],
                            videoNum: index,
                          );
                        },
                      ));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: doneLecs.contains(index) == true
                            ? Colors.green
                            : Colors.blueGrey,
                      ),
                      child: Center(
                          child: Text(
                        (index + 1).toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                padding: EdgeInsets.all(15),
                itemCount: FlutterVids.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
