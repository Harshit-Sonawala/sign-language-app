import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      // removeTop: true,
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              margin: null,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Sign Language Translator', style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
            // ListTile(
            //   onTap: () => {},
            //   leading: Icon(
            //     Icons.home,
            //     color: Theme.of(context).primaryColor,
            //   ),
            //   title: Text(
            //     'Home',
            //     style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
            //   ),
            // ),
            ListTile(
              onTap: () => {},
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              onTap: () => {},
              leading: Icon(
                Icons.help,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'About',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
