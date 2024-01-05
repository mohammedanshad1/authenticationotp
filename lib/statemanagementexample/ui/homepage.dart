import 'package:authenticationotp/statemanagementusingprovider/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider1/contactprovider.dart';
import 'favourites.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ContactProvider(),
    child: MaterialApp(home: Contact()),
  ));
}

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var contacts = context.watch<ContactProvider>().contacts;
    var contactlist = context.watch<ContactProvider>().favouritecontacts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> favouritelist()));
                },
                icon: const Icon(Icons.favorite),
                label:  Text("Go To WishList ${contactlist.length}")),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(itemBuilder: (context, index) {
                      var contact = contacts[index];
                      return Card(
                        key: ValueKey(contact.name),
                        child: ListTile(
                          title: Text(contact.name),
                          subtitle: Text(contact.number ?? ""),
                          trailing: IconButton(
                            icon: Icon(Icons.favorite),
                            color: contactlist.contains(contact)
                                ? Colors.red
                                : Colors.white,
                            onPressed: () {
                              if (!contactlist.contains(contact)) {
                                context.read<ContactProvider>().addToList(contact);
                              } else {
                                context.read<ContactProvider>().removeFromList(contact);
                              }
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
