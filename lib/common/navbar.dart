import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Vimal.k'),
            accountEmail: const Text('vimal@test.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color(0xffF5591F),
              // image: DecorationImage(
              //     image: NetworkImage(
              //         'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50')
              // )
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favorites"),
            onTap: () => print('Fav'),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Friends"),
            onTap: () => print('Frd'),
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share"),
            onTap: () => print('share'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Request"),
            onTap: () => print('req'),
            trailing: ClipOval(
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                width: 20,
                height: 20,
                child: const Text(
                  "3",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () => print('Settings'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: () => print('logout'),
          )
        ],
      ),
    );
  }
}
