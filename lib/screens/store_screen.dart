import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'gui_commons.dart';
import 'coin_widget.dart';
import 'skin_widget.dart';

class StoreScreen extends StatefulWidget {
  @override
  State<StoreScreen> createState() => _StoreState();
}

class _StoreState extends State<StoreScreen> {

  void back() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Stack(children: [
            Center(child: pad(Text('StOrE', style: TextStyle(fontSize: 64.0, fontFamily: 'Blox2')), 20.0)),
            Positioned(child: CoinWidget(), top: 20.0, left: 20.0),
            Positioned(child: btn('go back', () => this.back()), top: 20.0, right: 20.0),
          ]),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: pad(
                    LayoutBuilder(builder: (ctx, constraints) {
                      return Stack(
                        children: [
                          Image.asset('assets/images/store/times_2_panel.png', fit: BoxFit.contain, filterQuality: FilterQuality.none),
                          Positioned(
                            child: SizedBox(child: SkinWidget('gold.png'), width: 64.0, height: 64.0),
                            top: constraints.maxHeight / 112 * 70.0 - 64.0 / 2,
                            left: (constraints.maxWidth - 64.0) / 2,
                          ),
                          Positioned(
                            child: GestureDetector(
                              child: Center(child: Text('\$ 1.00', style: TextStyle(fontSize: 20.0, fontFamily: 'Squared Display'))),
                              onTap: () => print('buy x2 man'),
                            ),
                            left: 0,
                            width: constraints.maxWidth,
                            bottom: 0.0,
                          )
                        ],
                        fit: StackFit.expand,
                      );
                    }),
                    32.0),
              ),
              Expanded(child: pad(
                  GestureDetector(
                    child: Image.asset('assets/images/store/skins_panel.png', fit: BoxFit.contain, filterQuality: FilterQuality.none),
                    onTap: () => Navigator.of(context).pushNamed('/skins'),
                  )
                , 32.0)),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          )),
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}