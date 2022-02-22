import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';

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
  //use the currency you would like the use to Pay In, in this case used KES currency
  final String currency = FlutterwaveCurrency.KES;
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

  //Add a method to make the flutter wave payment
  //This Method includes all the values needed to create the Flutterwave Instance
void _makePayment(BuildContext context, String fullname, String phone, String email, String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          //the first 10 fields below are required/mandatory
          context: this.context,
          fullName: fullname,
          phoneNumber: phone,
          email: email,
          amount: amount,
          //Use your Public and Encription Keys from your Flutterwave account on the dashboard
          encryptionKey: "Your Encription Key",
          publicKey: "Your Public Key",
          currency: currency,
          txRef: DateTime.now().toIso8601String(),
          //Setting DebugMode below to true since will be using test mode.
          //You can set it to false when using production environment.
          isDebugMode: true,
          //configure the the type of payments that your business will accept
          acceptCardPayment: true,
          acceptUSSDPayment: true,
          acceptAccountPayment: true,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: true,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: false,
          acceptZambiaPayment: false
          );
   
    final response = await flutterwave.initializeForUiPayments();
    if (response == null) {
        print("Transaction Failed");
      } else {
        ///
        if (response.status == "success") {
          print(response.data);
          print(response.message);

        } else {
          print(response.message);
        }
      }
    } catch (error) {
      print(error);
    }
  }
}