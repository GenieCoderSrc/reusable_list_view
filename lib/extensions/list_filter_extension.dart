extension ListFilterExtension<T> on List<T> {
  List<T> filter(List<String? Function(T)> fields, String query) {
    return where((element) {
      for (var field in fields) {
        if (containsIgnoreCase(field(element), query)) {
          return true;
        }
      }
      return false;
    }).toList();
  }

  bool containsIgnoreCase(String? value, String query) {
    return value?.toLowerCase().contains(query.toLowerCase()) ?? false;
  }
}
