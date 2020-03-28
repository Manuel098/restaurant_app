[![INSERT YOUR GRAPHIC HERE](https://api.ed.team/public-files/blogposters/adf20107-e40c-4083-940d-e75ae1d95352.png)]()


# restaurant_app

[![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/badges/badgerbadgerbadger)  [![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org) 

La idea de crear una aplicacion movil para restaurantes surge a partir de la observacion, muchos de los restaurantes usan libretas para anotar sus pedidos y hacen las cuentas a mano, nos dimos cuenta que necesitan urgentemente una ayuda.
La app consiste en modulos para agregar elementos a un inventario, agregar mesas y elegir a que mesa atender para despues generar su factura.

## Desarrolladores ✒️

_Menciona a todos aquellos que ayudaron a levantar el proyecto desde sus inicios_

* **Christian Avila** - *Front-End* - *Documentacion*
* **David Rueda** - *Front-End* - *Documentacion*
* **Manuél Valdéz** - *Front-End* - *Back-End*

## Versiones 📌

- *Version Actual*: 1.5.
- *Flutter*: 1.12.13
- *Laravel*: 5.8

## Comenzando 🚀

Para poder hacer funcionar este proyecto se necesitan dos cosas muy inportantes..
- [Flutter](https://flutter.dev/docs/get-started/test-drive) : Es el SDK que nos permite desarrollar apps nativas para Android y IOS con el lenguaje de Dart.
- [Android Studio](https://developer.android.com/studio) : Es la herramienta de desarrollo oficial para apliaciones Android, con ella podemos hacer uso de los distintos emuladores para probar nuestra app.
- [Laravel](https://laravel.com/) : Es un framework de desarrollo para Back-End utilizando el lenguaje PHP.
- [Nuestra API](https://github.com/Manuel098/restaurante-back) : Esta API es la necesaria para comunicar la logica de la aplicación con el servidor.

> PRO TIP

Actualizar el archivo `pubspec.yaml` para obtener correctamente todas las dependencias del proyecto.

## Codigo 

Es importante recalcar que este codigo está en el lenguaje Dart, el siguiente codigo contiene el metodo principal y que llamará a la interfaz por default, el archivo lo podemos encontrar como `main.dart`.

```dart
import 'package:restauran_app/routes.dart';
import 'package:restauran_app/src/pages/home/index_home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurante App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (setings){
        return MaterialPageRoute(
          builder: (BuildContext context) => Home()
        );
      },
    );
  }
}
```


## Aviso 🎁

* Este repo es publico, si encuentras algún detalle puedes crear un issue con toda confianza 📢.
* Este repo contiene capturas de pantalla del sistema funcionando ⌨️.
* En este repo encontraras el archivo `Documentacion.pdf` para mas especificaciones del sistema 📋.


