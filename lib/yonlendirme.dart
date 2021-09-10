/*Kullanıcının hangi sayfaya yönlendireceğini belirttiğimiz widget*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialapp/modeller/kullanici.dart';
import 'package:socialapp/sayfalar/anasayfa.dart';
import 'package:socialapp/sayfalar/girissayfasi.dart';
import 'package:socialapp/servisler/yetkilendirmeservisi.dart';

class Yonlendirme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _yetkilendirmeServisi = Provider.of<YetkilendirmeServisi>(context,
        listen:
            false); //main.dart dsyasındaki provider de paylaşılan objeyi kullanmak
    return StreamBuilder(
        stream: _yetkilendirmeServisi
            .durumTakipcisi, //YetkilendirmeServisi'nin durumTakipcisi methodundan gelecek yayını takip etsin
        builder: (context, snapshot) {
          /*Bağlantı kurulana kadar yükleniyor animasyonu gösterme*/
          if (snapshot.connectionState == ConnectionState.waiting) {
            //Bağlantı bekleme durumundaysa
            return Scaffold(
                body: Center(
                    child:
                        CircularProgressIndicator())); //yükleme animasyonu göster
          }
          /*Eğer kullanıcının hesabı açıksa  direk anasayfaya eğer açık değilse değilse  yapma ekranına yönlendirme  */
          if (snapshot.hasData) {
            //Güvenlik merkezinin yaptığı yayında kullanıcı objesi varsa kullanıcıyı anasayfaya yönlendirme blablabla
            // ignore: unused_local_variable
            Kullanici aktifKullanici = snapshot.data;
            _yetkilendirmeServisi.aktifKullaniciId=aktifKullanici.id;
            return AnaSayfa();
          } else {
            //kullanıcının hesabı açık değilse
            return GirisSayfasi();
          }
        });
  }
}
