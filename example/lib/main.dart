import 'package:flutter/material.dart';
import 'package:tekflat_design/tekflat_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: TekThemes.light.copyWith(
        textTheme: ThemeData().textTheme,
      ),
      home: const DataTableBasicUsageExampleWidget(),
    );
  }
}

class DemoDataTableModel {
  final int id;
  final String userName;
  final String gender;
  final String email;

  const DemoDataTableModel({
    required this.id,
    required this.userName,
    required this.gender,
    required this.email,
  });

  // to Json
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'userName': userName,
        'gender': gender,
        'email': email,
      };
}

const String _userNameKey = 'USERNAME_KEY';
const String _genderKey = 'GENDER_KEY';
const String _emailKey = 'EMAIL_KEY';
const String _actionKey = 'ACTION_KEY';

List<DataTableColumn<DemoDataTableModel>> _columnsDemoDataTable = [
  DataTableColumn(
    key: _userNameKey,
    name: 'UserName',
    minWidth: 200,
    flex: 2,
    customizeItemWidget: (
      context,
      value,
      rowData,
      columnKey,
      columnName,
      width,
      showOnScreens,
    ) {
      return Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rowData.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TekVSpace.mainSpace,
                TekTags.info(
                  'ID: ${rowData.id}',
                  isOutlined: true,
                ),
              ],
            )
          ],
        ),
      );
    },
  ),
  DataTableColumn(
    key: _genderKey,
    name: 'Gender',
    minWidth: 100,
    customizeItemWidget: (
      context,
      value,
      rowData,
      columnKey,
      columnName,
      width,
      showOnScreens,
    ) {
      return Align(
        alignment: Alignment.center,
        child: rowData.gender == 'male'
            ? TekTags.success(
                'Male',
                isOutlined: true,
              )
            : TekTags.failure(
                'Female',
                isOutlined: true,
              ),
      );
    },
  ),
  DataTableColumn(
    key: _emailKey,
    name: 'Email',
    minWidth: 200,
    flex: 2,
    customizeItemWidget: (
      context,
      value,
      rowData,
      columnKey,
      columnName,
      width,
      showOnScreens,
    ) {
      return Align(
        alignment: Alignment.center,
        child: Text(
          rowData.email,
        ),
      );
    },
  ),
  DataTableColumn(
    key: _actionKey,
    name: 'Action',
    minWidth: 120,
    customizeItemWidget: (
      context,
      value,
      rowData,
      columnKey,
      columnName,
      width,
      showOnScreens,
    ) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TekLink(
            text: 'Edit',
            onPressed: () {},
            size: TekLinkSize.medium,
          ),
          TekHSpace.mainSpace,
          TekLink(
            text: 'Delete',
            onPressed: () {},
            size: TekLinkSize.medium,
          ),
        ],
      );
    },
  ),
];

const List<DemoDataTableModel> _dataSourcesDemoDataTable = [
  DemoDataTableModel(
    id: 1,
    userName: 'Jerry Ward',
    gender: 'male',
    email: 'jerry.ward@example.com',
  ),
  DemoDataTableModel(
    id: 2,
    userName: 'Cariana Sales',
    gender: 'female',
    email: 'cariana.sales@example.com',
  ),
  DemoDataTableModel(
    id: 3,
    userName: 'Kenzo Gautier',
    gender: 'male',
    email: 'kenzo.gautier@example.com',
  ),
  DemoDataTableModel(
    id: 4,
    userName: 'Arnoldo Toro',
    gender: 'male',
    email: 'arnoldo.toro@example.com',
  ),
  DemoDataTableModel(
    id: 5,
    userName: 'Claudia Velasco',
    gender: 'female',
    email: 'claudia.velasco@example.com',
  ),
  DemoDataTableModel(
    id: 6,
    userName: 'Taahira Salian',
    gender: 'male',
    email: 'taahira.salian@example.com',
  ),
  DemoDataTableModel(
    id: 7,
    userName: 'Sophie Lévesque',
    gender: 'female',
    email: 'sophie.levesque@example.com',
  ),
  DemoDataTableModel(
    id: 8,
    userName: 'Angela Gómez',
    gender: 'female',
    email: 'angela.gomez@example.com',
  ),
];

class DataTableBasicUsageExampleWidget extends StatefulWidget {
  const DataTableBasicUsageExampleWidget({super.key});

  @override
  State<DataTableBasicUsageExampleWidget> createState() =>
      _DataTableBasicUsageExampleWidgetState();
}

class _DataTableBasicUsageExampleWidgetState
    extends State<DataTableBasicUsageExampleWidget> {
  final TekDataTableController<DemoDataTableModel> _controller =
      TekDataTableController<DemoDataTableModel>();

  @override
  void initState() {
    super.initState();
    _controller.initDataTableState(
      dataSources: _dataSourcesDemoDataTable,
    );
  }

  void _handleChangeData({
    required int currentPage,
    required int itemsPerPage,
  }) {
    TekLogger.debugLog({
      'currentPage': currentPage,
      'itemsPerPage': itemsPerPage,
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: TekDataTable<DemoDataTableModel>(
          tableColumns: _columnsDemoDataTable,
          controller: _controller,
          handleChangeData: _handleChangeData,
          additionColumns: const [
            TekDataTableAdditionColumn.showMore,
          ],
          optionUI: const TekDataTableOptionUI(
            fixTableInAScreen: true,
          ),
          rowOption: TekDataTableRowOption(
            bordered: false,
            paddingOfRowItem: EdgeInsets.all(TekSpacings().mainSpacing),
          ),
          showerMoreContentIntoRowWidget: (rowData) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TekTags.info(
                  'ID: ${rowData.id}',
                  isOutlined: true,
                ),
              ],
            ),
          ),
        ),
      );
}
