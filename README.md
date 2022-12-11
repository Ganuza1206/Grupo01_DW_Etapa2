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

    
