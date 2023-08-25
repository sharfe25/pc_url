import 'package:flutter/material.dart';
import 'package:pc_url/core/configs/database/database_helper.dart';
import 'package:pc_url/core/configs/styles/app_colors.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Map<String, dynamic>> urls = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() async {
    final loadedUrls = await DatabaseHelper.getAllUrls();
    setState(() {
      urls = loadedUrls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Historial",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: urls.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(
              urls[index]["result_url"],
              style: const TextStyle(color: AppColors.white),
            ));
          },
        )),
      ],
    );
  }
}
