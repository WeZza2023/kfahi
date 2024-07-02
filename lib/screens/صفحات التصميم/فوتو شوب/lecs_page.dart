import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kfahi/screens/%D8%B5%D9%81%D8%AD%D8%A7%D8%AA%20%D8%A7%D9%84%D8%AA%D8%B5%D9%85%D9%8A%D9%85/%D9%81%D9%88%D8%AA%D9%88%20%D8%B4%D9%88%D8%A8/photo_shop_page.dart';
import '../../../constants/lectures.dart';

class PhotoShopLecsPage extends StatefulWidget {
  PhotoShopLecsPage({super.key});

  @override
  State<PhotoShopLecsPage> createState() => _PhotoShopLecsPageState();
}

class _PhotoShopLecsPageState extends State<PhotoShopLecsPage> {
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
        .doc("PhotoShop");
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
                          return PhotoShopPage(
                            videoId: PhotoShopVids[index],
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
                itemCount: PhotoShopVids.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
