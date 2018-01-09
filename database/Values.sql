use Empresa
go
insert into CategoriasProductos (Descripcion)
values ('Telefonos'), ('Notebooks'), ('Impresoras'), ('Heladeras'), ('Monitores'), ('Microondas')
go
insert into CategoriasUsuario (Descripcion)
values ('Administrador'), ('Cliente')
go
insert into CategoriasEmpleados (Descripcion)
values ('Vendedeor'), ('Cajero'), ('Repositor')
go
insert into Usuarios (Usuario, Pass, IdCategoriaUsuario, Nombre, Apellido, Email)
values ('amarcazzo', 'admin', 1, 'Ayrton', 'Marcazzo', 'ayrtonmarcazzo@gmail.com'), ('pperez', '123', 2, 'Pablo', 'Perez', 'pperez@gmail.com')
go
insert into Productos (Estado,Descripcion, Stock, StockMin, Precio, IDCategoria, Marca, Nombre, Imagen)
values
(1, 'Con el primer sistema operativo Octa Core de 64 bits del mundo, podés disfrutar de una verdadera experiencia multitarea entre una amplia gama de aplicaciones de productividad, para que vos y tu negocio mantengan el máximo nivel de desempeño.', 6, 3, 16999, 1, 'Samsung', 'Samsung S6 Edge', './img/products/s6edge.jpg'),
(1,'Esta notebook HP presenta la combinación perfecta de diseño, confiabilidad y recursos. Estilo y productividad, al tiempo que piensas en tu presupuesto, algo que te encantará.', 4, 2, 12999, 2, 'HP', 'HP 14-AC111LA', './img/products/hp14-ac111.jpg'),
(1,'Mejorá tu cocina con el elegante horno microondas MG23F3K3TAK, con un frente vidrio negro encerrado en un fino patrón a tono, con una pantalla de vidrio azul y una perilla detallada plateada.', 4, 2, 3799, 6, 'Samsung', 'Samsung 23 L MG23F3', './img/products/samsung20lme731k.jpg'),
(1,'Descongelar a veces es algo indispensable, aunque exige tiempo. Además, muchas veces los alimentos no se descongelan de forma homogénea.', 4, 2, 3199, 6, 'Samsung', 'Samsung 20 L ME731K', './img/products/samsung23lmg23.jpg'),
(1,'Microondas con Crispy. Máxima Cocción. Más Inteligente. Nueva función Crisp, garantiza la mejor cocción crocante y Bread DeFrost, tu pan congelado listo en tu mesa con solo utilizar esta función.', 4, 2, 7999, 6, 'Whirpool', 'Whirpool 27 LJQ280', './img/products/whirpool27ljq280.jpg'),
(1,'Con la tecnologia NeoFrost podrás tener frío seco en el freezer para conservar tus alimentos de la mejor manera y frío humero en la heladera para consumir tus comidas con la temperatura ideal.', 3, 2, 12999, 4, 'SIAM', 'Neo Frost SIAM HSI-FT23B', './img/products/neofrostsiamhsi-ft23b.jpg'),
(1,'Con su gran capacidad de 457 litros, se destaca por su exclusivo diseño Vintage con opción de dos colores, blanco y rojo, único en el mercado.', 5, 2, 29999, 4, 'SIAM', 'No Frost SIAM HSI-RT60', './img/products/nofrostsiamhsi-rt60.jpg'),
(1,'General Electric, líder mundial en tecnología, presenta su nueva heladera SBS PKPS5INOX, lo último y más moderno en tecnología de refrigeración para preservar alimentos', 2, 1, 49999, 4, 'General Electric', 'SBS General Electric PKPS5INOX', './img/products/sbsgepkps5inox.jpg'),
(1,'El monitor LED Serie 1 de Samsung tiene un diseño elegante con un aspecto muy brillante. Su estilo minimalista y sencillo se atiene a lo básico pero con sofisticación', 6, 3, 2999, 5, 'Samsung', 'LED Samsung 18.5" LS19D300HYCZB', './img/products/samsung185ls19d3.jpg'),
(1,'Mantenga cubiertas sus necesidades. Este todo-en-uno de HP y los cartuchos de tinta de capacidad ultra alta imprimen miles de páginas que se destacan.', 5, 2, 2999, 3, 'HP', 'Multifunción HP DESKJET ULTRA 4729', './img/products/hpdeskjet4729.jpg'),
(1,'La L565 es la multifuncional completa para tu negocio, ideal para altos volúmenes de impresión con un bajo costo de operación y mayor productividad.', 5, 2, 9099, 3, 'Epson', 'Multifunción EPSON L565', './img/products/epsonl565.jpg')
go
insert into Provincias (Descripcion)
values ('Buenos Aires'), ('Santa Fe'), ('Córdoba'), ('San Juan'), ('San Luis'), ('Mendoza'), ('La Rioja'), ('Catamarca'), ('Formosa'), ('La Pampa'), ('Rio Negro'), ('Santa Cruz'), ('Neuquen'), ('Tucuman'), ('Salta'), ('Jujuy'), ('Chaco'), ('Santiago del Estero'), ('Tierra del fuego'), ('Entre Rios'), ('Misiones'), ('Corrientes'), ('Chubut')
go
insert into Localidades (IDProvincia, CP, Descripcion)
values (1, 1625, 'Belen de Escobar'), (1, 1623, 'Matheu'), (1, 1617, 'Pacheco'), (2, 2000, 'Rosario'), (3, 5000, 'Córdoba'), (2, 3000, 'Santa Fe'), (6, 5500, 'Mendoza'), (1, 1000, 'Capital Federal') 
go
insert into Empleados (Nombre, Apellido, DNI, IDCategoria, CP)
values ('Ayrton', 'Marcazzo', '36830285', 1, 1625)
go
insert into Catalogos (IDCatalogo, FechaCreacion)
values (1, GETDATE())
go
insert into Sucursales (IDCatalogo, Descripcion, CP, Direccion, Mapa)
values 
(1, 'Escobar', 1625, 'Ruta 25 1710', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6587.006518355887!2d-58.79343986603156!3d-34.36311831901335!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x186df38cf34a97a4!2sHIPERMERCADO+JUMBO+ESCOBAR!5e0!3m2!1ses-419!2sar!4v1478813675451'),
(1, 'Rosario', 2000, 'Nansen 323', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3349.568678987787!2d-60.68614668419204!3d-32.90957037734366!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95b6536661204fcb%3A0x703acec88de5fb04!2sGaler%C3%ADa+Portal+Rosario+Shopping%2C+Nansen+323%2C+S2013APG+Rosario%2C+Santa+Fe!5e0!3m2!1ses-419!2sar!4v1478813590646'),
(1, 'Capital Federal', 1000, 'Avenida Santa Fe 4950', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3285.0583827517353!2d-58.43176438415333!3d-34.57738926361389!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bcb590bcec7ed9%3A0x4d74a2a5f1f8d553!2sAv.+Santa+Fe+4950%2C+Cdad.+Aut%C3%B3noma+de+Buenos+Aires!5e0!3m2!1ses-419!2sar!4v1478813308940'),
(1, 'Mendoza', 5500, 'Balcarce 867', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3349.2883731312686!2d-68.84135068419188!3d-32.916978477718246!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x967e0966ecd0ca17%3A0x88097a640d9b96a2!2sBalcarce+867%2C+5501+Godoy+Cruz%2C+Mendoza!5e0!3m2!1ses-419!2sar!4v1478813713175')
go
insert into Ventas (IDSucursal, IDEmpleado, IDUsuario, Fecha, Monto) 
values (1, 1, 2, GETDATE(), 40996)
go
insert into DetalleVenta (IDVenta, IDProducto, Precio, Cantidad)
values (1, 1, 16999, 1), (1, 2, 12999, 1), (1, 3, 3799, 1), (1, 4, 3199, 1)