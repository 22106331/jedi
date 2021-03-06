import 'package:flutter/material.dart';
import 'package:jedi/category/flash/blocks/appbar_title.dart';
import 'package:jedi/category/flash/blocks/activity_bar.dart';
import 'package:jedi/category/flash/blocks/brand_hot_sale_title.dart';
import 'package:jedi/category/flash/blocks/brand_hot_sale.dart';
import 'package:jedi/category/flash/blocks/flash_featured_brand.dart';
import 'package:jedi/category/flash/blocks/flash_featured_item.dart';
import 'package:jedi/blocks/pulltore_fresh.dart';

/// 自定义的品牌闪购页面组件。
class FlashPage extends StatefulWidget {
  @override
  _FlashPageState createState() => _FlashPageState();
}

/// 与自定义的品牌闪购页面组件关联的状态子类。
class _FlashPageState extends State<FlashPage> {
  /// 列表视图（`ListView`）中要显示的数据。
  List<Widget> widgetList = [];

  /// 滚动控制器（`ScrollController`）类，控制可滚动的组件。
  ScrollController controller = ScrollController();

  /// 滚动物理（`ScrollPhysics`）类，确定滚动组件的物理特性。
  ScrollPhysics scrollPhysics = RefreshAlwaysScrollPhysics();

  /// 通过按钮等其他方式，通过方法调用触发下拉刷新。
  TriggerPullController triggerPullController = TriggerPullController();

  @override
  void initState() {
    // 第一次构建后会被调用。
    WidgetsBinding.instance.addPostFrameCallback((context) {
      triggerPullController.triggerPull();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// 构建列表视图（`ListView`）中要显示的初始化或常驻内容。
  List<Widget> _buildResidentData() {
    return <Widget>[
      ActivityBar(),
      BrandHotSaleTitle(),
      BrandHotSale(
        hotData: <HotItem>[
          HotItem(
            objUrl:
                'https://img.alicdn.com/i2/2615650292/O1CN011E1m5zcGXrNqYCH_!!2615650292.png_300x300.jpg',
            title: '抽纸批发整箱30包雪亮家庭装婴儿卫生纸巾家用餐巾纸面巾纸实惠装',
            rebatePrice: 26.99,
            couponPrice: 3.0,
          ),
          HotItem(
            objUrl:
                'http://logo.taobaocdn.com/shop-logo/ee/a1/TB1AxwhOXXXXXcPapXXwu0bFXXX.png',
            title: '【小魔鲸】A类女童内裤三角裤',
            rebatePrice: 15.5,
            couponPrice: 5.0,
          ),
          HotItem(
            objUrl: 'http://images.huasheng100.com/public/1553568711182897.png',
            title: '【Miss face】妆前乳美白防晒隔离霜',
            rebatePrice: 74.9,
            couponPrice: 15.0,
          ),
          HotItem(
            objUrl:
                'https://img.alicdn.com/i4/1097805039/TB2susMuBjTBKNjSZFwXXcG4XXa_!!1097805039.jpg_300x300.jpg',
            title: '网红零食芒果干',
            rebatePrice: 24.9,
            couponPrice: 5.0,
          ),
          HotItem(
            objUrl:
                'https://img.alicdn.com/bao/uploaded/i2/273162744/O1CN01jd6G541W8nJLZyhRD_!!0-item_pic.jpg_300x300.jpg',
            title: '彼丽空气隐形丝袜液体小泡沫喷雾女喷脖子遮瑕补水定妆买3送防晒',
            rebatePrice: 9.0,
            couponPrice: 20.0,
          ),
        ],
      ),
      Container(
        height: 10.0,
        color: Color(0xffF6F6F6),
      ),
      Container(
        height: 54.0,
        alignment: Alignment.center,
        child: Image.asset('assets/flash_featured_brand.png'),
        color: Color(0xffFFFFFF),
      ),
    ];
  }

  Future _loadData(bool isPullDown) async {
    if (isPullDown) {
      Future.delayed(Duration(milliseconds: 50), () {
        setState(() {
          widgetList = _buildResidentData();
          widgetList.addAll([
            FlashFeaturedBrand(
              flashData: <FlashFeaturedItem>[
                FlashFeaturedItem(
                  id: 0,
                ),
                FlashFeaturedItem(
                  id: 0,
                ),
                FlashFeaturedItem(
                  id: 0,
                ),
                FlashFeaturedItem(
                  id: 0,
                ),
                FlashFeaturedItem(
                  id: 0,
                ),
              ],
            )
          ]);
        });
      });
    } else {
      Future.delayed(Duration(milliseconds: 50), () {
        setState(() {
          widgetList.addAll([
            FlashFeaturedBrand(
              flashData: <FlashFeaturedItem>[
                FlashFeaturedItem(
                  id: 0,
                ),
                FlashFeaturedItem(
                  id: 0,
                ),
                FlashFeaturedItem(
                  id: 0,
                ),
                FlashFeaturedItem(
                  id: 0,
                ),
                FlashFeaturedItem(
                  id: 0,
                ),
              ],
            )
          ]);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /// 全局键值（`GlobalKey`）抽象类，整个应用程序中唯一的密钥。
    /// 当前全局键值（`GlobalKey`）对象用于应用栏（`AppBar`）组件。
    GlobalKey _appBarKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        key: _appBarKey,
        // 背景色（`backgroundColor`）属性，用于应用栏材质的颜色。
        backgroundColor: const Color(0xffFF6362),
        // 图标主题（`iconTheme`）属性，用于应用栏图标的颜色，不透明度和大小。
        iconTheme: IconThemeData(),
        // 亮度（`brightness`）属性，应用栏材质的亮度。
        brightness: Brightness.light,
        // 海拔（`elevation`）属性，将此应用栏相对于其父级放置的z坐标。
        elevation: 0.0,
        // 标题间距（`titleSpacing`）属性，横轴上标题内容周围的间距，即使没有前导内容或操作，也会应用此间距。
        // 如果希望标题（`title`）属性占用所有可用空间，请将此值设置为0.0。
        titleSpacing: 0.0,
        // 应用栏（`AppBar`）中显示的主要组件。
        title: AppBarTitle(),
        // 设置应用栏是否需要显示前置组件，就是系统默认的返回按钮。
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: PullAndPush(
          // 简单的配置头部和底部的样式。
          defaultRefreshBoxTextColor: Color(0xff666666),
          defaultRefreshBoxBackgroundColor: Color(0xffF6F6F6),
          // 可通过此对象的方法调用触发下拉刷新。
          triggerPullController: triggerPullController,
          // 用于上下拉的滑动控件。
          listView: ListView.builder(
            itemCount: widgetList.length,
            controller: controller,
            physics: scrollPhysics,
            itemBuilder: (BuildContext context, int index) {
              return widgetList[index];
            },
          ),
          // 加载数据的回调。
          loadData: (isPullDown) async {
            // `isPullDown`为`true`时表示下拉刷新，为`false`时表示上拉加载。
            await _loadData(isPullDown);
          },
          // 列表视图（`ListView`）组件中的滚动物理（`scrollPhysics`）组件发生改变时回调。
          scrollPhysicsChanged: (ScrollPhysics physics) {
            // 通过`setState()`方法改变列表视图（`ListView`）组件的物理（`Physics`）属性。
            setState(() {
              // 这个不用改，照抄即可。
              scrollPhysics = physics;
            });
          },
        ),
      ),
    );
  }
}
