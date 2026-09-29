# reusable_list_view

`reusable_list_view` is a Flutter package that provides a suite of customizable and reusable list and scroll widgets. Designed with flexibility in mind, this package helps developers quickly implement performant, user-friendly lists, grids, and scrollable components with advanced capabilities like search, dynamic visibility handling, and customizable scroll behavior.

## Features

- **Custom List and Grid Views**: Easily render data using `ListView`, `GridView`, or `SingleChildScrollView` with minimal boilerplate.
- **Search Integration**: Built-in support for list filtering with a search field.
- **Scroll Controller Management**: Automatically manage and optionally dispose of scroll controllers.
- **Visibility Control**: Control visibility of UI elements (e.g., Floating Action Buttons) based on scroll direction.
- **Custom Separators**: Easily insert dividers or custom separators between list items.

## Getting Started

Add this to your `pubspec.yaml`:

```yaml
resolution: workspace

dependencies:
  reusable_list_view: <latest_version>
```

## Usage

### 1. Basic List View
```dart
AppListViewBuilder<T>(
  listData: myList,
  child: (T item) => MyItemWidget(item),
);
```

### 2. List View with Search
```dart
AppListViewBuilderWithSearch<T>(
  listData: myList,
  searchController: TextEditingController(),
  onChanged: (query) => onSearch(query),
  child: (T item) => MyItemWidget(item),
);
```

### 3. Grid View
```dart
AppGridViewBuilder<T>(
  listData: myList,
  child: (T item) => MyGridItem(item),
  crossAxisCount: 2,
  childHeight: 4,
  childWidth: 2,
);
```

### 4. Scroll Controller with Visibility Handling
```dart
AppListViewBuilderWithScrollController<T>(
  listData: myList,
  controller: ScrollController(),
  isControlDefaultDialVisibility: true,
  onScroll: (visible) => setState(() => showFAB = visible),
  child: (T item) => MyItemWidget(item),
);
```

## Utilities

### ListFilterExtension
Provides filtering support for lists:

```dart
final filtered = myList.filter([
  (item) => item.name,
  (item) => item.description,
], query);
```

## Components

- `AppListViewBuilder`
- `AppGridViewBuilder`
- `AppSingleChildScrollViewWithScrollController`
- `AppListViewBuilderWithScrollController`
- `AppListViewBuilderWithSearch`
- `BaseScrollControllerWidget`
- `DialVisibleCubit` (for scroll direction-based visibility)

## License

MIT License. See [LICENSE](LICENSE) for details.

---

This package is actively maintained. Contributions and suggestions are welcome!