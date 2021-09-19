import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliverAppBarPage extends StatefulWidget{
  const SliverAppBarPage({Key?key}):super(key:key);
  
  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();

}

class _SliverAppBarPageState extends State<SliverAppBarPage>{
  double _textScale = 1.0;
  bool _isLarge = false;

  void _toggleLargefont(bool isLarge){
    isLarge ? _textScale = 1.2:_textScale = 1.0;
    //描画の更新処理
    setState(() {
      _isLarge = isLarge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: _textScale,
        ),
      child: Scaffold(
        body: CustomScrollView(slivers: [
          // 「SliverAppBar」はスクロールに応じてヘッダー要素を隠すことができる
          SliverAppBar(
            backgroundColor: Colors.blueAccent.withOpacity(0.3),
            floating: true, // floatingがtrueの時は、リストの最初に戻らなくても上にスクロールするとヘッダーが表示
            pinned: true, // pinnedがtrueの時は、ヘッダーを完全に隠すのではなく、タイトルの1行分を残した状態で表示
            snap: false, // snapがtrueの時は、ヘッダーがスクロールにより中途半端に表示されなくなり、一気に最大表示
            expandedHeight: 180, // 表示するヘッダーの高さ
            toolbarHeight: 60, // ツールバーコンポーネントの高さ
            flexibleSpace: FlexibleSpaceBar( //ヘッダのコンテンツとして入れたいウィジェットを設定する
              title: Text(
                '記事カテゴリー',
              ),
              background: Stack( //複数Widgetを重ねて表示
                children: <Widget>[ //子要素
                  SizedBox( // 固定サイズのボックスを作成
                    width: double.infinity,
                    child: Image.network(
                      'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0),
                          Colors.black38,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        SliverList( // 多数のアイテムをスクロールする
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,right: 20.0,bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 8,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('文字を大きく'),
                                Switch(
                                    value: _isLarge,
                                    onChanged: _toggleLargefont,
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                  'sept. 29 2020',
                                  style: GoogleFonts.lato(),
                                ),
                            ),
                              IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: (){},
                              ),
                            ],
                          ),
                          Text(
                            '記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル',
                          ),
                          Divider(
                            height: 30,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: const NetworkImage(
                                    'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                                radius: 26,
                                backgroundColor: Colors.grey[200],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '山田　太郎'
                                  ),
                                  Text(
                                    'ITジャーナリスト'
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: SizedBox(),
                              ),
                              Icon(
                                Icons.favorite_border,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '350',
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Icon(
                                Icons.comment,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '25',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '私は場合おもにその周旋めという事の所を受けですな。もし今日を通用違いはとにかく同じ意見たたほどをさて行くでしょをは懊悩おっしゃれませつで、実際とはできるでななくっです。釣に申し上げたら事はすでに前をちょうどないたた。同時に岡田さんが吟味落語それだけ批評にしでしょ秩序漠然たる一団私か発展にという皆経過たないなたから、このほかは私か人飯にして、大森君の事に主義の私の無論ご汚辱として私手がご誘惑でしようにぼんやりお学問で述べべきでて、毫もさぞ満足としたているたので出ないた。もしくはまたはお主義の向いのはこう馬鹿としたて、その賞には見えですでという辞令にいうておきました。こんな日言葉の日その国家も私ごろをさましかと三宅さんに知れでます、expectsの当時ですというご講演ますうならが、人間の以上が陰に場合までの個人を十月聴こけれどもいるて、それほどの今に描いからこうした中をどうもしましなと行かましのないと、ないたたて全くご個人できるだ訳たなけれた。つまり通りか無事か尊重が流れるなつつ、今ごろ力をしばいるない上を肝不足の場合で見たなけれ。時間でももちろんいうがつけよたますないなけれて、どうも勢い作るば話はまだなかっですものた。しかもご学習が食っからもいならはずんて、下働きでは、さぞこれか愛するからあっせよですた知れせないですと下げて、支はもつからしまいたくっます。いよいよしかるにさえ同時にウォーズウォースというくれますて、そこをも生涯上かも私のお病気はないししまうんまし。私もそのうち発展の事がご記憶はしていでたくますありと、五一の自我にこう重んずるましという諷刺たて、しかしその人の自力をしがらて、だれかを私の名に養成にしていうのたなと反抗云いて批評充たす来ますあっ。教師にそこで大森さんにあるいは一応あるたものなかっでない。岡田さんははっきりろを申し上げて知れでものならずです。（また人で倒さためですなけれたてなかっはいうだなて、）それほど立てるでモーニングに、ジクソンの相場でもするて投げといった、自我の変化も昔の中でもし生きのにありでが説明院しけれどもいれずについてご評語たものなけれ。',
                            style: GoogleFonts.sawarabiGothic(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}