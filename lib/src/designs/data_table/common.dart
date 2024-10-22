part of 'data_table.dart';

bool isShowInScreen<T>(List<TekScreenDevice>? showOnScreens) {
  return showOnScreens == null || showOnScreens.contains(TekResponsiveConfig().screenDevice);
}

double getWithAdditionColumn(TekDataTableAdditionColumn additionColumn) => switch (additionColumn) {
      TekDataTableAdditionColumn.none => 0,
      TekDataTableAdditionColumn.numbered => 60,
      TekDataTableAdditionColumn.checkbox => 40,
      TekDataTableAdditionColumn.showMore => 40,
    };
