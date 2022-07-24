import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_finder_app/widgets/icon_text.dart';

import '../model/job.dart';
import '../pages/add_incidents_page.dart';

class JobDetail extends StatelessWidget {
  //const JobDetail({Key? key}) : super(key: key);
  final Job job;
  JobDetail(this.job);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30))
      ),
      height: 520,
      child: SingleChildScrollView(
        child: Column(
        
          children: [
            Container(
              height: 5,
              width: 60,
              color: Colors.grey.withOpacity(0.3),
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: Image.asset(job.logoUrl),
                    ),
                    SizedBox(width: 10,),
                    Text(job.company,style: TextStyle(
                      fontSize: 16,
                    ),),
                  ],
                ),Row(
                  children: [
                    Icon(job.isMark?Icons.bookmark:Icons.bookmark_outline_rounded,
                    color: job.isMark? Theme.of(context).primaryColor:Colors.black,),
                    Icon(Icons.more_horiz_outlined),
                  ],)
              ],
            ),SizedBox(height: 15,),
            Text(job.title,
            style: TextStyle(
              fontSize:26,
              fontWeight: FontWeight.bold,),),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(Icons.location_on_outlined, job.location),
                IconText(Icons.access_time_outlined, job.time)
              ],
            ),
            SizedBox(height: 20,),
            Text('Requirement',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20),
              ),
              SizedBox(height: 10,),
              ...job.req.map((e) => Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10,),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 280,),
                        child: Text(e,
                        style: TextStyle(
                          wordSpacing: 2.5,
                          height: 1.5
                        ),),)
                  ],
                ),
              )).toList(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                height: 45,
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                  
                  onPressed: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                            //_editIncident(
                            //   context, "${snapshot.data[index].id}");

                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddIncidentsPage(
                                
                              ),
                            ));
                  }, 
                  child: Text('Apply Now'),),
              ),
          
              ],
            )
            ],
        )),
    );
  }
}
