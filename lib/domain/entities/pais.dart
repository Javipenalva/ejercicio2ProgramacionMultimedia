class Pais {
  late String
  nombre; // Declaramos el nombre , e indicamos que lo inicializaremos después
  String? capital;
  String? poblacion;
  String? imagen; // La url de la imagen es nulable
  String? descripcion;
  double? latitud;
  double? longitud;

  /* 
  Constructor con argumentos por nombre: 
   - nombre es obligatorio, e 
   - imagen opcional.
  */
  Pais({
    required this.nombre,
    this.capital,
    this.poblacion,
    this.imagen,
    this.descripcion,
    this.latitud,
    this.longitud,
  });

  /* 
  Constructor con nombre a partir de un diccionario.
  */
  Pais.fromJSON(Map<String, dynamic> json) {
    nombre = json["nombre"] ?? "";
    capital = json["capital"];
    poblacion = json["poblacion"];
    imagen = json["imagen"];
    descripcion = json["descripcion"];
    latitud = (json["latitud"] as num?)?.toDouble();
    longitud = (json["longitud"] as num?)?.toDouble();
  }

  @override
  String toString() =>
      '''\x1B[34mNombre:\t\x1B[36m$nombre\x1B[0m
  \x1B[34mCapital:\t\x1B[36m$capital\x1B[0m
\x1B[34mPoblación:\t\x1B[36m$poblacion\x1B[0m
\x1B[34mDescripción:\t\x1B[36m$descripcion\x1B[0m
\x1B[34mLatitud:\t\x1B[36m$latitud\x1B[0m
\x1B[34mLongitud:\t\x1B[36m$longitud\x1B[0m
\x1B[34mImagen:\t\x1B[36m$imagen\n\x1B[0m''';
}
