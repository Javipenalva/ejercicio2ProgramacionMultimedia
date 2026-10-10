import 'dart:convert'; // Para utf8 i jsondecode
import 'dart:io'; // Para HttpStatus
import 'package:http/http.dart'
    as http; // Importamos la librería  http con alias

/*

  Clase de Servicio para acceder a la API REST

*/

class PaisesApi {
  String urlBase;

  // Constructor
  PaisesApi(this.urlBase);

  // Método para obtener los continentes
  Future<List<dynamic>> getContinentes() async {
    String url = "$urlBase/continentes";

    try {
      // Devuelve la lista de continentes de forma genérica, a partir de la URL
      http.Response data = await http.get(Uri.parse(url));

      if (data.statusCode == 404) {
        print("\n\x1B[31mError 404: No se encuentra el recurso $url");
      } else if (data.statusCode == 500) {
        print("n\x1B[31mError 500: Error del servidor");
      } else if (data.statusCode == HttpStatus.ok) {
        // También podemos utilizar el código 200
        String body = utf8.decode(data.bodyBytes);
        final bodyJSON = jsonDecode(body);
        return bodyJSON as List; // Devolvemos simplemente los registros como una lista
      } else {
        // Se produce algún otro error
        print(
          "n\x1B[31mEl servidor ha respondido, pero se ha producido un código de error ${data.statusCode}",
        );
      }
      return [];
    } on SocketException {
      // Excepción SocketException
      print(
        "\n\x1B[31mNo se pude conectar con el servidor $url. Comprueba el estado de la red, los DNS o la connexión al servidor a través de un navegador",
      );
      return [];
    } on FormatException {
      // Excepción decodificando la respuesta
      print("El formato esperado es incorrecto (Excepción FormatException)");
      return [];
    } catch (e) {
      // Error genérico
      print("Se ha producido el error: $e");
      return [];
    }
  }

  Future<List<dynamic>> getPaises(String continente) async {
    // TO-DO
    return []; // a modificar
  }

  Future<dynamic> infoPais(String pais) async {
    // TO-DO
    return null; // a modificar
  }

}
