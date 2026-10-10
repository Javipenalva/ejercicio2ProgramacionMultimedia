import 'dart:io';

import 'package:paisescli/data/repositories/paises_repository.dart';
import 'package:paisescli/domain/entities/continente.dart';

void main(List<String> argumentos) {

  // Comprobamos el número de argumentos
  if (argumentos.isEmpty) {
    print("\x1B[31m Número de argumentos incorrectos\x1B[0m");
    exit(-1);
  }

  // Parseamos la lista de argumentos
  List<String> listaArgs = List.from(argumentos);
  String? orden;
  String? args;

  // Separamos la orden (continentes, paises, infopais) de la lista de argumentos
  orden = listaArgs[0];
  listaArgs.removeAt(0);
  args = listaArgs.join(" ");

  PaisesRepository repo = PaisesRepository("https://api-paises-uagm.onrender.com");

  switch (orden) {
    case "continentes":
      muestraContinentes(repo);        // Implementación con Future
      // muestraContinentesSync(); // Implementación con async/await
      break;

    case "paises":
      if (argumentos.length != 2) {
        print(
            "\x1B[31m Número de argumentos incorrecto. Hay que especificar el continente.\x1B[0m");
        exit(-1);
      }
      muestraPaises(repo, args);
      break;

    case "infopais":
      if (argumentos.length < 2) {
        print(
            "\x1B[31m Número de argumentos incorrecto. Hay que especificar el país.\x1B[0m");
        exit(-1);
      }
      muestraInfoPais(repo, args);
      break;
    default:
      print("\x1B[31mOrden desconocida\x1B[0m");
  }
}

// Implementación de muestraContinentes utilizando Future

void muestraContinentes(PaisesRepository repo) {
  // La lista de continentes vendrá en un Future
  Future<List<Continente>> respuestaFuture = repo.getContinentes();

  // Preparamos el callback
  respuestaFuture.then((respuesta) {
    if (respuesta.isNotEmpty) {
      // Recorremos la lista para mostrar los resultados
      for (var continente in respuesta) {
        print(continente.toString());
      }
    } else {
      print("\x1B[31mNo se ha obtenido respuesta\x1B[0m");
    }
  });
}

// Implementación de muestraContinentes con async/await

void muestraContinentesSync(PaisesRepository repo) async {
  // La lista de continentes se obtiene directamente
  List<Continente> continentes = await repo.getContinentes();

  if (continentes.isNotEmpty) {
    for (var continente in continentes) {
      print(continente.toString());
    }
  } else {
    print("\x1B[31mNo se ha obtenido respuesta\x1B[0m");
  }
}

void muestraPaises(PaisesRepository repo, String continente) {
  // TO-DO

  // Obtener la lista de paises de un continente
  // y mostrarla por pantalla
  
  print("\x1B[35m Función pendiente de implementación \x1B[0m");

}

void muestraInfoPais(PaisesRepository repo, String pais) {
  // TO-DO

  print("\x1B[35m Función pendiente de implementación \x1B[0m");
}



