import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../constants/lectures.dart';
import 'ContentWriting.dart';

class ContentWritingLecsPage extends StatefulWidget {
  ContentWritingLecsPage({super.key});

  @override
  State<ContentWritingLecsPage> createState() => _ContentWritingLecsPageState();
}

class _ContentWritingLecsPageState extends State<ContentWritingLecsPage> {
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
        .doc("ContentWriting");
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
                          return ContentwritingPage(
                            videoId: ContentWritingVids[index],
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
                itemCount: ContentWritingVids.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
