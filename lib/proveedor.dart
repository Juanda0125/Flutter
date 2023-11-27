class Proveedor{
  int? ID;
  String? nombre;
  String? direccion;
  String? telefono;

  Proveedor({
    this.ID,
    this.nombre,
    this.direccion,
    this.telefono,
  });

  Proveedor.fromJson(Map<String, dynamic> json){
    ID=json["ID"];
    nombre=json["nombre"];
    direccion=json["direccion"];
    telefono=json["telefono"];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data= <String, dynamic>{};
    data['ID']=ID;
    data['nombre']=nombre;
    data['direccion']=direccion;
    data['telefono']=telefono;
    return data;
  }


}