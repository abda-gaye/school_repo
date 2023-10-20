import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: Text('Cours',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.cyan[800]
              ),
            ),
            onTap: (){},
          ),

          ListTile(
            leading: const Icon(Icons.add_card_rounded),
            title: Text('sessions',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.cyan[800]
                )),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: Text('deconnexion',
                style: TextStyle(
                    color: Colors.cyan[800],
                    fontSize: 24
                )),
            onTap: (){},
          ),
        ],
      ),
    );

  }
}
