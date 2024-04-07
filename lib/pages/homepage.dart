import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_task/models/provider.dart';

import 'package:totalx_task/pages/Add_user.dart';
import 'package:totalx_task/pages/listtile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 235, 235),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddUserPage()));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 7, 7, 7),
              height: 80,
              width: 500,
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Text(
                    "Nilambur",
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, letterSpacing: 2),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(8),
                      constraints: BoxConstraints(maxWidth: 300),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.search),
                      ),
                      labelText: "Search By Name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  onSelected: (String value) {
                    switch (value) {
                      case 'all':
                        Provider.of<UserProvider>(context, listen: false)
                            .clearFilters();
                        break;
                      case 'elder_than_60':
                        Provider.of<UserProvider>(context, listen: false)
                            .filterUsersByAge(aboveAge: 60);
                        break;
                      case 'below_60':
                        Provider.of<UserProvider>(context, listen: false)
                            .filterUsersByAge(belowAge: 60);
                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'all',
                      child: Text('All'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'elder_than_60',
                      child: Text('Age: Elder'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'below_60',
                      child: Text('Age: Younger'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    "Users Lists",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
            //static Tile
            // Container(
            //   margin: const EdgeInsets.all(12),
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.all(Radius.circular(8)),
            //   ),
            //   child: const ListTile(
            //     contentPadding: EdgeInsets.all(8),
            //     leading: CircleAvatar(
            //       backgroundImage: AssetImage("assets/image/emy.jpg"),
            //       radius: 50,
            //     ),
            //     title: Text(
            //       "Emilie",
            //       style: TextStyle(fontSize: 25),
            //     ),
            //     subtitle: Text(
            //       'Age: 37',
            //       style: TextStyle(fontSize: 15),
            //     ),
            //   ),
            // ),
            const Expanded(
              child: ListTileMy(),
            ),
          ],
        ),
      ),
    );
  }
}
