import 'package:flutter/material.dart';

// typedef ChildBuilder<T> = Widget Function(T);
typedef ChildBuilder<T> = Widget Function(T itemData, int index);
typedef ListBuilder<T> = Widget Function();
