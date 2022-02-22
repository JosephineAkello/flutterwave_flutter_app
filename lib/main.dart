import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController amount = TextEditingController();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter + Flutterwave'),
          centerTitle: true,
        ),
        body: Padding(
                padding: const EdgeInsets.only(top: 10.0),
       child: Column(
          children: [
          const Padding(padding: EdgeInsets.all(10.0)),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: fullname,
              decoration: const InputDecoration(labelText: "Full Name"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: phone,
              decoration: const InputDecoration(labelText: "Phone Number"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: amount,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
          ),
          ElevatedButton(
            child: const Text('Pay with Flutterwave'),
            onPressed: () {},
          ),
        ])));
  }
}
