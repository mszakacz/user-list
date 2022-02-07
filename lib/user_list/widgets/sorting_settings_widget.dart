import 'package:flutter/material.dart';

enum SortingBy {
  id,
  creationTime,
  updateTime,
  firstname,
  lastname,
}

class SortingSettingsWidget extends StatefulWidget {
  SortingSettingsWidget({Key? key}) : super(key: key);

  @override
  _SortingSettingsWidgetState createState() => _SortingSettingsWidgetState();
}

class _SortingSettingsWidgetState extends State<SortingSettingsWidget> {
  SortingBy? _sortingBy = SortingBy.creationTime;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Sort by:',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        ListTile(
          title: const Text('ID'),
          leading: Radio(
            value: SortingBy.id,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Creation Time'),
          leading: Radio(
            value: SortingBy.creationTime,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Update Time'),
          leading: Radio(
            value: SortingBy.updateTime,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Firstname'),
          leading: Radio(
            value: SortingBy.firstname,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Lastname'),
          leading: Radio(
            value: SortingBy.lastname,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
