import 'package:domi_labs_assignment/data/user_data_provider.dart';
import 'package:domi_labs_assignment/widgets/widget_header.dart';
import 'package:flutter/material.dart';

class DocsWidget extends StatefulWidget {
  const DocsWidget({super.key});

  @override
  State<DocsWidget> createState() => _DocsWidgetState();
}

class _DocsWidgetState extends State<DocsWidget> {
  List _filteredDocs = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _filteredDocs = UserDataProvider.docsList;
  }

  void searchDocs(String searchString) {
    setState(() {
      _filteredDocs = UserDataProvider.docsList.where((doc) {
        return doc['title'].toString().toLowerCase().contains(searchString);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: const Color(0xff111111),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const WidgetHeader(title: "domi docs"),
            TextField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                searchDocs(value.toLowerCase().trim());
              },
              controller: _searchController,
              style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  decorationThickness: 0),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                hintText: "Search docs",
                hintStyle: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal),
                filled: true,
                fillColor: const Color(0xff1c1c1c),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //
            Column(
                children: List.generate(
              _filteredDocs.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    tileColor: const Color(0xff1c1c1c),
                    leading: Image.asset(
                      _filteredDocs[index]['iconUrl'],
                      width: 28,
                      height: 28,
                    ),
                    subtitle: Text(
                      _filteredDocs.elementAt(index)['lastOpen'],
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    title: Text(
                      _filteredDocs.elementAt(index)['title'],
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
