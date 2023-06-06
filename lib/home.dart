import 'package:flutter/material.dart';
import 'package:tugas_mobile_api/controller.dart';
import 'package:tugas_mobile_api/model/Json.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Test>>(
        future: getTests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final List<Test> testList = snapshot.data!;
            return ListView.builder(
              itemCount: testList.length,
              itemBuilder: (context, index) {
                Test testData = testList[index];
                return Column(
                  children: [
                    Text("${testData.userId}"),
                    Text("${testData.id}"),
                    Text("${testData.title}"),
                    Text("${testData.completed}"),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Gagal memuat data");
          } else {
            return Text("Tidak ada data");
          }
        },
      ),
    );
  }
}
