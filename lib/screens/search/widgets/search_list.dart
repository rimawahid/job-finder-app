import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_finder_app/widgets/job_item.dart';
import 'package:job_finder_app/widgets/job_list.dart';

import '../../../model/job.dart';

class SearchList extends StatelessWidget {
  //const SearchList({Key? key}) : super(key: key);
  final jobList = Job.generateJobs();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25,
      ),
      child: ListView.separated(
        padding: EdgeInsets.only(left: 25,right: 25,bottom: 25),
        itemBuilder:(context, index)=> JobItem(
          jobList[index],
          showTime: true,
        ) ,
        separatorBuilder:(_,index)=>SizedBox(height: 20,) ,
        itemCount: jobList.length,
      ),
    );
  }
}
