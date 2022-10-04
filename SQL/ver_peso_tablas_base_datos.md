
# PostgreSQL
<img width="90%" src="https://i.imgur.com/ujXc7AY.png" alt="My cool logo"/>

Consultar tamaños de bases de datos y tablas en PostgreSQL.
Comenzamos con PostgreSQL, mi gestor de bases de datos gratuito favorito. Si deseas consultar el tamaño de las bases de datos con este gestor debes utilizar la siguiente consulta:

```sql
SELECT pg_database.datname AS Nombre, pg_size_pretty(pg_database_size(pg_database.datname)) AS Tamaño
FROM pg_database;
```
<img   src="https://i.imgur.com/4xhY7VD.png" alt="My cool logo"/>

El resultado será el nombre de cada una de las bases de datos con su respectivo espacio en disco expresado en kB, como se muestra en la siguiente imagen.

Resultado de consulta de tamaño de bases de datos en PostgreSQL.
Si detectamos una tabla ocupando más espacio del previsto y queremos revisar a fondo, podemos utilizar la siguiente consulta:

```sql
SELECT schemaname AS table_schema,
relname AS table_name,
pg_size_pretty (pg_total_relation_size(relid)) AS total_size,
pg_size_pretty (pg_relation_size(relid)) AS data_size,
pg_size_pretty (pg_total_relation_size(relid) - pg_relation_size(relid))
AS external_size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC,
pg_relation_size(relid) DESC
LIMIT 10;
```
Como resultado se mostrarán las tablas de la base de datos seleccionada con el espacio total que consumen, ordenadas descendientemente como se muestra en la siguiente imagen.

Resultado de consulta de tamaño de tablas en PostgreSQL.

<img src="https://i.imgur.com/6mv4RFF.png" alt="My cool logo"/>

# MySQL
Consultar tamaños de bases de datos y tablas en MySQL.
En MySQL puedes consultar el tamaño de las bases de datos con el siguiente comando:

```sql
SELECT table_schema "DATABASE",
CONVERT(SUM(data_length + index_length)/1048576, DECIMAL(6,2)) "SIZE (MB)" FROM information_schema.tables WHERE table_schema != "information_schema" GROUP BY table_schema;
```
De este modo obtenemos un resultado similar a la alternativa que utilizamos en PostgreSQL, como podrás verificar en la siguiente imagen.

<img src="https://i.imgur.com/Or6DQ0m.png" alt="My cool logo"/>



Resultado de consulta de tamaño de bases de datos en MySQL.
Y para ver cuánto consume cada tabla:

```sql
SELECT table_name Tabla,(data_length + index_length)/(1024 * 1024) Tamaño FROM information_schema.tables WHERE table_schema = 'midb';
```

Donde debes sustituir midb por la base de datos que deseas analizar. Debes obtener un resultado similar al que se muestra a continuación:

Resultado de consulta de tamaño de tablas en MySQL.

<img src="https://i.imgur.com/22vR5Gm.png" alt="My cool logo"/>


# SQLServer
<img src="https://i.imgur.com/4UlDOAZ.png" alt="My cool logo"/>


Consultar tamaños de bases de datos y tablas en SQLServer.
En el caso de SQLServer podemos utilizar la siguiente consulta para obtener el tamaño de las bases de datos:

```sql
SELECT sys.databases.name AS [Base de Datos],
CONVERT (VARCHAR, SUM(size) * 8/1024) +' MB' AS [Tamaño en disco]
FROM sys.databases JOIN sys.master_files
ON sys.databases.database_id = sys.master_files.database_id
GROUP BY sys.databases.name
ORDER BY sys.databases.name
```


Obteniendo como resultado una tabla similar a la que se muestra a continuación:

Resultado de consulta de tamaño de bases de datos en SQLServer
Y esta consulta para obtener el tamaño de cada tabla dentro de una base de datos.

```sql
SELECT t.NAME AS Tabla, s.Name AS Esquema, p.rows AS NumeroDeFilas, CAST(ROUND(((SUM(a.total_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS TotalEspacio_MB,
CAST(ROUND(((SUM(a.used_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS EspacioUtilizado_MB,
CAST(ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS EspacioNoUtilizado_MB
FROM sys.tables t INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN sys.schemas s ON t.schema_id = s.schema_id
GROUP BY t.Name, s.Name, p.Rows
ORDERBY TotalEspacio_MB desc
```

Como resultado:

<img src="https://i.imgur.com/LxZFxyH.png" alt="My cool logo"/>


### Tamaño de las bases de datos usando Microsoft SQL Management Studio
Si utilizas Microsoft SQL Management Studio, la herramienta oficial para gestionar bases de datos de SQL Server, entonces el proceso puede ser más sencillo e ilustrativo. Solamente debes hacer clic derecho encima de la base de datos que deseas y seleccionar Reportes, para luego hacer clic en Reportes Estándar y Uso de Disco. El resultado muestra un reporte como este:

<img src="https://i.imgur.com/2QvQARn.png" alt="My cool logo"/>

Para separar el tamaño por cada tabla, hacemos clic en Uso de Discos por Tablas, y tendremos como resultado una tabla con la cantidad de registros, espacio reservado, datos, índices y espacio sin usar. Puedes ver un ejemplo en la siguiente imagen.

<img src="https://i.imgur.com/tMxQsZ1.png" alt="My cool logo"/>

### Tamaño de las bases de datos usando procedimiento almacenado
Otra posibilidad es utilizar el procedimiento almacenado `sp_spaceused` que proporciona SQL Server. Podemos ejecutarlo en una consulta en una base de datos o seguido por el nombre de una tabla y obtendremos como resultado algo similar a:

sqlserver5 Cómo consultar el tamaño de las bases de datos y tablas

<img src="https://i.imgur.com/4aSLLv6.png" alt="My cool logo"/> 

# MongoDB
<img src="https://i.imgur.com/PEHh0WM.png" alt="My cool logo"/>


Consultar tamaños de bases de datos y tablas en MongoDB.
Por último, les muestro el proceso con mongoDB, retrasado hasta este momento a propósito, por la sencillez del procedimiento con este gestor utilizando sus comandos.

Para listar las bases de datos con su tamaño basta con invocar el comando:

```javascript
show dbs
```
<img src="https://i.imgur.com/FYM461D.png" alt="My cool logo"/>

Para obtener un como resultado:

Resultado de consulta de tamaño de bases de datos en MongoDB.
Si queremos conocer la información de una base de datos específica usamos el comando:

```javascript
db.stats()
```

<img src="https://i.imgur.com/rCAfWFm.png" alt="My cool logo"/>

Obteniendo todos los parámetros de la base de datos a la que se hace referencia, incluyendo su tamaño, como se puede apreciar en la siguiente imagen.

Detalles de base de datos con MongoDB.
Es todo lo que tenemos por hoy, intentamos cubrir este tema de la forma más completa posible con al menos una alternativa segura y funcional en cualquier contexto para cada caso, y otras que dependen de algún software específico.

