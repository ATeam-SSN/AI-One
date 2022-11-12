import 'package:flutter/material.dart';
import 'package:flutter_expandable_table/flutter_expandable_table.dart';
import 'accentColors/color_theme.dart';

class time_table extends StatefulWidget {
  const time_table({Key? key}) : super(key: key);

  _time_tableState createState() => _time_tableState();
}

class _time_tableState extends State<time_table> {
  ExpandableTable _buildSimpleTable() {
    const int COLUMN_COUNT = 7;
    const int ROW_COUNT = 7;
    var timeschedule = ['8:15 AM'];
    var days = [
      'MONDAY',
      'TUESDAY',
      'WEDNESDAY',
      'THURSDAY',
      'FRIDAY',
      'SATURDAY'
    ];

    //Creation header
    ExpandableTableHeader header = ExpandableTableHeader(
        firstCell: Container(
            color: primaryColor,
            margin: EdgeInsets.all(1),
            // width: MediaQuery.of(context).size.width / 5,

            child: Center(
                child: Text(
              'Days',
              style: textStyle,
            ))),
        children: List.generate(
            COLUMN_COUNT - 1,
            (index) => Container(
                color: primaryColor,
                margin: EdgeInsets.all(1),
                child: Center(
                    child: Text(
                  timeschedule[0],
                  style: textStyle,
                )))));
//Creation rows
    List<ExpandableTableRow> rows = List.generate(
        ROW_COUNT - 1,
        (rowIndex) => ExpandableTableRow(
              height: 50,
              firstCell: Container(
                  color: primaryColor,
                  margin: EdgeInsets.all(1),
                  child: Center(
                      child: Text(
                    days[rowIndex],
                    style: textStyle,
                  ))),
              children: List<Widget>.generate(
                  COLUMN_COUNT - 1,
                  (columnIndex) => Container(
                      color: primaryColor,
                      margin: EdgeInsets.all(1),
                      child: Center(
                          child: Text(
                        '-',
                        style: textStyle,
                      )))),
            ));

    return ExpandableTable(
      rows: rows,
      header: header,
      scrollShadowColor: accentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('   Simple Table   '),
        centerTitle: true,
      ),
      body: Container(
        color: accentColor,
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildSimpleTable(),
            )),
          ],
        ),
      ),
    );
  }
}
