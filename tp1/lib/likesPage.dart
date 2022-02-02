import 'package:flutter/material.dart';
import 'aircrafts.dart';

class LikesPage extends StatelessWidget {
  const LikesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favourites.length,
      itemBuilder: (context, i) {
        return _buildRow(favourites[i]);
      },
    );
  }

  Widget _buildRow(Aircraft aircraft) {
    return ListTile(
      leading: Image(image: AssetImage(aircraft.iconImage)),
      title: Text(
        aircraft.name,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

}