import 'package:flutter/material.dart';
import 'package:flutterapp/home_page.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isTick = false;
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Flutter'),
        automaticallyImplyLeading: false, // To disable back <- button
        leading: IconButton(
          onPressed: (() {
            Navigator.of(context).pop();
          }),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('../images/photo.png'),
            const Divider(
              color: Colors.black,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(20.0),
                width: double.infinity,
                color: Colors.amber,
                child: const Text(
                  'A webpage',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isTick ? Colors.blue : Colors.green,
                ),
                onPressed: () {},
                child: const Text('Button'),
              ),
            ),
            OutlinedButton(
              onPressed: (() {}),
              child: const Text('Outlined button'),
            ),
            TextButton(
              onPressed: (() {}),
              child: const Text('Text button'),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint('here');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                  Text('Row widget'),
                  Icon(
                    Icons.local_activity_sharp,
                    color: Colors.green,
                  )
                ],
              ),
            ),
            Switch(
              value: isTick,
              onChanged: ((bool newBool) {
                setState(() {
                  isTick = !isTick;
                });
              }),
            ),
            Checkbox(
                value: isCheck,
                onChanged: ((bool? newBool) {
                  setState(() {
                    isCheck = !isCheck;
                  });
                })),
            Image.network(
                'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
          ],
        ),
      ),
    );
  }
}
