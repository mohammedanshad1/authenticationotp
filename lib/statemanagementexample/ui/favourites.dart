import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




import '../provider1/contactprovider.dart';

class favouritelist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favouritelist = context.watch<ContactProvider>().favouritecontacts;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourites (${favouritelist.length})"),
      ),
      body: ListView.builder(
          itemCount: favouritelist.length,
          itemBuilder: (context, index) {
            final contact =favouritelist[index];
            return Card(
              key: ValueKey(contact.name),
              child: ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.number ?? ""),
                trailing: TextButton(
                  onPressed: () {
                    context.read<ContactProvider>().removeFromList(contact);
                  },
                  child: Text("REMOVE"),
                ),
              ),
            );
          }),
    );
  }
}
