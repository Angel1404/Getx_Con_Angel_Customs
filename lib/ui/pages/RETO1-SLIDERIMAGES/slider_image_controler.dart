import 'package:get/get.dart';

class SliderImageController extends GetxController {
  static SliderImageController get to => Get.find<SliderImageController>();

  final List<String> images = [
    'https://th.bing.com/th/id/R.bb215290a19e0ec8e2b1bd1ca421d079?rik=3keUgffyX1%2bNVg&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.314da879ab58e7c1f5af5ef7a5c6e530?rik=ug44vAR4Rv5Beg&riu=http%3a%2f%2fhowzyerteeth.beacondeacon.com%2fBatman%2f48%2f8497919385_f4eb6270f3_c.jpg&ehk=icwVFfUIbC5XHRjVlhrdW3BHkiTMNRaVK%2f03bxOcHmY%3d&risl=&pid=ImgRaw&r=0',
    'https://rlv.zcache.ca/batman_cross_arms_poster-r04475df4d382421196e270ccc60e935b_wvk_8byvr_324.jpg',
    'https://i.pinimg.com/originals/8a/b0/b3/8ab0b34f9502f79442f0875497d85658.jpg',
    'https://th.bing.com/th/id/R.92fea2bda39edcd51cc79abf905372fc?rik=UTzWWy15SlWxnA&riu=http%3a%2f%2fi2.sinaimg.cn%2fqc%2fphoto_auto%2fphoto%2f41%2f89%2f17734189%2f17734189_340.jpg&ehk=VtewbOGTyDuir024k%2fPfsIhuFnppD2ZCViItrnmLHKI%3d&risl=&pid=ImgRaw&r=0',
  ];

  final urlSelect = 'https://th.bing.com/th/id/R.bb215290a19e0ec8e2b1bd1ca421d079?rik=3keUgffyX1%2bNVg&pid=ImgRaw&r=0'.obs;
}
