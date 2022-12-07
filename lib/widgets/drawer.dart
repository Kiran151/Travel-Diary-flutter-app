import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.60,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.info),
            ),
            Divider(),
            ListTile(
              title: Text('Clear Data'),
              leading: Icon(Icons.delete_forever),
            ),
            Divider(),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
            )
          ],
        ),
      ),
    );
  }
}
