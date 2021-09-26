import 'package:flutter/material.dart';

class ResponsiveDesignPage extends StatelessWidget {
  const ResponsiveDesignPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: Text('様々なデバイスに対応する'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget{
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MediaQueryによって、端末の表示部分の横幅と高さを取得
    final width = MediaQuery.of(context).size.width; //横幅
    final height = MediaQuery.of(context).size.height; //高さ
    final isPortrait = height > width; // 横向きかの判定
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          // ConstrainedBoxを利用し、横幅の最大値をバランスよく表示できそうな数値を指定します
          // 一般的にボタンの幅であれば最大650あたりで設定しておけば、
          // 大画面で表示されても自然な見た目と機能性を保つことできます。
          maxWidth: 650,
        ),
        child: Column(
          children: <Widget>[
            // スペーサでウィジェット間の間隔を動的に調整
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Flutter is Google's UI toolkit for building beautiful, natively compiled",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15 * (height + width) / (926 + 438),
                  height: 1.85,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // スペーサでウィジェット間の間隔を動的に調整
            const Spacer(),
            // 横向きの場合は、Flutterログを非表示にする
            if (isPortrait)
              FlutterLogo(
                size: height * 0.3,
              ),
            if (isPortrait) const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Fast Development Paint your app to life in milliseconds with Stateful Hot Reload. Use a rich set of ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15 * (height + width) / (926 + 438),
                  height: 1.85,
                ),
              ),
            ),

            // スペーサでウィジェット間の間隔を動的に調整
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    primary: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(
                      'get started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15 * (height + width) / (926 + 438),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}