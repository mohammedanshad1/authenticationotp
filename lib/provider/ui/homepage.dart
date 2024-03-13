import 'package:authenticationotp/provider/ui/favouritelist.dart';
import 'package:authenticationotp/statemanagementusingprovider/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/songmodel.dart';
import '../songprovider/songprovider.dart';




void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SongProvider(),
    child: MaterialApp(home: Song()),
  ));
}

class Song extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var songs = context.watch< SongProvider>().songs;
    var songslist = context.watch<SongProvider>().favouritesongs;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Songs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>favouritelist()));
                },
                icon: const Icon(Icons.favorite),
                label:  Text("Go To WishList ${songslist.length}")),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(itemBuilder: (context, index) {
                      var song = songs[index];
                      return Card(
                        key: ValueKey(song .song),
                        child: ListTile(
                          title: Text(song .song),
                          subtitle: Text(song .time ?? ""),
                          trailing: IconButton(
                            icon: Icon(Icons.favorite),
                            color: songslist.contains(song)
                                ? Colors.red
                                : Colors.white,
                            onPressed: () {
                              if (!songslist.contains(song)) {
                                context.read<SongProvider>().addToList(song);
                              } else {
                                context.read<SongProvider>().removeFromList(song);
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
