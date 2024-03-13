import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../songprovider/songprovider.dart';





class favouritelist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favouritelist = context.watch<SongProvider>().favouritesongs;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourites (${favouritelist.length})"),
      ),
      body: ListView.builder(
          itemCount: favouritelist.length,
          itemBuilder: (context, index) {
            final song =favouritelist[index];
            return Card(
              key: ValueKey(song.song),
              child: ListTile(
                title: Text(song.song),
                subtitle: Text(song.time ?? ""),
                trailing: TextButton(
                  onPressed: () {
                    context.read<SongProvider>().removeFromList(song);
                  },
                  child: Text("REMOVE"),
                ),
              ),
            );
          }),
    );
  }
}
