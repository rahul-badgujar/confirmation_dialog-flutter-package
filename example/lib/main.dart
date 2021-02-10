import 'package:flutter/material.dart';
import 'package:confirmation_dialog/confirmation_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Show confirmation dialog"),
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (context) {
                // using confirmation dialog
                return ConfirmationDialog(
                  title: Text("Confirm ?"),
                  accepterWidget: Text("Yes"), // if clicked, returns True
                  rejectorWidget: Text("No"), // if clicked, returns False
                );
              },
            );
            // show message
            String msg;
            if (result == null) {
              msg = "You ignored confirmation";
            } else {
              if (result == true)
                msg = "You accepted confirmation";
              else
                msg = "You rejected confirmation";
            }
            await showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  children: [
                    Center(
                      child: Text(
                        msg,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
