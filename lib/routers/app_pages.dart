import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:using_notes/examples/dialogUtils/dialogUtilsExample.dart';
import 'package:using_notes/routers/route_names.dart';

import '../examples/gallery/GalleryPickerExample.dart';
import '../examples/gallery/GalleryPreviewExample.dart';
import '../examples/gallery/ImagePickerExample.dart';
import '../examples/getx/GetBuilderExample.dart';
import '../examples/getx/GetConnectExample.dart';
import '../examples/getx/GetRouteExample.dart';
import '../examples/getx/LocalesExample.dart';
import '../examples/getx/Login.dart';
import '../examples/getx/ObxExample.dart';
import '../examples/getx/ThemeChangeExample.dart';
import '../examples/getx/User.dart';
import '../examples/platformChannels/AndroidBatteryLevelExample.dart';
import '../examples/platformChannels/IosBatteryLevelExample.dart';
import '../main.dart';
import 'auth_middle_ware.dart';


class AppPages {

  static final routes = [
    GetPage(
      name: RouteNames.HOME,
      page: () =>  MyHomePage(title: 'Flutter学习笔记'),
    ),

    GetPage(
      name: RouteNames.LOGIN,
      page: () =>  LoginPage(),
    ),
    GetPage(
      name: RouteNames.USER,
      page: () =>  UserPage(),
      middlewares: [
        AuthMiddleWare()
      ]
    ),

    GetPage(
      name: RouteNames.GETBUILDER,
      page: () => GetBuilderExample(),
    ),
    GetPage(
      name: RouteNames.OBX,
      page: () => ObxExample(),
    ),
    GetPage(
      name: RouteNames.GETROUTE,
      page: () => GetRouteExample(),
    ),
    GetPage(
      name: RouteNames.GETCONNECT,
      page: () => GetConnectExample(),
    ),
    GetPage(
      name: RouteNames.THEMECHANGE,
      page: () => ThemeChangeExample(),
    ),
    GetPage(
      name: RouteNames.LOCALES,
      page: () => LocalesExample(),
    ),
    GetPage(
      name: RouteNames.ImagePicker,
      page: () => ImagePickerExample(),
    ),
    GetPage(
      name: RouteNames.GalleryPicker,
      page: () => GalleryPickerExample(),
    ),
    GetPage(
      name: RouteNames.GalleryPreview,
      page: () => GalleryPreviewExample(),
    ),
    GetPage(
      name: RouteNames.DialogUtils,
      page: () => DialogUtilsExample(),
    ),
    GetPage(
      name: RouteNames.iosBatteryLevel,
      page: () =>  IosBatteryLevelExample(),
    ),
    GetPage(
      name: RouteNames.androidBatteryLeve,
      page: () => AndroidBatteryLevelExample(),
    ),
  ];
}