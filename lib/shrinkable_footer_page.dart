import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShrinkableFooterPage extends StatefulWidget{
  const ShrinkableFooterPage({Key?key}):super (key:key);

  @override
  _ShrinkableFooterPageState createState() => _ShrinkableFooterPageState();

}

class _ShrinkableFooterPageState extends State<ShrinkableFooterPage> {
  final _scrollController = ScrollController(); // スクロール中のコントローラーを設定
  bool isHiding = false; // フッターが離れているかどうかのboolを設定


  @override
  void initState() {
    super.initState();
    // ウィジェット作成時に呼び出す
    _listenScroll();
  }

  @override
  void dispose() {
    // ウィジェット修了時にスクロール検知を解除
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void _listenScroll() {
    _scrollController.addListener(() {
      //画面下部に向かってスクロールをした場合
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        isHiding = false;
      } else {
        isHiding = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Stack( //Stackによりbody内で重ねて表示する
            children: [
              ListView(
                controller: _scrollController,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 16.0,right: 50),
                    height: 200,
                    width: double.infinity, //可能な限り自身のWidgetのサイズを大きくする
                    decoration: BoxDecoration( //境界線
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0)),
                      color: Color(0xFFFEEAE6),
                    ),
                    child: Column(
                      // Columnなら左寄せ（厳密にはTextDirectionによって開始位置が決まる）
                      // Rowなら上寄せになる(厳密にはVerticalDirectionによって開始位置が決まる)
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(height: 70),
                        Text(
                          'スクロールに応じて\nBottomNavigationBarが\n縮みます。',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Color(0xFF442C2E),
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Image.network(
                      'https://images.unsplash.com/photo-1528164344705-47542687000d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1369&q=80'),
                  const SizedBox(height: 20.0),
                  Image.network(
                      'https://images.unsplash.com/photo-1532236204992-f5e85c024202?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1372&q=80'),
                  const SizedBox(height: 20.0),
                  Image.network(
                      'https://images.unsplash.com/photo-1493479874819-4303c36fa0f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'),
                  const SizedBox(height: 20.0),
                  Image.network(
                      'https://images.unsplash.com/photo-1463319611694-4bf9eb5a6e72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'),
                  const SizedBox(height: 20.0),
                  Image.network(
                      'https://images.unsplash.com/photo-1469998265221-245c7148df5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'),
                  const SizedBox(height: 20.0),
                ],
              ),
              Positioned( // 位置を下部に設定する
                bottom: 0,
                child: _BottomNavigationBar(
                  isHiding: isHiding,
                ),
              ),
            ],
          )
        ),
      );
  }
}

class _BottomNavigationBar  extends StatelessWidget {
  _BottomNavigationBar({required this.isHiding});
  final bool isHiding;

  @override
  Widget build(BuildContext context) {
    // 画面の幅を取得
    final width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      height: isHiding ? 32:60, // 三項演算子で isHiding = true の場合32、falseの場合は60
      color: Color(0xFFFEEAE6),
      duration: Duration(milliseconds: 200), // アニメーションの期間をミリ秒で指定
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 16),
        child: Row(
          // 子レイアウトを縦方向に空きスペースを均等に置く
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 項目感覚を主軸方向に空ける
          children: [
            _IconTextItem(
              isHiding: isHiding,
              deviceWidth: width,
              icon: Icons.home,
              title: 'Home',
            ),
            _IconTextItem(
              isHiding: isHiding,
              deviceWidth: width,
              icon: Icons.star,
              title: 'Favorite',
            ),
            _IconTextItem(
              isHiding: isHiding,
              deviceWidth: width,
              icon: Icons.favorite,
              title: 'Like',
            ),
            _IconTextItem(
              isHiding: isHiding,
              deviceWidth: width,
              icon: Icons.settings,
              title: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}

class _IconTextItem extends StatelessWidget{
  final double deviceWidth;
  final bool isHiding;
  final IconData icon;
  final String title;

  const _IconTextItem({
    Key?key,
    required this.isHiding,
    required this.deviceWidth,
    required this.icon,
    required this.title,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 0.25 * (deviceWidth - 32),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child:
              Icon(
                icon,
                color: Color(0xFF442C2E),
                size: 24,
              ),
          ),
          AnimatedOpacity( //アニメーション
            opacity: isHiding ? 0 : 1,
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeInQuart,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
