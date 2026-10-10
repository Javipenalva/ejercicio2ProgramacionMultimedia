
class Pais {

  late String nombre; // Declaramos el nombre , e indicamos que lo inicializaremos después
  late String capital;
  late int poblacion;
  String? imagen; // La url de la imagen es nulable
  late String descripcion;
  late double latitud;
  late double  longitud;
  late String continente; 

  /* 
  Constructor con argumentos por nombre: 
   - nombre es obligatorio, e 
   - imagen opcional.
  */
  Pais({
    required this.nombre,
    required this.capital,
    required this.poblacion,
    required this.descripcion,
    required this.latitud,
    required this.longitud,
    required this.continente, 
    this.imagen,
  });

  /* 
  Constructor con nombre a partir de un diccionario.
  */
  Pais.fromJSON(Map<String, dynamic> json) {
    nombre = json["nombre"] ?? "";
    capital = json["capital"] ?? "";
    poblacion = json["poblacion"] ?? 0;
    imagen= json["imagen"] ?? "";
    descripcion= json["descripcion"] ?? "";
    latitud = json["latitud"] ?? 0.0;
    longitud = json["longitud"] ?? 0.0;
    continente = json["continente"] ?? "";
    
  }

  @override
  String toString() => '''\x1B[34mNombre:\t\x1B[36m$nombre\x1B[0m
  \x1B[34mCapital:\t\x1B[36m$capital\x1B[0m
\x1B[34mPoblación:\t\x1B[36m$poblacion\x1B[0m
\x1B[34mDescripción:\t\x1B[36m$descripcion\x1B[0m
\x1B[34mLatitud:\t\x1B[36m$latitud\x1B[0m
\x1B[34mLongitud:\t\x1B[36m$longitud\x1B[0m
\x1B[34mContinente:\t\x1B[36m$continente\x1B[0
\x1B[34mImagen:\t\x1B[36m$imagen\n\x1B[0m''';
}

