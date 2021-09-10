import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialapp/servisler/yetkilendirmeservisi.dart';
import 'package:socialapp/yonlendirme.dart';


void main() async {

WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp();

runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*Provider widgetini kullanabilmek için pubspec.yaml dosyasında 34.satıra ekledik
    yetkilendirme servisini hem yönlendirme hem de hesapoluştur dosyasında ayrı ayrı tanımlamamak için
    Şimdi yapılacak olan YetkilendirmeServisini kullanacak dosyalara gidip yeni obje oluşturmak yerine paylaşılan objeleri kullanmasını söyleyelim*/
    return Provider<YetkilendirmeServisi>(//<> arasına paylaşılan veri tipi girilir
      create: (_)=> YetkilendirmeServisi(),//Paylaşılmak istenen objeyi belirttik.YetkilendirmeServisinin döndürdüğü değeri alttaki widgetlerle paylaşmak
          child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Projem',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Yonlendirme()//Açılış widgeti olarak Yonlendirme yapma
      ),
    );
  }
}
