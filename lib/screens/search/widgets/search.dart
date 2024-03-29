import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_finder_app/screens/search/widgets/search_app_bar.dart';
import 'package:job_finder_app/screens/search/widgets/search_input.dart';
import 'package:job_finder_app/screens/search/widgets/search_list.dart';
import 'package:job_finder_app/screens/search/widgets/search_option.dart';

import '../../../pages/incient_list_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container( ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey.withOpacity(0.1),
               ),
            ),
          ],
        ),Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchAppBar(),
            SearchInput(),
            SearchOption(),
            Expanded(child: IncidentListPage())
          ],
        )
      ],)
    );
  }
}
