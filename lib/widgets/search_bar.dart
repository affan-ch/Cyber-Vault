import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SizedBox(
            height: 50,
            child: SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              hintText: 'Search in Vault',
              leading: const Icon(Icons.search),
              // trailing: const <Widget>[
              //   IconButton(
              //     icon: CircleAvatar(
              //       radius: 20,
              //       backgroundImage: NetworkImage(
              //           "https://ui-avatars.com/api/?name=Affan+Chaudhary&rounded=true"),
              //     ),
              //     onPressed: null,
              //   ),
              // ],
            ));
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }
}
