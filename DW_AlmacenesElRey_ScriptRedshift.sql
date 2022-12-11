
create table DimProducto(
productoKey INTEGER NOT NULL PRIMARY KEY DISTKEY,
productoId INTEGER NOT NULL,
categoriaKey INTEGER NOT NULL,
nombre VARCHAR(255) NOT NULL,
descripcion VARCHAR(255) NOT NULL,
talla VARCHAR(255) NOT NULL,
color VARCHAR(255) NOT NULL,
sku VARCHAR(64) NOT NULL,
precio DECIMAL(20,6) NOT NULL,
costo DECIMAL(20,6) NOT NULL,
estado VARCHAR(50) NOT NULL,
scd_start VARCHAR(10) NOT NULL,
scd_end VARCHAR(10),
scd_active VARCHAR(7) NOT NULL

FOREIGN KEY (categoriaKey) REFERENCES DimCategoria(categoriaKey)
);



CREATE TABLE dimTiempo (
fechaKey INTEGER NOT NULL PRIMARY KEY DISTKEY,
fechaCompleta VARCHAR (25) NOT NULL,
diaDeSemana INTEGER NOT NULL,
numeroDiaDelMes INTEGER NOT NULL,
numeroDiaDelAnio INTEGER NOT NULL,
nombreDia VARCHAR (25) NOT NULL,
diaLaboralNoLaboral VARCHAR (25) NOT NULL,
numeroSemanaAlAnio INTEGER NOT NULL,
numeroDeSemana INTEGER NOT NULL,
fechaInicioDeLaSemana VARCHAR (25) NOT NULL,
fechaInicioDeLaSemanaKey INTEGER NOT NULL,
mes INTEGER NOT NULL,
numeroMes INTEGER NOT NULL,
nombreMes VARCHAR (25) NOT NULL,
anio INTEGER NOT NULL,
trimestre VARCHAR (25) NOT NULL,
numeroTrimestre INTEGER NOT NULL,
semestre VARCHAR (25) NOT NULL,
numeroSemestre INTEGER NOT NULL)
sortkey (fechaKey, mes);




CREATE TABLE factVentas(
productoKey INTEGER NOT NULL PRIMARY KEY,
cuponKey INTEGER NOT NULL PRIMARY KEY,
promocionKey INTEGER NOT NULL PRIMARY KEY,
fechaKey INTEGER NOT NULL PRIMARY KEY,
numeroOrden INTEGER NOT NULL DISTKEY,
cantidadVendida INTEGER NOT NULL,
precioOriginal DECIMAL(5,2) NOT NULL,
precioVendido DECIMAL(5,2) NOT NULL,
porcentajeImpuesto DECIMAL(5,2) NOT NULL,
cantidadDescuentoxCupon DECIMAL(5,2) NOT NULL,
totalReembolso DECIMAL(5,2) NOT NULL,
cantidadReembolso INTEGER NOT NULL

FOREIGN KEY (productoKey) REFERENCES DimProducto(productoKey),
FOREIGN KEY (cuponKey) REFERENCES DimCupon(cuponKey),
FOREIGN KEY (promocionKey) REFERENCES DimPromocion(promocionKey),
FOREIGN KEY (fechaKey) REFERENCES DimFecha(fechaKey))

sortkey (productoKey,cuponKey,promocionKey,fechaKey);




CREATE TABLE factlessProductoPromocion(
productoKey INTEGER NOT NULL PRIMARY KEY,
promocionKey INTEGER NOT NULL PRIMARY KEY,
fechaKey INTEGER NOT NULL PRIMARY KEY,
promocionContador INTEGER NOT NULL,
precioPromocion DECIMAL(5,2) NOT NULL

FOREIGN KEY (productoKey) REFERENCES DimProducto(productoKey),
FOREIGN KEY (promocionKey) REFERENCES DimPromocion(promocionKey),
FOREIGN KEY (fechaKey) REFERENCES DimFecha(fechaKey))

sortkey (productoKey, promocionKey,fechaKey);