# Grupo01_DW_Etapa2

Integrantes del grupo:

| Carnet | Nombre |
| --- | --- |
| BR14005 | Esperanza Arelí Bonilla Ramos  |
| GR14004 | Gloria María Ganuza Ramírez |
| MG14006 | Lilian Patricia Martínez Galdámez |

## Diseño del Datawarehouse

### Proceso de ventas
![Image text](https://github.com/Ganuza1206/Grupo01_DW_Etapa2/blob/main/imagenes/DW_Ventas_AlmacenesElRey.png)
![Image text](https://github.com/Ganuza1206/Grupo01_DW_Etapa2/blob/main/imagenes/DW_Ventas_AlmacenesElRey_FactlessTable.png)

### Proceso de inventario
![Image text](https://github.com/Ganuza1206/Grupo01_DW_Etapa2/blob/main/imagenes/DW_Inventario_AlmacenesElRey.png)

## Configuración de las tablas dimensión

Tabla : DimCategoria

| Atributo | Tipo SCD |
| --- | --- |
| categoriaKey |  |
| categoriaID | 0 |
| nombre | 1 |
| tipoProducto | 1 |
| departamento | 1 |
| estado | 1 |

Tabla : DimProducto

| Atributo | Tipo SCD |
| --- | --- |
| productoKey |  |
| productoID | 0 |
| categoriaKey | 1 |
| nombre | 1 |
| descripcion | 1 |
| talla | 1 |
| color |  |
| material | 0 |
| clima | 1 |
| sku | 1 |
| precio | 1 |
| costo | 2 |  
| clasificacion | 1 |
| estado | 1 |
| fechaColumnaEfectiva | 2 |
| fechaColumnaExpiracion | 2 |
| estadoColumna | 2 |

Tabla : DimPromocion

| Atributo | Tipo SCD |
| --- | --- |
| promocionKey |  |
| promocionID | 0 |
| nombre | 1 |
| descripcion | 1 |
| fechaInicio | 1 |
| fechaFin | 1 |
| estaActiva | 1 |

Tabla : DimCupon

| Atributo | Tipo SCD |
| --- | --- |
| cuponKey |  |
| cuponID | 0 |
| nombre | 1 |
| descripcion | 1 |
| codigo | 1 |
| cantidadCupones | 1 |
| cantidadUsados | 1 |
| fechaInicio | 1 |
| fechaFin | 1 |
| estado | 1 |

Tabla : DimTiempo

| Atributo | Tipo SCD |
| --- | --- |
| fechaKey | 0 |
| fecha | 0 |
| fechaCompleta | 0 |
| diaDeSemana | 0 |
| numeroDiaDelMes | 0 |
| numeroDiaDelAnio | 0 |
| nombreDia | 0 |
| diaLaboralNoLaboral | 0 |
| numeroSemanaAlAnio | 0 |
| numeroDeSemana | 0 |
| fechaInicioDeLaSemanaKey | 0 |
| fechaInicioDeLaSemana | 0 |
| mes | 0 |
| numeroDelMes | 0 |
| nombreMes | 0 |
| anio | 0 |
| trimestre | 0 |
| numeroTrimestre | 0 |
| semestre | 0 |
| numeroSemestre | 0 |

Tabla : DimFuenteInventario

| Atributo | Tipo SCD |
| --- | --- |
| fuenteInventarioKey |  |
| fuenteInventarioID | 0 |
| nombre | 1 |
| descripcion | 1 |
| pais | 1 |
| ciudad | 1 |

Tabla : DimProductoFactlessFuenteInventario

| Atributo | Tipo SCD |
| --- | --- |
| fuenteInventarioKey |  |
| productoKey | 0 |
| cantidadPorFuente | 1 |
| estado | 1 |

## Configuraciones del proyecto

Para crear las Dimensiones se debe crear una base de datos temporal en Microsoft Sql Server, con el nombre: AlmacenesElRey_Temporal
y ejecutar el siguiente script:

``` sql
create table DimCategoria(
categoriaKey int not null primary key, --Llave surrogada
categoriaId int not null,  --Llave de negocio
nombre varchar(255),
tipoProducto varchar(255),
departamento varchar(255),
estado varchar(50))

create table DimCupon(
cuponKey int not null primary key, --Llave surrogada
cuponID int not null, --Llave de negocio
nombre varchar(255),
descripcion text,
codigo varchar(255),
cantidadCupones int,
cantidadUsados int,
fechaInicio date,
fechaFin date,
estado varchar(50))

create table DimFuenteInventario(
fuenteInventarioKey int not null primary key, --Llave surrogada
fuenteInventarioID varchar(255) not null, --Llave de negocio
nombre varchar(255),
descripcion varchar(255),
pais varchar(255),
ciudad varchar(255))

create table DimPromocion(
promocionKey int not null primary key, --Llave surrogada
promocionID int not null, --Llave de negocio
nombre varchar(255),
descripcion text,
fechaInicio date,
fechaFin date,
cantidadDescuento float(10),
estaActiva varchar(50))

create table DimProducto(
productoKey int not null primary key, --Llave surrogada
productoId int not null, --Llave de negocio
categoriaKey int not null,
nombre varchar(255),
descripcion varchar(255),
talla varchar(255),
color varchar(255),
sku varchar(64),
precio decimal(20,6),
costo decimal(20,6),
estado varchar(50),
scd_start date,
scd_end date,
scd_active bit)
```

## Componentes utilizados en AWS

### * AMAZON S3.
  Nombre del Bucket: almaceneselrey2022 
  Region de AWS: EE.UU.Este (Norte de Virginia) us-east-1
  Propiedades de los Objetos: ACL deshabiltiadas.
  Estructura de Capetas:

### * AMAZON REDSHIFT.
  Identificador del clúster: redshift-cluster-proyecto
  Tipo de nodo: dc2.large
  Cómputo: 2 CPU virtuales
  Número de nodos: 1
  Nombre de la base de datos: dev
  Puerto: 5439
  Nombre de usuario del administrador: proyectoues
  Contraseña de usuario administrador: Proyectoues2022
  Zona de disponibilidad: us-east-1e

### *Identity and Access Management (IAM)
 Usuarios creados:
- Nombre de usuario: admingg
   Descripción: Administrador general de AWS
   Contraseña: admingg
   Enlace de sesión de la consola: https://717949482576.signin.aws.amazon.com/console
   Politica: AdministratorAccess
 - Nombre de usuario: usuarioS3Lectura
   Descripción: usuario solo de lectura para Amazon S3
   Contraseña: c@ntraseña
   Enlace de sesión de la consola: https://717949482576.signin.aws.amazon.com/console
   Politica: AmazonS3ReadOnlyAccess
 - Nombre de usuario: proyecto
   Descripción: usuario administrador de Amazon S3
   Contraseña: Proyecto22
   Enlace de sesión de la consola: https://717949482576.signin.aws.amazon.com/console
   Politica: AmazonS3FullAccess  

### Estructura de carpetas utilizada en AWS

![Image text](https://github.com/Ganuza1206/Grupo01_DW_Etapa2/blob/main/imagenes/S3_EstructuraCarpetas.png)
