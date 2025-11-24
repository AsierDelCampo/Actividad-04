--Usuarios
INSERT INTO usuarios (admin, apellidos, contra, nombre_usuario) VALUES 
(1, 'Administrador', 'admin123', 'Admin'),
(0, 'del Campo', 'usuario123', 'Asier'),
(0, 'Aurrekoetxea', 'usuario123', 'Iraitz');

-- Categorias
INSERT INTO Categorias (nombre_categoria) VALUES
('Papeler�a'),
('Escritura'),
('Organizaci�n'),
('Tecnolog�a'),
('Accesorios de oficina'),
('Mobiliario'),
('Decoraci�n'),
('Electrodom�sticos'),
('Ropa y merchandising');

-- Productos
INSERT INTO Productos (descripcion, nombre, precioUnitario, stock, id_categoria) VALUES
('Alfombrilla ergonómica', 'Alfombrilla', 3.00, 87, 9),
('Archivador', 'Archivador', 4.00, 42, 1),
('Archivador negro', 'Archivador negro', 4.50, 65, 1),
('Bandeja de color', 'Bandeja color', 4.20, 33, 3),
('Bandeja fija', 'Bandeja fija', 5.20, 91, 3),
('Bolígrafos de colores', 'Bolígrafos', 1.50, 76, 2),
('Camiseta con logo', 'Camiseta logo', 15.00, 58, 9),
('Calculadora científica', 'Calculadora científica', 12.00, 99, 4),
('Calculadora especial', 'Calculadora especial', 15.00, 21, 4),
('Clip caja', 'Clip caja', 2.30, 84, 5),
('Clip colores', 'Clip colores', 2.70, 39, 5),
('Folios de colores', 'Folios colores', 6.00, 73, 1),
('Folios personalizados', 'Folios personalizados', 7.00, 88, 1),
('Folios reciclaje', 'Folios reciclaje', 6.00, 45, 1),
('Grapadora manual', 'Grapadora manual', 13.60, 62, 5),
('Grapadora metálica', 'Grapadora metálica', 20.30, 97, 5),
('Lápices Staedtler', 'Lápices Staedtler', 2.00, 59, 2),
('Portalápices con reloj', 'Portalápices reloj', 10.00, 66, 3),
('Portalápices serigrafiado', 'Portalápices serigrafiado', 6.00, 31, 3),
('Post-it colores', 'Post-it colores', 3.00, 80, 1),
('Post-it único color', 'Post-it único', 2.50, 55, 1),
('Sobres 90 G/M2', 'Sobres 90 G/M2', 2.50, 71, 1),
('Subrayador de colores', 'Subrayador colores', 9.00, 43, 1),
('Subrayador único color', 'Subrayador único', 2.20, 90, 1),
('USB Expedit', 'USB Expedit', 7.00, 64, 4),
('Sobres personalizados', 'Sobres personalizados', 4.00, 36, 1),
('Alfombrillas varias', 'Alfombrillas varias', 2.50, 78, 9),
('Agendas Zepelin', 'Agenda Zepelin', 15.00, 29, 3),
('Portaminas Pilot 05', 'Portaminas Pilot 05', 1.50, 82, 2),
('USB 16 GB', 'USB 16 GB', 9.24, 53, 4),
('Folios con logo', 'Folios con logo', 2.50, 40, 1),
('Libreta con Logo', 'Libreta con logo', 4.00, 61, 1),
('Aire acondicionado Fijo Aire Plus 3 x 1', 'Aire acondicionado Aire Plus', 825.61, 12, 8),
('ALEX cómoda con 9 cajones', 'Cómoda ALEX', 106.61, 25, 6),
('Cubo pedal 40 litros CURVER CROMADO MATE', 'Cubo pedal 40L', 25.57, 70, 6),
('Estantería de resina ELEGANCE NEGRO 138 X 60 X 30', 'Estantería resina', 10.70, 34, 6),
('M-CAJONERA', 'Cajonera M', 66.00, 49, 6),
('MESAS DE DIRECCIÓN H2 DE HERPESA', 'Mesa dirección H2', 147.00, 19, 6),
('Nespresso De Longhi INISSIA', 'Nespresso INISSIA', 61.61, 11, 8),
('Pantalla con trípode FONESTAR', 'Pantalla trípode', 128.09, 38, 4),
('Pantalla Retina 4K Procesador a 3 GHz 1 TB de almacenamiento', 'Pantalla Retina 4K', 1244.30, 7, 4),
('REPOSAPIES BULTRUPUDOS', 'Reposapiés Bultrupudos', 28.00, 95, 5),
('SILLA DE ESCRITORIO NELF', 'Silla escritorio NELF', 60.00, 44, 6),
('SOPORTE NEGRO', 'Soporte negro', 3.50, 86, 5),
('VISCHAN Reloj de pared', 'Reloj pared VISCHAN', 12.39, 67, 7),
('LÁMPARA FLEXO PLATEADO', 'Lámpara flexo plateado', 12.50, 52, 7);




