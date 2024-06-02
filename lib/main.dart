
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:using_notes/examples/scroll/bottom_navigation_bar_enhance_example.dart';
import 'package:using_notes/routers/app_pages.dart';
import 'package:using_notes/store/settings_store.dart';
import 'package:using_notes/store/user_store.dart';
import 'package:using_notes/utils/CustomTheme.dart';

import 'examples/animation/animation_example.dart';
import 'examples/animation/animation_example2.dart';
import 'examples/animation/animation_example3.dart';
import 'examples/animation/animation_example4.dart';
import 'examples/animation/animation_example5.dart';
import 'examples/animation/animation_example6.dart';
import 'examples/animation/animation_example7.dart';
import 'examples/button/button_example1.dart';
import 'examples/button/button_example10.dart';
import 'examples/button/button_example11.dart';
import 'examples/button/button_example2.dart';
import 'examples/button/button_example3.dart';
import 'examples/button/button_example4.dart';
import 'examples/button/button_example5.dart';
import 'examples/button/button_example6.dart';
import 'examples/button/button_example7.dart';
import 'examples/button/button_example8.dart';
import 'examples/button/button_example9.dart';
import 'examples/containers/clip_example.dart';
import 'examples/containers/container_example.dart';
import 'examples/containers/decorated_box_example.dart';
import 'examples/containers/fitted_box_example.dart';
import 'examples/containers/overflow_box_example.dart';
import 'examples/containers/padding_example.dart';
import 'examples/containers/scaffold_example.dart';
import 'examples/containers/transform_example.dart';
import 'examples/customWidget/custom_widget_example.dart';
import 'examples/customWidget/custom_widget_example2.dart';
import 'examples/customWidget/custom_widget_example3.dart';
import 'examples/customWidget/custom_widget_example4.dart';
import 'examples/customWidget/custom_widget_example5.dart';
import 'examples/customWidget/custom_widget_example6.dart';
import 'examples/events/event_bus_example.dart';
import 'examples/events/gesture_detector_example.dart';
import 'examples/events/listener_example.dart';
import 'examples/events/notification_example.dart';
import 'examples/events/notification_example2.dart';
import 'examples/form/checkbox_example.dart';
import 'examples/form/form_example.dart';
import 'examples/form/radio_example.dart';
import 'examples/form/switch_example.dart';
import 'examples/form/text_field_example.dart';
import 'examples/form/text_field_example2.dart';
import 'examples/form/text_field_example3.dart';
import 'examples/form/text_field_example4.dart';
import 'examples/form/text_field_example5.dart';
import 'examples/form/text_field_example6.dart';
import 'examples/funWidget/alert_dialog_example.dart';
import 'examples/funWidget/color_theme_example.dart';
import 'examples/funWidget/custom_provider_example.dart';
import 'examples/funWidget/dialog_example.dart';
import 'examples/funWidget/dialog_state_example.dart';
import 'examples/funWidget/future_builder_example.dart';
import 'examples/funWidget/inherited_widget_example.dart';
import 'examples/funWidget/show_custom_dialog_example.dart';
import 'examples/funWidget/show_date_picker_example.dart';
import 'examples/funWidget/show_model_bottom_sheet_example.dart';
import 'examples/funWidget/simple_dialog_example.dart';
import 'examples/funWidget/stream_builder_example.dart';
import 'examples/funWidget/value_listenable_builder_example.dart';
import 'examples/funWidget/will_pop_scope_example.dart';
import 'examples/icon/icon_example.dart';
import 'examples/icon/icon_example2.dart';
import 'examples/image/image_example.dart';
import 'examples/image/image_example2.dart';
import 'examples/image/image_example3.dart';
import 'examples/image/image_example4.dart';
import 'examples/image/image_example5.dart';
import 'examples/image/image_example6.dart';
import 'examples/io/io_example.dart';
import 'examples/io/io_example2.dart';
import 'examples/io/io_example3.dart';
import 'examples/io/io_example4.dart';
import 'examples/io/io_example5.dart';
import 'examples/io/io_example6.dart';
import 'examples/layout/align_example.dart';
import 'examples/layout/center_example.dart';
import 'examples/layout/column_example.dart';
import 'examples/layout/column_example2.dart';
import 'examples/layout/constrained_example.dart';
import 'examples/layout/flex_example.dart';
import 'examples/layout/flow_example.dart';
import 'examples/layout/layout_builder_example.dart';
import 'examples/layout/positioned_example.dart';
import 'examples/layout/row_example.dart';
import 'examples/layout/wrap_example.dart';
import 'examples/progress/progress_example.dart';
import 'examples/route/MaterialPageRouteExample.dart';
import 'examples/route/NamedRouteExample.dart';
import 'examples/route/NavigatorExample.dart';
import 'examples/route/RouteAnimationExample.dart';
import 'examples/route/RouteArgumentsExample.dart';
import 'examples/scroll/animated_list_example.dart';
import 'examples/scroll/automatic_keep_alive_example.dart';
import 'examples/scroll/bottom_navigation_bar_example.dart';
import 'examples/scroll/custom_scroll_view_example.dart';
import 'examples/scroll/custom_scroll_view_example2.dart';
import 'examples/scroll/custom_scroll_view_example3.dart';
import 'examples/scroll/grid_view_example.dart';
import 'examples/scroll/infinite_list_view_example.dart';
import 'examples/scroll/keep_alive_wrapper_example.dart';
import 'examples/scroll/list_view_builder_example.dart';
import 'examples/scroll/list_view_example.dart';
import 'examples/scroll/list_view_separated_example.dart';
import 'examples/scroll/nested_scroll_view_example.dart';
import 'examples/scroll/nested_scroll_view_example2.dart';
import 'examples/scroll/notification_listener_example.dart';
import 'examples/scroll/page_view_example.dart';
import 'examples/scroll/raw_scrollbar_example.dart';
import 'examples/scroll/scroll_controller_example.dart';
import 'examples/scroll/single_child_scroll_view_example.dart';
import 'examples/scroll/staggered_grid_view_example.dart';
import 'examples/scroll/staggered_grid_view_example2.dart';
import 'examples/scroll/staggered_grid_view_example3.dart';
import 'examples/scroll/staggered_grid_view_example4.dart';
import 'examples/scroll/staggered_grid_view_example5.dart';
import 'examples/scroll/staggered_grid_view_example6.dart';
import 'examples/scroll/tab_bar_view_example.dart';
import 'examples/stateManage/stateManageExample.dart';
import 'examples/text/default_text_style_example.dart';
import 'examples/text/font_example.dart';
import 'examples/text/text_example.dart';
import 'examples/text/text_span_example.dart';
import 'examples/widget/stateExample.dart';
import 'examples/widget/widget_explain.dart';
import 'examples/widget/contextExample.dart';
import 'examples/widget/getStateExample.dart';
import 'lang/translation_service.dart';

/// 渲染flutter之前的一些初始化工作
Future initializeBeforeStartup() async {
  /// runApp之前调用本机代码需要确保提前初始化，先与 Flutter Engine 进行通讯
  WidgetsFlutterBinding.ensureInitialized();

  /// 设置app支持设置的方向(也可以在原生外层配置)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// 初始化本地储存
  await GetStorage.init();

  /// 初始化全局状态
  Get.put(SettingsStore());
  Get.put(UserStore());
}

void main() async{
  await initializeBeforeStartup();

  runApp(const MyApp());
}

