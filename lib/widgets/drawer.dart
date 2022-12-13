import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Maneger Name"),
            accountEmail: Text("maneger@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://appmaking.co/wp-content/uploads/2021/08/appmaking-logo-colored.png"),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/74.jpg"),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/47.jpg"),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Puechases"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text("Inventory"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.grid_3x3_outlined),
            title: const Text("Performance"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text("Logout"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
