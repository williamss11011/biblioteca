select formato, local, division, subdivision, departamento, seccion, 
proveedor,i.unidad_manejo
vCB.codigo_item as codItem, vCB.Codigo_Barras as codigoBarras,
 descripcion_bb as descripcion,
origen, case when esborn=1 then 'BORN' when esmio=1 then 'MIORI' 
when esB4B=1 then 'B4Baby' when espeque=1 then 'PEKE' when esGM=1 
then 'GM' end as marcaPropia,
costo_$ as costoUIO, ultimo_costo_fob as FOB, pvp_referencia as pvpRefer,
sa.cantidad as stock
from stock_actual sa
inner join local l on sa.id_local = l.id_local
inner join item i on sa.id_item = i.id_item
inner join vMaxId_ItemEnCS_Barra vCB on sa.id_item = vCB.id_item
inner join Division d on i.id_division = d.id_division
inner join Subdivision sd on i.id_subdivision = sd.id_subdivision
inner join Departamento dpto on i.id_departamento = dpto.id_departamento
inner join Seccion scc on i.id_seccion = scc.id_seccion
inner join proveedor p on i.id_proveedor = p.id_proveedor
where ((((eslocal=1 and localActivo=1) or esbodega =1) and 
sa.cantidad<>0) or esbodega=9) and obsoleto=0 and i.id_division<8
order by local, vCB.Codigo_Item



stock maximo = recupera de inventariosql tabla = stockmaximo, relacion =id item ,idlocal 



ultima venta es con max date   ?? ifmovimi relacion con tabla locales campo FECCAR  /// relaciona con =iditem local  

unidades vendidas son de mes pasado   campo CANTIDAD 