// class MyNavigatorObserver extends NavigatorObserver {
//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     print('Route pushed: ${route.settings.name}');
//   }
//
//   @override
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     print('Route popped: ${route.settings.name}');
//   }
//
//   @override
//   void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
//     print('Route replaced: ${newRoute!.settings.name}');
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// Material风格的根控件
    /// MaterialApp({
    /// Key? key,
    /// GlobalKey ? navigatorKey,
    /// GlobalKey ? scaffoldMessengerKey,
    /// Widget? home, 入口页面
    /// Map  routes = const  {}, 路由表(私有页面最好不要定义进来，否则无法拦截)
    /// String? initialRoute, 初始进入路由名称
    /// Route ? Function(RouteSettings)? onGenerateRoute, 处理除home和routes以外的路由(未进路由表的进入时会触发，用此方法来做路由拦截)
    /// List  > Function(String)? onGenerateInitialRoutes,
    /// Route ? Function(RouteSettings)? onUnknownRoute, 如果上面都不匹配则调用
    /// List  navigatorObservers = const  [], 监听所有路由跳转动作
    /// Widget Function(BuildContext, Widget?)? builder, 根构建全局控件
    /// String title = '', 应用标题
    /// String Function(BuildContext)? onGenerateTitle, 生成应用标题
    /// Color? color, 颜色
    /// ThemeData? theme,
    /// ThemeData? darkTheme,
    /// ThemeData? highContrastTheme,
    /// ThemeData? highContrastDarkTheme,
    /// ThemeMode? themeMode = ThemeMode.system,
    /// Locale? locale, 语言
    /// Iterable  >? localizationsDelegates,
    /// Locale? Function(List ?, Iterable )? localeListResolutionCallback,
    /// Locale? Function(Locale?, Iterable )? localeResolutionCallback,
    /// Iterable  supportedLocales = const  [Locale('en', 'US')],
    /// bool debugShowMaterialGrid = false,
    /// bool showPerformanceOverlay = false,
    /// bool checkerboardRasterCacheImages = false,
    /// bool checkerboardOffscreenLayers = false,
    /// bool showSemanticsDebugger = false,
    /// bool debugShowCheckedModeBanner = true,
    /// Map ? shortcuts,
    /// Map  >? actions,
    /// String? restorationScopeId,
    /// ScrollBehavior? scrollBehavior,
    /// bool useInheritedMediaQuery = false,
    /// })
    return GetMaterialApp(
        title: 'Flutter Demo',
        // 初始路由
        initialRoute: '/',
        // 监听路由全局变化
        // navigatorObservers: [MyNavigatorObserver()],
        // 注册路由表
        routes: {
          '/widgetExplain': (BuildContext context) =>
          const WidgetExplain(title: 'Widget介绍'),
          '/contextExample': (BuildContext context) =>
          const ContextExample(title: '通过context搜索'),
          '/stateExample': (BuildContext context) =>
          const StateExample(title: 'State生命周期'),
          '/getStateExample': (BuildContext context) =>
          const GetStateExample(title: '获取State的方式'),

          '/stateManageExample': (BuildContext context) =>
          const StateManageExample(title: '基础状态管理'),

          '/materialPageRouteExample': (BuildContext context) =>
          const MaterialPageRouteExample(title: 'MaterialPageRoute路由'),
          '/navigatorExample': (BuildContext context) =>
          const NavigatorExample(title: 'Navigator路由管理的组件'),
          '/routeArgumentsExample': (BuildContext context) =>
          const RouteArgumentsExample(title: '普通路由传参'),
          '/namedRouteExample': (BuildContext context) =>
          const NamedRouteExample(),
          '/routeAnimationExample': (BuildContext context) =>
          const RouteAnimationExample(title: '自定义路由动画'),

          '/textExample': (BuildContext context) =>
          const TextExample(title: '普通的文字样式设置'),
          '/textSpanExample': (BuildContext context) =>
          const TextSpanExample(title: '片段文字样式设置'),
          '/defaultTextStyleExample': (BuildContext context) =>
          const DefaultTextStyleExample(title: '默认文字样式设置'),
          '/fontExample': (BuildContext context) =>
          const FontExample(title: '使用自定义字体'),

          '/buttonExample1': (BuildContext context) =>
          const ButtonExample1(title: '功能按钮'),
          '/buttonExample2': (BuildContext context) =>
          const ButtonExample2(title: '投影按钮'),
          '/buttonExample3': (BuildContext context) =>
          const ButtonExample3(title: '轮廓按钮'),
          '/buttonExample4': (BuildContext context) =>
          const ButtonExample4(title: '文字按钮'),
          '/buttonExample5': (BuildContext context) =>
          const ButtonExample5(title: '图标按钮'),
          '/buttonExample6': (BuildContext context) =>
          const ButtonExample6(title: '浮动操作按钮'),
          '/buttonExample7': (BuildContext context) =>
          const ButtonExample7(title: 'Material风格按钮'),
          '/buttonExample8': (BuildContext context) =>
          const ButtonExample8(title: '简易文本按钮'),
          '/buttonExample9': (BuildContext context) =>
          const ButtonExample9(title: '无默认样式按钮'),
          '/buttonExample10': (BuildContext context) =>
          const ButtonExample10(title: '弹出菜单按钮'),
          '/buttonExample11': (BuildContext context) =>
          const ButtonExample11(title: '下拉按钮'),

          '/imageExample': (BuildContext context) =>
          const ImageExample(title: '读取图片的方式'),
          '/imageExample2': (BuildContext context) =>
          const ImageExample2(title: '设置图片不同状态展示效果'),
          '/imageExample3': (BuildContext context) =>
          const ImageExample3(title: '圆角或圆形图片'),
          '/imageExample4': (BuildContext context) =>
          const ImageExample4(title: '图片适配模式'),
          '/imageExample5': (BuildContext context) =>
          const ImageExample5(title: '图片混合模式'),
          '/imageExample6': (BuildContext context) =>
          const ImageExample6(title: '图片平铺'),
          '/iconExample': (BuildContext context) =>

          const IconExample(title: '使用Flutter默认自带的字体图标'),
          '/iconExample2': (BuildContext context) =>
          const IconExample2(title: '使用自定义字体图标'),

          '/switchExample': (BuildContext context) =>
          const SwitchExample(title: '开关'),
          '/checkboxExample': (BuildContext context) =>
          const CheckboxExample(title: '复选框'),
          '/radioExample': (BuildContext context) =>
          const RadioExample(title: '单选按钮'),
          '/textFieldExample': (BuildContext context) =>
          const TextFieldExample(title: 'TextField、InputDecoration参数说明'),
          '/textFieldExample2': (BuildContext context) =>
          const TextFieldExample2(title: '通过变量记录输入框内容'),
          '/textFieldExample3': (BuildContext context) =>
          const TextFieldExample3(title: '通过控制器获取输入框内容'),
          '/textFieldExample4': (BuildContext context) =>
          const TextFieldExample4(title: '控制焦点切换'),
          '/textFieldExample5': (BuildContext context) =>
          const TextFieldExample5(title: '自定义样式'),
          '/textFieldExample6': (BuildContext context) =>
          const TextFieldExample6(title: '自定义TextField组件'),
          '/formExample': (BuildContext context) =>
          const FormExample(title: '表单组件使用'),

          '/progressExample': (BuildContext context) =>
          const ProgressExample(title: '进度条使用'),

          '/constrainedExample': (BuildContext context) =>
          const ConstrainedExample(title: '约束子组件尺寸'),
          '/flexExample': (BuildContext context) =>
          const FlexExample(title: '弹性布局'),
          '/rowExample': (BuildContext context) =>
          const RowExample(title: 'Row-沿水平方向排列子组件'),
          '/columnExample': (BuildContext context) =>
          const ColumnExample(title: 'Column-沿垂直方向排列子组件'),
          '/columnExample2': (BuildContext context) =>
          const ColumnExample2(title: 'Column-嵌套'),
          '/wrapExample': (BuildContext context) =>
          const WrapExample(title: '流式布局'),
          '/flowExample': (BuildContext context) =>
          const FlowExample(title: '自定义流式布局'),
          '/positionedExample': (BuildContext context) =>
          const PositionedExample(title: '层叠布局,绝对定位'),
          '/alignExample': (BuildContext context) =>
          const AlignExample(title: '对齐方式'),
          '/centerExample': (BuildContext context) =>
          const CenterExample(title: '水平垂直居中'),
          '/layoutBuilderExample': (BuildContext context) =>
          const LayoutBuilderExample(title: '布局生成器,响应式布局'),

          '/paddingExample': (BuildContext context) =>
          const PaddingExample(title: '为子节点添加内边距'),
          '/decoratedBoxExample': (BuildContext context) =>
          const DecoratedBoxExample(title: '装饰容器'),
          '/transformExample': (BuildContext context) =>
          const TransformExample(title: 'Transform矩阵变换'),
          '/containerExample': (BuildContext context) =>
          const ContainerExample(title: '多功能容器组件'),
          '/clipExample': (BuildContext context) =>
          const ClipExample(title: '各种剪裁组件使用'),
          '/overflowBoxExample': (BuildContext context) =>
          const OverflowBoxExample(title: '允许子控件超出父控件的边界'),
          '/fittedBoxExample': (BuildContext context) =>
          const FittedBoxExample(title: '空间适配'),
          '/scaffoldExample': (BuildContext context) =>
          const ScaffoldExample(title: '页面骨架'),

          '/rawScrollbarExample': (BuildContext context) =>
          const RawScrollbarExample(title: '自定义滚动条样式'),
          '/singleChildScrollViewExample': (BuildContext context) =>
          const SingleChildScrollViewExample(title: '单元素滚动'),
          '/listViewExample': (BuildContext context) =>
          const ListViewExample(title: '多元素滚动'),
          '/listViewBuilderExample': (BuildContext context) =>
          const ListViewBuilderExample(title: '动态构建视口内元素'),
          '/listViewSeparatedExample': (BuildContext context) =>
          const ListViewSeparatedExample(title: '动态构建视口内元素-带分割线'),
          '/infiniteListViewExample': (BuildContext context) =>
          const InfiniteListViewExample(title: '无限加载列表'),
          '/scrollControllerExample': (BuildContext context) =>
          const ScrollControllerExample(title: '滚动位置监听及控制'),
          '/notificationListenerExample': (BuildContext context) =>
          const NotificationListenerExample(title: '滚动信息监听'),
          '/animatedListExample': (BuildContext context) =>
          const AnimatedListExample(title: '动画列表'),
          '/gridViewExample': (BuildContext context) =>
          const GridViewExample(title: '网格列表'),
          '/pageViewExample': (BuildContext context) =>
          const PageViewExample(title: '水平或垂直换页效果'),
          '/automaticKeepAliveExample': (BuildContext context) =>
          const AutomaticKeepAliveExample(title: '可滚动组件子项缓存'),
          '/keepAliveWrapperExample': (BuildContext context) =>
          const KeepAliveWrapperExample(title: '自定义包裹缓存组件'),
          '/tabBarViewExample': (BuildContext context) =>
          const TabBarViewExample(title: '选项卡，选项窗口'),
          '/bottomNavigationBarExample': (BuildContext context) =>
          const BottomNavigationBarExample(title: '底部导航加页面切换'),
          '/bottomNavigationBarEnhanceExample': (BuildContext context) =>
          const BottomNavigationBarEnhanceExample(title: '自定义的底部导航'),
          '/customScrollViewExample': (BuildContext context) =>
          const CustomScrollViewExample(title: '多列表组合滚动'),
          '/customScrollViewExample2': (BuildContext context) =>
          const CustomScrollViewExample2(title: '滚动appbar固定'),
          '/customScrollViewExample3': (BuildContext context) =>
          const CustomScrollViewExample3(title: '滚动标题固定'),
          '/nestedScrollViewExample': (BuildContext context) =>
          const NestedScrollViewExample(title: '滚动嵌套-TabBarView'),
          '/nestedScrollViewExample2': (BuildContext context) =>
          const NestedScrollViewExample2(title: '滚动嵌套-ListView'),
          '/staggeredGridViewExample': (BuildContext context) =>
          const StaggeredGridViewExample(title: 'staired'),
          '/staggeredGridViewExample2': (BuildContext context) =>
          const StaggeredGridViewExample2(title: 'woven'),
          '/staggeredGridViewExample3': (BuildContext context) =>
          const StaggeredGridViewExample3(title: 'aligned'),
          '/staggeredGridViewExample4': (BuildContext context) =>
          const StaggeredGridViewExample4(title: 'masonry'),
          '/staggeredGridViewExample5': (BuildContext context) =>
          const StaggeredGridViewExample5(title: 'quilted'),
          '/staggeredGridViewExample6': (BuildContext context) =>
          const StaggeredGridViewExample6(title: 'staggered'),

          '/willPopScopeExample': (BuildContext context) =>
          const WillPopScopeExample(title: '导航返回拦截'),
          '/inheritedWidgetExample': (BuildContext context) =>
          const InheritedWidgetExample(title: '数据共享'),
          '/customProviderExample': (BuildContext context) =>
          const CustomProviderExample(title: '自定义状态管理-跨组件状态共享'),
          '/colorThemeExample': (BuildContext context) =>
          const ColorThemeExample(title: '颜色和主题'),
          '/valueListenableBuilderExample': (BuildContext context) =>
          const ValueListenableBuilderExample(title: '监听任意层级数据源变化重新build'),
          '/futureBuilderExample': (BuildContext context) =>
          const FutureBuilderExample(title: 'FutureBuilder-异步UI更新'),
          '/streamBuilderExample': (BuildContext context) =>
          const StreamBuilderExample(title: 'StreamBuilder-异步UI更新'),
          '/alertDialogExample': (BuildContext context) =>
          const AlertDialogExample(title: 'AlertDialog-完整对话框'),
          '/simpleDialogExample': (BuildContext context) =>
          const SimpleDialogExample(title: 'SimpleDialog-简单对话框'),
          '/dialogExample': (BuildContext context) =>
          const DialogExample(title: 'Dialog-异步内容对话框'),
          '/showCustomDialogExample': (BuildContext context) =>
          const ShowCustomDialogExample(title: '对话框打开动画及遮罩'),
          '/dialogStateExample': (BuildContext context) =>
          const DialogStateExample(title: '对话框内部状态管理'),
          '/showModalBottomSheetExample': (BuildContext context) =>
          const ShowModalBottomSheetExample(title: '底部对话框'),
          '/showDatePickerExample': (BuildContext context) =>
          const ShowDatePickerExample(title: '日历选择器'),

          '/listenerExample': (BuildContext context) =>
          const ListenerExample(title: '原始指针事件处理'),
          '/gestureDetectorExample': (BuildContext context) =>
          const GestureDetectorExample(title: '手势识别'),
          '/eventBusExample': (BuildContext context) =>
          const EventBusExample(title: '事件总线'),
          '/notificationExample': (BuildContext context) =>
          const NotificationExample(title: '通知'),
          '/notificationExample2': (BuildContext context) =>
          const NotificationExample2(title: '自定义通知'),

          '/animationExample': (BuildContext context) =>
          const AnimationExample(title: '基础动画使用及状态监听'),
          '/animationExample2': (BuildContext context) =>
          const AnimationExample2(title: '自定义路由切换动画'),
          '/animationExample3': (BuildContext context) =>
          const AnimationExample3(title: 'Hero动画'),
          '/animationExample4': (BuildContext context) =>
          const AnimationExample4(title: '交织动画'),
          '/animationExample5': (BuildContext context) =>
          const AnimationExample5(title: '动画切换组件'),
          '/animationExample6': (BuildContext context) =>
          const AnimationExample6(title: '自定义动画过渡组件'),
          '/animationExample7': (BuildContext context) =>
          const AnimationExample7(title: 'Flutter预置的动画过渡组件'),

          '/customWidgetExample': (BuildContext context) =>
          const CustomWidgetExample(title: '自定义渐变按钮'),
          '/customWidgetExample2': (BuildContext context) =>
          const CustomWidgetExample2(title: '自定义旋转组件'),
          '/customWidgetExample3': (BuildContext context) =>
          const CustomWidgetExample3(title: '自绘组件-棋盘格'),
          '/customWidgetExample4': (BuildContext context) =>
          const CustomWidgetExample4(title: '自绘组件-圆形背景渐变进度条'),
          '/customWidgetExample5': (BuildContext context) =>
          const CustomWidgetExample5(title: '自绘组件-CustomCheckbox'),
          '/customWidgetExample6': (BuildContext context) =>
          const CustomWidgetExample6(title: '自绘组件-DoneWidget'),

          '/ioExample': (BuildContext context) => const IOExample(title: '文件操作'),
          '/ioExample2': (BuildContext context) =>
          const IOExample2(title: 'HTTP请求'),
          '/ioExample3': (BuildContext context) =>
          const IOExample3(title: 'Http请求库-dio'),
          '/ioExample4': (BuildContext context) =>
          const IOExample4(title: 'Http分块下载'),
          '/ioExample5': (BuildContext context) =>
          const IOExample5(title: 'WebSockets'),
          '/ioExample6': (BuildContext context) =>
          const IOExample6(title: '使用Socket API'),
        },
      getPages: AppPages.routes,
      translations: TranslationService(),
      /// 默认语言
      locale: Locale.fromSubtags(languageCode: Get.find<SettingsStore>().settings[SettingsKeys.locale]!),
      /// 没有相关语言包使用的降级语言
      fallbackLocale: const Locale('en', 'US'),
      /// 主题
      theme: CustomTheme.getThemeData(Get.find<SettingsStore>().settings[SettingsKeys.themeMode]),
    );
  }
}
/// ios release 包
// flutter build ios --release
// flutter install

