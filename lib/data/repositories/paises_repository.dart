// Define el repositorio de acceso a los datos
// Esta capa es la que se usa desde la aplicación para abstraer
// el acceso a los datos.

import 'package:paisescli/data/services/paises_api.dart';
import 'package:paisescli/domain/entities/continente.dart';
import 'package:paisescli/domain/entities/pais.dart';

class PaisesRepository {
  late final String urlBase;

  // Con late indicamos que este valor
  // se inicializar posteriormente (en el constructor)
  late PaisesApi api;

  PaisesRepository(this.urlBase) {
    api = PaisesApi(urlBase);
  }

  Future<List<Continente>> getContinentes() async {
    // Opción 1: Recorrido clásico de listas y creación de elementos

    // Definimos una lista de continentes en formato JSON (como los devuelve la API)
    List<dynamic> continentesJSON;
    continentesJSON = await api.getContinentes();

    // Definimos una lista de objetos de tipo Continente (como necesita la app)
    List<Continente> lista_continentes =
        []; // aqui debería ser listaContinentes pero el profe lo ha puesto así
    // Recorremos la lista JSON y generamos Continente para cada elemento de esta
    // en la lista de continentes (hacemos uso del método fromJSON para ello)
    for (Map<String, dynamic> continenteJSON in continentesJSON) {
      lista_continentes.add(Continente.fromJSON(continenteJSON));
    }

    return lista_continentes;

    // Opción 2. Hacer uso del mapeado de estructuras
    /*
    La función .map nos devuelve un Iterable, por lo que
    lo hemos de convertir a lista con toList().

    return (await api.getContinentes()).map((continente) {
      return Continente.fromJSON(continente);
      
    }).toList();
    */
  }

  // TO-DO:
  // Implementar el método getPaises
  // Método getPaises(String continente). Obtiene los paises de un continente determinado
  // List<Pais> getPaises(String continente)

  Future<List<Pais>> getPaises(String continente) async {
    List<dynamic> paisesJSON = await api.getPaises(continente);
    List<Pais> listaPaises = [];

    for (Map<String, dynamic> paisJSON in paisesJSON) {
      listaPaises.add(Pais.fromJSON(paisJSON));
    }
    return listaPaises;
  }


  // Implementar el método infoPais
Future<Pais> infoPais(String pais) async {
  dynamic paisJSON = await api.infoPais(pais);

  if (paisJSON == null) {
    return Pais(nombre: pais);
  }

  return Pais.fromJSON(paisJSON);
}
}
