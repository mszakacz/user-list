import 'package:flutter/material.dart';

enum SortingBy {
  idDescending,
  idAscending,
  creationTimeDescending,
  creationTimeAscending,
  updateTimeDescending,
  updateTimeAscending,
  firstnameDescending,
  firstnameAscending,
  lastnameDescending,
  lastnameAscending,
}

class SortingSettingsWidget extends StatefulWidget {
  const SortingSettingsWidget({Key? key}) : super(key: key);

  @override
  _SortingSettingsWidgetState createState() => _SortingSettingsWidgetState();
}

class _SortingSettingsWidgetState extends State<SortingSettingsWidget> {
  SortingBy? _sortingBy = SortingBy.creationTimeDescending;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
          child: Text(
            'Sort by:',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        ListTile(
          title: const Text('ID (descending)'),
          leading: Radio(
            value: SortingBy.idDescending,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('ID (ascending)'),
          leading: Radio(
            value: SortingBy.idAscending,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Creation Time (descending)'),
          leading: Radio(
            value: SortingBy.creationTimeDescending,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Creation Time (ascending)'),
          leading: Radio(
            value: SortingBy.creationTimeAscending,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Update Time (descending)'),
          leading: Radio(
            value: SortingBy.updateTimeDescending,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Update Time (ascending)'),
          leading: Radio(
            value: SortingBy.updateTimeAscending,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Firstname (descending)'),
          leading: Radio(
            value: SortingBy.firstnameDescending,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Firstname (ascending)'),
          leading: Radio(
            value: SortingBy.firstnameAscending,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Lastname (descending)'),
          leading: Radio(
            value: SortingBy.lastnameDescending,
            groupValue: _sortingBy,
            onChanged: (SortingBy? value) {
              setState(() {
                _sortingBy = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Lastname (ascending)'),
          leading: Radio(
            value: SortingBy.lastnameAscending,
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