/// android 打各位系统的包
// flutter build apk --split-per-abi
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle titleStyle = const TextStyle(color: Colors.blue);
  TextStyle subTitleStyle = const TextStyle(color: Colors.blueGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            ////////////////////////////////Widget简介///////////////////////////////
            ExpansionTile(
                title: Text('Widget简介', style: titleStyle),
                subtitle: Text('flutter中一切皆Widget，不仅用来表示ui，同样用来表示功能，通过Widget嵌套的方式来构建ui与事件处理\n\n与其他平台不一样，其他平台一般会划分ui控件与功能性api\n\nflutter中的Widget只是用来描述ui信息或者功能信息的配置声明,并不是屏幕里面看到的显示对象,这一点和其他各类客户端图形框架一样，开发者编写的只是框架层设计好的抽象语法，渲染引擎将真正的渲染细节隐藏起来了，可以让开发者更专注的开发应用的功能与业务，而不必把精力放到计算机底层渲染上来。', style: subTitleStyle,),
                children: [
                  ListTile(
                    title: const Text('Widget到屏幕的流程'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/widgetExplain');
                    },
                  ),
                  ListTile(
                    title: const Text('Context'),
                    subtitle: const Text('widget的build方法有一个context参数，它是BuildContext类的一个实例,如果想再这个build内部再获取子widget的context可以用Build方法参数里面会得到这个子Widget的context,每个widget都有一个对应的context对象， 用于表示该widget在widget树中的位置\ncontext提供了一种方法，使得我们可以从当前widget开始向上或向下遍历Widget树，以及按照widget类型查找父级widget。\n通过context，可以访问到一些公共的widget相关的信息，例如Theme、MediaQuery、本地信息、路由导航'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/contextExample');
                    },
                  ),
                  const ListTile(
                    title: Text('StatelessWidget、StatefulWidget'),
                    subtitle: Text('Flutter 的 widget 类型分为StatelessWidget（无状态）、StatefulWidget（有状态）,类似react里面的智能组件与木偶组件\nStatelessWidget 内部不维护状态，直接根据外部props进行构建\nStatefulWidget内部有专门的State类来管理状态和更新视图,结合外部props和内部状态构建ui'),
                  ),
                  const ListTile(
                    title: Text('State'),
                    subtitle: Text('一个 StatefulWidget 类会对应一个 State 类，State表示与其对应的 StatefulWidget 要维护的状态\nState里面也可以通过context做一样的操作，\n通过widget属性访问与该 State 实例关联的 widget 实例'),
                  ),
                  ListTile(
                    title: const Text('State生命周期'),
                    subtitle: const Text('通过一个例子运行查看state生命周期'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/stateExample');
                    },
                  ),
                  ListTile(
                    title: const Text('在 widget 树中获取State对象'),
                    subtitle: const Text('由于 StatefulWidget 的具体逻辑都在其 State 中，所以很多时候，我们需要获取 StatefulWidget 对应的State 对象来调用一些方法，比如Scaffold组件对应的状态类ScaffoldState中就定义了打开 SnackBar（路由页底部提示条）的方法。我们有两种方法在子 widget 树中获取父级 StatefulWidget 的State 对象。'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/getStateExample');
                    },
                  ),
                ]),

            ////////////////////////////////状态管理///////////////////////////////
            ExpansionTile(
              title: Text('状态管理', style: titleStyle),
              subtitle: Text('响应式的编程框架都会有状态管理这个概念，最先使用的react/vue，到现在的flutter swift ui都在使用数据驱动视图来简化开发复杂度，既然是数据驱动视图，那么这个公共的数据就需要合理的管理。比如组件内部状态可以由内部管理，需要共享外部模块的状态由父级管理，需要跨路由共享状态的则由全局状态管理来维护。', style: subTitleStyle,),
              children: [
                ListTile(
                  title: const Text('基础状态管理'),
                  subtitle: const Text('基本的状态管理使用方式'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/stateManageExample');
                  },
                ),
                ListTile(
                  title: const Text('全局状态管理'),
                  subtitle: const Text('需要跨路由共享的状态，比如全局公共配置，用户状态，购物车等,这些则需要用到全局状态管理Provider、Redux等，或则自行实现'),
                ),


              ],
            ),

            ////////////////////////////////路由管理///////////////////////////////
            ExpansionTile(
              title: Text('路由管理', style: titleStyle),
              subtitle: Text('flutter中路由与其他平台路由概念意义一样,以栈的形式管理页面视图之间的跳转，路由实例只能是继承于PageRoute的子实例，比如MaterialPageRoute根据平台变化风格的页面路由，或者窗口路由和自定义路由。', style: subTitleStyle,),
              children: [
                ListTile(
                  title: const Text('MaterialPageRoute/CupertinoPageRoute'),
                  subtitle: const Text('MaterialPageRoute 是 Material组件库提供的组件，它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画\nCupertinoPageRoute是ios风格的路由'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/materialPageRouteExample');
                  },
                ),

                ListTile(
                  title: const Text('Navigator'),
                  subtitle: const Text('Navigator是一个路由管理的组件，它提供了打开和退出路由页方法。Navigator通过一个栈来管理活动路由集合'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/navigatorExample');
                  },
                ),

                ListTile(
                  title: const Text('普通路由传值'),
                  subtitle: const Text('路由跳转时携带参数，或者回退时返回参数'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/routeArgumentsExample');
                  },
                ),

                ListTile(
                  title: const Text('命名路由'),
                  subtitle: const Text('命名路由就是拥有名称的路由，以key/value的形式定义在map里面，然后通过匹配到这个对应的key渲染其对应的路由,可以很方便的对路由进行集中式管理，使用时只需要通过名字即可完成跳转。命名路由需要定义到MaterialApp的routes上面，或者onGenerateRoute函数里面匹配并返回'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/namedRouteExample', arguments: {
                      'a': '123',
                      'b': '456'
                    });
                  },
                ),

                ListTile(
                  title: const Text('路由拦截'),
                  subtitle: const Text('路由拦截是指在进入路由之前进行拦截：\n 1. 自定义一个跳转方法，对路由跳转进行包装，再里面通过参数控制跳转逻辑实现拦截效果\n2. 通过onGenerateRoute钩子，在触发路由跳转的时候如果路由表里面未注册这个路由，那么会触发该回调，在里面可以拿到路由的settings信息，根据信息去进行拦截或重定向到其他路由'),
                ),

                ListTile(
                  title: const Text('监听路由变化'),
                  subtitle: const Text('MaterialApp中有navigatorObservers属性定义监听变化的对象,可以监听到路由进栈、出栈、替换等'),
                ),

                ListTile(
                  title: const Text('404路由'),
                  subtitle: const Text('MaterialApp中有onUnknownRoute属性定义打开一个不存在的路由时返回的替代路由, 此功能也可以通过onGenerateRoute去实现，打开新路由时会触发这个方法，内部匹配定义的路由表key，成功匹配返回对应的路由，未匹配返回404路由页面'),
                ),

                ListTile(
                  title: const Text('路由动画'),
                  subtitle: const Text('除了MaterialPageRoute和CupertinoPageRoute平台风格动画，还可以自定义路由动画'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/routeAnimationExample');
                  },
                ),

              ],
            ),


            ////////////////////////////////文本及样式///////////////////////////////
            ExpansionTile(
              title: Text('文本及样式', style: titleStyle),
              subtitle: Text('在flutter里面如何使用文字和样式设置', style: subTitleStyle,),
              children: [
                ListTile(
                  title: const Text('Text'),
                  subtitle: const Text('文字组件'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/textExample');
                  },
                ),
                ListTile(
                  title: const Text('Text.rich、RichText > TextSpan'),
                  subtitle: const Text('富文本片段样式及手势交互'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/textSpanExample');
                  },
                ),
                ListTile(
                  title: const Text('DefaultTextStyle'),
                  subtitle: const Text(
                      '默认文字样式, 比如应用默认文字样式，或者页面级默认样式,可通过DefaultTextStyle定义'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/defaultTextStyleExample');
                  },
                ),
                ListTile(
                  title: const Text('自定义字体'),
                  subtitle: const Text('flutter中使用自定义字体'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/fontExample');
                  },
                ),
              ],
            ),


            ////////////////////////////////按钮///////////////////////////////
            ExpansionTile(
              title: Text('按钮', style: titleStyle),
              subtitle: Text('flutter里面自带的各种按钮', style: subTitleStyle,),
              children: [
                ListTile(
                  title: const Text('BackButton、CloseButton'),
                  subtitle: const Text('具备一定功能的按钮，返回、关闭...'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample1');
                  },
                ),
                ListTile(
                  title: const Text('ElevatedButton'),
                  subtitle: const Text('有投影的按钮'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample2');
                  },
                ),
                ListTile(
                  title: const Text('OutlinedButton'),
                  subtitle: const Text('轮廓按钮'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample3');
                  },
                ),
                ListTile(
                  title: const Text('TextButton'),
                  subtitle: const Text('文字按钮'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample4');
                  },
                ),
                ListTile(
                  title: const Text(
                      'IconButton、ElevatedButton.icon、OutlinedButton.icon、TextButton.icon'),
                  subtitle: const Text('图标按钮，按钮里面也可加图标'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample5');
                  },
                ),
                ListTile(
                  title: const Text('FloatingActionButton'),
                  subtitle: const Text('浮动操作按钮'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample6');
                  },
                ),
                ListTile(
                  title: const Text('MaterialButton'),
                  subtitle: const Text('Material风格按钮,自定义程度高'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample7');
                  },
                ),
                ListTile(
                  title: const Text('TextSelectionToolbarTextButton'),
                  subtitle: const Text('简易文字按钮，继承父级文字样式'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample8');
                  },
                ),
                ListTile(
                  title: const Text('RawMaterialButton'),
                  subtitle: const Text('直接继承StatefulWidget，无默认样式的按钮,更方便根据设计图自定义'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample9');
                  },
                ),
                ListTile(
                  title: const Text('PopupMenuButton'),
                  subtitle: const Text('弹出菜单按钮'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample10');
                  },
                ),
                ListTile(
                  title: const Text('DropdownButton'),
                  subtitle: const Text('下拉按钮'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/buttonExample11');
                  },
                ),
              ],
            ),

            ////////////////////////////////图片///////////////////////////////
            ExpansionTile(
              title: Text(
                '图片相关栗子',
                style: titleStyle,
              ),
              children: [
                ListTile(
                  title: const Text('Image asset network file memory'),
                  subtitle: const Text('读取图片的方式'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/imageExample');
                  },
                ),
                ListTile(
                  title: const Text('frameBuilder loadingBuilder errorBuilder'),
                  subtitle: const Text('设置图片不同状态展示效果'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/imageExample2');
                  },
                ),
                ListTile(
                  title: const Text(
                      'CircleAvatar DecorationImage ClipOval ClipRRect'),
                  subtitle: const Text('圆角或圆形图片'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/imageExample3');
                  },
                ),
                ListTile(
                  title: const Text('BoxFit'),
                  subtitle: const Text('图片适配模式'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/imageExample4');
                  },
                ),
                ListTile(
                  title: const Text('BlendMode'),
                  subtitle: const Text('图片混合模式'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/imageExample5');
                  },
                ),
                ListTile(
                  title: const Text('ImageRepeat'),
                  subtitle: const Text('图片平铺'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/imageExample6');
                  },
                ),
              ],
            ),

            ////////////////////////////////图标///////////////////////////////
            ExpansionTile(
              title: Text(
                '图标相关栗子',
                style: titleStyle,
              ),
              children: [
                ListTile(
                  title: const Text('Material Design字体图标'),
                  subtitle: const Text('使用Flutter默认自带的字体图标'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/iconExample');
                  },
                ),
                ListTile(
                  title: const Text('自定义字体图标'),
                  subtitle: const Text('使用自定义字体图标'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/iconExample2');
                  },
                ),
              ],
            ),


            ////////////////////////////////表单///////////////////////////////
            ExpansionTile(
              title: Text(
                '表单相关栗子',
                style: titleStyle,
              ),
              children: [
                ListTile(
                  title: const Text('Switch'),
                  subtitle: const Text('开关组件'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/switchExample');
                  },
                ),
                ListTile(
                  title: const Text('Checkbox'),
                  subtitle: const Text('复选框组件'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/checkboxExample');
                  },
                ),
                ListTile(
                  title: const Text('Radio'),
                  subtitle: const Text('单选组件'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/radioExample');
                  },
                ),
                ListTile(
                  title: const Text('TextField、InputDecoration参数说明'),
                  subtitle: const Text('输入框api'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/textFieldExample');
                  },
                ),
                ListTile(
                  title: const Text('TextField'),
                  subtitle: const Text('输入框组件，通过变量获取值'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/textFieldExample2');
                  },
                ),
                ListTile(
                  title: const Text('TextField'),
                  subtitle: const Text('输入框组件，通过controller直接获取'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/textFieldExample3');
                  },
                ),
                ListTile(
                  title: const Text('FocusNode、FocusScopeNode'),
                  subtitle: const Text('控制焦点切换'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/textFieldExample4');
                  },
                ),
                ListTile(
                  title: const Text('TextField'),
                  subtitle: const Text('输入框组件，自定义样式'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/textFieldExample5');
                  },
                ),
                ListTile(
                  title: const Text('自定义TextField'),
                  subtitle: const Text('TextField默认样式太丑，可通过自定义简化设置'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/textFieldExample6');
                  },
                ),
                ListTile(
                  title: const Text('Form FormField FormState'),
                  subtitle: const Text('form表单组件'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/formExample');
                  },
                ),
              ],
            ),

            ////////////////////////////////进度条///////////////////////////////
            ExpansionTile(
              title: Text(
                '进度条相关栗子',
                style: titleStyle,
              ),
              children: [
                ListTile(
                  title: const Text(
                      'LinearProgressIndicator CircularProgressIndicator'),
                  subtitle: const Text('条状和圆形进度条'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/progressExample');
                  },
                ),
              ],
            ),

            ////////////////////////////////布局///////////////////////////////
            ExpansionTile(
              title: Text(
                '布局相关栗子',
                style: titleStyle,
              ),
              children: [
                ListTile(
                  title: const Text(
                      'ConstrainedBox SizedBox UnconstrainedBox AspectRatio LimitedBox FractionallySizedBox'),
                  subtitle: const Text('约束子组件尺寸'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/constrainedExample');
                  },
                ),
                ListTile(
                  title: const Text('Flex、Expanded、Spacer'),
                  subtitle: const Text('Flex弹性布局,类似h5的flex，\nExpanded占据剩余空间包含子元素\nSpacer占位符只占据空间没有子元素\n使用的时候尽量用Row、Column，因为他们更直观简洁，都属于Flex派生类只是改变了方向而已,但是更语意话'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/flexExample');
                  },
                ),
                ListTile(
                  title: const Text('Row'),
                  subtitle: const Text('线性布局,沿水平方向排列子组件\n 直接继承Flex,方向改成了horizontal'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/rowExample');
                  },
                ),
                ListTile(
                  title: const Text('Column'),
                  subtitle: const Text('线性布局,沿垂直方向排列子组件\n 直接继承Flex,方向改成了vertical'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/columnExample');
                  },
                ),
                ListTile(
                  title: const Text('Column>Column'),
                  subtitle: const Text('Flex嵌套的情况下，子Flex元素不会铺满父空间，如果需要铺满可以借助Expanded'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/columnExample2');
                  },
                ),
                ListTile(
                  title: const Text('Wrap'),
                  subtitle: const Text('流式布局自动换行\nWrap和Flex一样多了个换行功能，和间距设置'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/wrapExample');
                  },
                ),
                ListTile(
                  title: const Text('Flow'),
                  subtitle: const Text('自定义流式布局(很少使用)'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/flowExample');
                  },
                ),
                ListTile(
                  title: const Text('Stack、Positioned'),
                  subtitle: const Text('层叠布局,绝对定位'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/positionedExample');
                  },
                ),
                ListTile(
                  title: const Text('Align'),
                  subtitle: const Text('以中心点或左上角为基准，按百分比相对父级定位'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/alignExample');
                  },
                ),
                ListTile(
                  title: const Text('Center'),
                  subtitle: const Text('水平垂直居中\n直接继承Align居中,支持宽高比例设置'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/centerExample');
                  },
                ),
                ListTile(
                  title: const Text('LayoutBuilder'),
                  subtitle: const Text('响应式布局，根据其父容器的约束条件来构建子组件。它通常用于动态地根据父容器的大小或约束条件来构建子组件'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/layoutBuilderExample');
                  },
                ),
              ],
            ),

            ////////////////////////////////各类容器///////////////////////////////
            ExpansionTile(
              title: Text(
                '容器相关栗子',
                style: titleStyle,
              ),
              children: [
                ListTile(
                  title: const Text('Padding'),
                  subtitle: const Text('为子节点添加内边距'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/paddingExample');
                  },
                ),
                ListTile(
                  title: const Text('DecoratedBox'),
                  subtitle:
                  const Text('可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/decoratedBoxExample');
                  },
                ),
                ListTile(
                  title: const Text('Transform、RotatedBox'),
                  subtitle: const Text('子组件绘制时对其应用一些矩阵变换'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/transformExample');
                  },
                ),
                ListTile(
                  title: const Text('Container'),
                  subtitle: const Text(
                      'LimitedBox、ConstrainedBox、Align、Padding、ColoredBox、ClipPath、DecoratedBox、Transform组件组合的一个多功能容器'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/containerExample');
                  },
                ),
                ListTile(
                  title: const Text('ClipOval、ClipRRect、ClipRect、ClipPath'),
                  subtitle: const Text('各种裁剪组件使用'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/clipExample');
                  },
                ),
                ListTile(
                  title: const Text('OverflowBox、SizedOverflowBox'),
                  subtitle: const Text('溢出容器,允许子控件超出父控件的边界'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/overflowBoxExample');
                  },
                ),
                ListTile(
                  title: const Text('FittedBox'),
                  subtitle: const Text('空间适配'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/fittedBoxExample');
                  },
                ),
                ListTile(
                  title: const Text('Scaffold'),
                  subtitle: const Text('页面骨架'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/scaffoldExample');
                  },
                ),
              ],
            ),

            ////////////////////////////////滚动///////////////////////////////
            ExpansionTile(
              title: Text(
                '滚动相关栗子',
                style: titleStyle,
              ),
              children: [
                ListTile(
                  title: const Text('RawScrollbar'),
                  subtitle: const Text('自定义滚动条样式'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/rawScrollbarExample');
                  },
                ),
                ListTile(
                  title: const Text('SingleChildScrollView'),
                  subtitle: const Text('单元素滚动，不支持局部渲染，只应在内容不会超过屏幕太多时使用'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/singleChildScrollViewExample');
                  },
                ),
                ListTile(
                  title: const Text('ListView'),
                  subtitle: const Text(
                      '多元素滚动，支持局部渲染，但是需要提前将子元素创建好，适合只有少量的子组件数量已知且比较少的情况'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/listViewExample');
                  },
                ),
                ListTile(
                  title: const Text('ListView.builder'),
                  subtitle: const Text('动态构建视口内元素，适合列表项比较多或者列表项不确定的情况'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/listViewBuilderExample');
                  },
                ),
                ListTile(
                  title: const Text('ListView.separated'),
                  subtitle:
                  const Text('动态构建视口内元素，可为每一项加一个分割线，适合列表项比较多或者列表项不确定的情况'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/listViewSeparatedExample');
                  },
                ),
                ListTile(
                  title: const Text('无限加载列表'),
                  subtitle: const Text(
                      '从数据源异步分批拉取数据,拉取过程中在表尾显示一个loading，拉取成功后将数据插入列表；如果不需要再去拉取，则在表尾提示"没有更多"。'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/infiniteListViewExample');
                  },
                ),
                ListTile(
                  title: const Text('ScrollController'),
                  subtitle: const Text('滚动位置监听及控制'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/scrollControllerExample');
                  },
                ),
                ListTile(
                  title: const Text('NotificationListener'),
                  subtitle: const Text('滚动信息监听'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/notificationListenerExample');
                  },
                ),
                ListTile(
                  title: const Text('AnimatedList'),
                  subtitle: const Text(
                      'AnimatedList 和 ListView 的功能大体相似，不同的是， AnimatedList 可以在列表中插入或删除节点时执行一个动画，在需要添加或删除列表项的场景中会提高用户体验。'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/animatedListExample');
                  },
                ),
                ListTile(
                  title: const Text('GridView'),
                  subtitle: const Text('网格列表'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/gridViewExample');
                  },
                ),
                ListTile(
                  title: const Text('PageView'),
                  subtitle: const Text('水平或垂直换页效果,页面缓存'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/pageViewExample');
                  },
                ),
                ListTile(
                  title: const Text('AutomaticKeepAliveClientMixin'),
                  subtitle: const Text('可滚动组件子项缓存'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/automaticKeepAliveExample');
                  },
                ),
                ListTile(
                  title: const Text('KeepAliveWrapper'),
                  subtitle: const Text('自定义包裹缓存组件,灵活自由'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/keepAliveWrapperExample');
                  },
                ),
                ListTile(
                  title: const Text('TabBar、TabBarView'),
                  subtitle: const Text('选项卡，选项窗口'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/tabBarViewExample');
                  },
                ),
                ListTile(
                  title: const Text('BottomNavigationBar、PageView'),
                  subtitle: const Text('底部导航加页面切换，模拟真实应用交互'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/bottomNavigationBarExample');
                  },
                ),
                ListTile(
                  title: const Text('BottomNavigationBarEnhance'),
                  subtitle: const Text('自定义的底部导航，自由度更高，支持动画，还可以扩展其他比如点击播放精灵动画，声音等都可以自行实现，这些如果默认的widget是无法实现的'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/bottomNavigationBarEnhanceExample');
                  },
                ),
                ListTile(
                  title: const Text('CustomScrollView'),
                  subtitle: const Text('多列表组合滚动'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/customScrollViewExample');
                  },
                ),
                ListTile(
                  title: const Text('CustomScrollView'),
                  subtitle: const Text('滚动appbar固定'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/customScrollViewExample2');
                  },
                ),
                ListTile(
                  title: const Text('CustomScrollView'),
                  subtitle: const Text('滚动标题固定'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/customScrollViewExample3');
                  },
                ),
                ListTile(
                  title: const Text('NestedScrollView'),
                  subtitle: const Text('滚动嵌套-TabBarView'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/nestedScrollViewExample');
                  },
                ),
                ListTile(
                  title: const Text('NestedScrollView'),
                  subtitle: const Text('滚动嵌套-ListView'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/nestedScrollViewExample2');
                  },
                ),
                ListTile(
                  title: const Text('staired'),
                  subtitle: const Text('交错网格布局'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/staggeredGridViewExample');
                  },
                ),
                ListTile(
                  title: const Text('woven'),
                  subtitle: const Text('创建交错的“编织”布局'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/staggeredGridViewExample2');
                  },
                ),
                ListTile(
                  title: const Text('aligned'),
                  subtitle: const Text('交错网格列表'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/staggeredGridViewExample3');
                  },
                ),
                ListTile(
                  title: const Text('masonry'),
                  subtitle: const Text('瀑布流布局，网格项在垂直方向上自动填充空隙'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/staggeredGridViewExample4');
                  },
                ),
                ListTile(
                  title: const Text('quilted'),
                  subtitle: const Text('可以定义不同大小的网格块，形成类似于拼接的效果'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/staggeredGridViewExample5');
                  },
                ),
                ListTile(
                  title: const Text('staggered'),
                  subtitle: const Text('交错网格布局，可以定义每个网格项的跨度'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/staggeredGridViewExample6');
                  },
                ),
              ],
            ),

            ////////////////////////////////功能型Widget简介///////////////////////////////
            ExpansionTile(
              title: Text(
                '功能型Widget简介',
                style: titleStyle,
              ),
              children: [
                ListTile(
                  title: const Text('PopScope'),
                  subtitle: const Text('导航返回拦截'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/willPopScopeExample');
                  },
                ),
                ListTile(
                  title: const Text('InheritedWidget'),
                  subtitle: const Text('从上到下共享数据,和react context很像，可以直接跨级透传'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/inheritedWidgetExample');
                  },
                ),
                ListTile(
                  title: const Text('自定义状态管理'),
                  subtitle: const Text('利用InheritedWidget自定义状态管理-跨组件状态共享'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/customProviderExample');
                  },
                ),
                ListTile(
                  title: const Text('Color、Theme'),
                  subtitle: const Text('颜色和主题'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/colorThemeExample');
                  },
                ),
                ListTile(
                  title: const Text('ValueListenableBuilder'),
                  subtitle: const Text('监听ValueNotifier数据源变化重新build'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/valueListenableBuilderExample');
                  },
                ),
                ListTile(
                  title: const Text('FutureBuilder'),
                  subtitle: const Text('异步UI更新'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/futureBuilderExample');
                  },
                ),
                ListTile(
                  title: const Text('StreamBuilder'),
                  subtitle: const Text('异步UI更新'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/streamBuilderExample');
                  },
                ),
                ListTile(
                  title: const Text('AlertDialog'),
                  subtitle: const Text('AlertDialog-完整对话框'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/alertDialogExample');
                  },
                ),
                ListTile(
                  title: const Text('SimpleDialog'),
                  subtitle: const Text('SimpleDialog-简单对话框,列表选项'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/simpleDialogExample');
                  },
                ),
                ListTile(
                  title: const Text('Dialog'),
                  subtitle: const Text('Dialog-异步内容对话框'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/dialogExample');
                  },
                ),
                ListTile(
                  title: const Text('showGeneralDialog'),
                  subtitle: const Text('对话框打开动画及遮罩'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/showCustomDialogExample');
                  },
                ),
                ListTile(
                  title: const Text('对话框状态管理'),
                  subtitle: const Text('对话框内部状态管理'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/dialogStateExample');
                  },
                ),
                ListTile(
                  title: const Text('showModalBottomSheet'),
                  subtitle: const Text('底部对话框'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/showModalBottomSheetExample');
                  },
                ),
                ListTile(
                  title: const Text(
                      'showDatePicker、showCupertinoModalPopup、CupertinoDatePicker'),
                  subtitle: const Text('日历选择器'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/showDatePickerExample');
                  },
                ),
              ],
            ),

            ////////////////////////////////事件处理与通知///////////////////////////////
            ExpansionTile(
                title: Text(
                  '事件处理与通知',
                  style: titleStyle,
                ),
                children: [
                  ListTile(
                    title: const Text('Listener、IgnorePointer、AbsorbPointer'),
                    subtitle: const Text('原始指针事件处理'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/listenerExample');
                    },
                  ),
                  ListTile(
                    title: const Text('GestureDetector、GestureRecognizer'),
                    subtitle: const Text('手势识别'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/gestureDetectorExample');
                    },
                  ),
                  ListTile(
                    title: const Text('EventBus'),
                    subtitle: const Text('自定义事件总线'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/eventBusExample');
                    },
                  ),
                  ListTile(
                    title: const Text('Notification'),
                    subtitle: const Text('通知'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/notificationExample');
                    },
                  ),
                  ListTile(
                    title: const Text('MyNotification'),
                    subtitle: const Text('自定义通知'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/notificationExample2');
                    },
                  ),
                ]),

            ////////////////////////////////动画///////////////////////////////
            ExpansionTile(
                title: Text(
                  '动画',
                  style: titleStyle,
                ),
                children: [
                  ListTile(
                    title: const Text('基础动画使用及状态监听'),
                    subtitle: const Text('基础动画使用及状态监听'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/animationExample');
                    },
                  ),
                  ListTile(
                    title: const Text('自定义路由切换动画'),
                    subtitle: const Text('自定义路由切换动画'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/animationExample2');
                    },
                  ),
                  ListTile(
                    title: const Text('Hero动画'),
                    subtitle: const Text('跨路由穿越动画'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/animationExample3');
                    },
                  ),
                  ListTile(
                    title: const Text('交织动画'),
                    subtitle: const Text('同时多改变多个属性'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/animationExample4');
                    },
                  ),
                  ListTile(
                    title: const Text('AnimatedSwitcher'),
                    subtitle: const Text('动画切换组件,在组件切换时提供动画效果'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/animationExample5');
                    },
                  ),
                  ListTile(
                    title: const Text('自定义动画过渡组件'),
                    subtitle: const Text('动画过渡组件'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/animationExample6');
                    },
                  ),
                  ListTile(
                    title: const Text('Flutter预置的动画过渡组件'),
                    subtitle: const Text('Flutter预置的动画过渡组件'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/animationExample7');
                    },
                  ),
                ]),

            ////////////////////////////////自定义组件///////////////////////////////
            ExpansionTile(
                title: Text(
                  '自定义组件',
                  style: titleStyle,
                ),
                children: [
                  ListTile(
                    title: const Text('自定义渐变按钮'),
                    subtitle: const Text('组合-自定义渐变按钮'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/customWidgetExample');
                    },
                  ),
                  ListTile(
                    title: const Text('自定旋转组件'),
                    subtitle: const Text('组合-自定旋转组件'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/customWidgetExample2');
                    },
                  ),
                  ListTile(
                    title: const Text('CustomPaint 与 Canvas'),
                    subtitle: const Text('自绘组件-棋盘格'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/customWidgetExample3');
                    },
                  ),
                  ListTile(
                    title: const Text('CustomPaint 与 Canvas'),
                    subtitle: const Text('自绘组件-圆形背景渐变进度条'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/customWidgetExample4');
                    },
                  ),
                  ListTile(
                    title: const Text('RenderObject'),
                    subtitle: const Text('自绘组件-CustomCheckbox'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/customWidgetExample5');
                    },
                  ),
                  ListTile(
                    title: const Text('RenderObject'),
                    subtitle: const Text('自绘组件-DoneWidget'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/customWidgetExample6');
                    },
                  ),
                ]),

            ////////////////////////////////文件操作与网络请求///////////////////////////////
            ExpansionTile(
                title: Text(
                  '文件操作与网络请求',
                  style: titleStyle,
                ),
                children: [
                  ListTile(
                    title: const Text('文件操作'),
                    subtitle: const Text('文件操作'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/ioExample');
                    },
                  ),
                  ListTile(
                    title: const Text('HttpClient'),
                    subtitle: const Text('HTTP请求'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/ioExample2');
                    },
                  ),
                  ListTile(
                    title: const Text('dio'),
                    subtitle: const Text('Http请求库-dio'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/ioExample3');
                    },
                  ),
                  ListTile(
                    title: const Text('Http分块下载'),
                    subtitle: const Text('Http分块下载'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/ioExample4');
                    },
                  ),
                  ListTile(
                    title: const Text('WebSockets'),
                    subtitle: const Text('服务端与客户端可以通过此TCP连接进行实时通信'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/ioExample5');
                    },
                  ),
                  ListTile(
                    title: const Text('使用Socket API'),
                    subtitle: const Text(
                        'Socket API 是操作系统为实现应用层网络协议提供的一套基础的、标准的API，它是对传输层网络协议（主要是TCP/UDP）的一个封装'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/ioExample6');
                    },
                  ),
                ]),


            ////////////////////////////////getx///////////////////////////////
            ExpansionTile(
                title: Text(
                  'GetX ',
                  style: titleStyle,
                ),
                subtitle: Text('GetX可以让flutter变的更优雅，它是一个完整的解决方案\n 1减少样板代码，不在需要区分有状态和无状态，\n 2提高更新性能，只会更新与状态相关的部分界面，更细粒度的更新，不再需要setState \n 3让组件生命周期更统一 getx有自己标准的生命周期 \n 4让路由使用变的更简单,省掉了Navigator.of(context) \n 5让主题配置变的更简单 \n 6让国际化变的更简单，原flutter国际化还是很麻烦的 \n 7逻辑与ui解偶 不在需要mixin \n8全局状态管理 不再需要手动移除状态 \n9 这么看来原来GetX是专门为flutter而设计的一套解决方案 \n10GetX也是目前flutter少有的优秀的辅助解决方案，基本上互联网上关于flutter的教程后面都会附带GetX，可见其重要性', style: subTitleStyle,),
                children: [
                  ListTile(
                    title: const Text('手动简单状态管理GetBuilder'),
                    subtitle: const Text('GetBuilder可实现块粒度更新，需要手动调用upload，代价相当于块级组件内部调用stState，具体取决于GetBuilder的粒度，优势占用内存小，没有额外的隐藏科技'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed("/getBuilderExample");
                    },
                  ),
                  ListTile(
                    title: const Text('响应式状态管理GetX/Obx'),
                    subtitle: const Text('Obx可以响应式的细粒度更新，只有在它的状态真正变化时才会重建，内存占用比GetBuilder高，由于 Obx 是一个响应式组件，它需要在内部对可观察数据进行监听，以便及时捕获数据的变化并更新 UI。因此，相对于 GetBuilder，Obx 的内存占用可能会稍高一些。'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed("/obxExample");
                    },
                  ),
                  ListTile(
                    title: const Text('Getx路由'),
                    subtitle: const Text('flutter里面提供了非常丰富的功能来处理路由，但是编码稍显繁琐，比如必须传context，参数必须显式传递/接收，整体使用起来还是有点麻烦的，可以使用Getx里面的路由来简化使用方式，同时可使用中间件来做路由守卫'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed("/getRouteExample");
                    },
                  ),
                  ListTile(
                    title: const Text('GetConnect'),
                    subtitle: const Text('GetConnect 是一种使用 http 或 websockets 从后端到前端进行通信的简单方法，更好的和Gex结合，可代替Dio库，统一使用Getx解决方案，减少第三方的插件使用'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed("/getConnectExample");
                    },
                  ),
                  ListTile(
                    title: const Text('主题切换'),
                    subtitle: const Text('Getx包装了MaterialApp，可以直接调用Getx提供的方法进行主题切换,让实现方案更统一使用更方便'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed("/themeChangeExample");
                    },
                  ),
                  ListTile(
                    title: const Text('国际化多语言'),
                    subtitle: const Text('Getx支持多语言配置，使得flutter里面实现多语言就像react/vue使用i18n那样简单，原国际化方案还是非常麻烦的。'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed("/localesExample");
                    },
                  ),
                  ListTile(
                    title: const Text('Getx.Utils'),
                    subtitle: const Text('getx里面提供了很多实用的工具包，可以在项目里面直接使用提高开发效率'),

                  ),
                ]),


            ////////////////////////////////图片选择///////////////////////////////
            ExpansionTile(
                title: Text(
                  '额外常用组件封装 ',
                  style: titleStyle,
                ),
                children: [
                  ListTile(
                    title: const Text('ImagesPicker'),
                    subtitle: const Text('相册选择与拍照,封装了官方的ImagePicker功能组件，原组件没有ui相当于将选择流程的ui与功能结合的组件'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed("/imagePickerExample");
                    },
                  ),
                  ListTile(
                    title: const Text('GalleryPicker'),
                    subtitle: const Text('相册选择器,结合了ImagesPicker选择图片的功能，类似相册的网格展示,可增可删'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed("/galleryPickerExample");
                    },
                  ),
                  ListTile(
                    title: const Text('GalleryPreview'),
                    subtitle: const Text('图片预览,类似相册预览,所以叫GalleryPreview'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed("/galleryPreviewExample");
                    },
                  ),
                  ListTile(
                    title: const Text('DialogUtils'),
                    subtitle: const Text('对话框工具类，封装常用的对话框统一设置基础样式，减少样板代码的编写'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed("/dialogUtilsExample");
                    },
                  ),
                ]),
          ],
        )
    );
  }
}
