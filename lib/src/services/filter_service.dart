import 'package:flutter/material.dart';

enum SortingOptions { vehicleId, vehicleName, lastUpdated }

enum FilteringOptions { statusOrder }

const defaultSortingOption = SortingOptions.vehicleId;

class FilterService extends ChangeNotifier {
  SortingOptions _sortingOption = defaultSortingOption;
  FilteringOptions? _filteringOption;
  bool areFiltersApplied = false;

  set sortingOption(SortingOptions value) {
    _sortingOption = value;
    areFiltersApplied = false;
    notifyListeners();
  }

  SortingOptions get sortingOption {
    return _sortingOption;
  }

  set filteringOption(FilteringOptions? value) {
    _filteringOption = value;
    areFiltersApplied = false;
    notifyListeners();
  }

  FilteringOptions? get filteringOption {
    return _filteringOption;
  }

  clean() {
    _sortingOption = defaultSortingOption;
    _filteringOption = null;
    areFiltersApplied = false;
    notifyListeners();
  }

  apply() {
    areFiltersApplied = true;
    notifyListeners();
  }
}
