import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/app_state_model.dart';

class ProgressTab extends StatelessWidget {
  const ProgressTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return const CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Cupertino Store'),
            )
          ],
        );
      },
    );
  }
}

// class ProgressTab extends StatefulWidget {
//   ProgressTab({Key key}) : super(key: key);

//   @override
//   _ProgressTabState createState() => _ProgressTabState();
// }

// class _ProgressTabState extends State<ProgressTab> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('Progress'),
//     );
//   }
// }
