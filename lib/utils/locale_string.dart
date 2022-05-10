import 'package:get/get.dart';

class LocaleString extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'recommended_product':'Recommended Product',
      'testing':'Hello Kante, What fruit salad combo do you want today?',

    },
    //Myanmar LANGUAGE
    'mm_MM':{
      'recommended_product':'သင်ကြိုက်မည့် ပစ္စည်းများ',
      'testing':'ဟယ်လို ဒီနေ့အတွက်ဘာများမှာမလဲ?'
    },
  };

}
