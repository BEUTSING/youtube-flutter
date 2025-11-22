 
import 'package:cloneyoutube/slidclass.dart';

List<Slidclass> types() {

  //ignore:descripted nember user
  List<Slidclass> parts = new List();
  Slidclass ss = new Slidclass();
  ss.imgurl = 'assets/images.jpeg';
  ss.name1 = "netflix clone with flutter";
  ss.name2 = "for beginners";
  ss.userimg =
      "https://fr.freepik.com/vecteurs-libre/illustration-du-jeune-homme-souriant_356306451.htm#fromView=keyword&page=1&position=1&uuid=a46c43b0-1972-487e-b2da-1b09257a1443&query=Avatar'";
  ss.views = "2M views";
  ss.dur = "2weeks ago";
  ss.tuber = "Nithinraaj";
  parts.add(ss);
  ss = Slidclass();
  return parts;
}
