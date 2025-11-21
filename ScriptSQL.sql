--Usuarios
INSERT INTO usuarios (admin, apellidos, contra, nombre_usuario) VALUES 
(1, 'Administrador', 'admin123', 'Admin'),
(0, 'del Campo', 'usuario123', 'User');

-- Categorias
INSERT INTO Categorias (nombre_categoria) VALUES
('Papelería'),
('Escritura'),
('Organización'),
('Tecnología'),
('Accesorios de oficina'),
('Mobiliario'),
('Decoración'),
('Electrodomésticos'),
('Ropa y merchandising');

-- Productos
INSERT INTO Productos (descripcion, precioUnitario, stock, id_categoria) VALUES
('Alfombrilla ergonómica', 3.00, 87, 9),
('Archivador', 4.00, 42, 1),
('Archivador negro', 4.50, 65, 1),
('Bandeja de color', 4.20, 33, 3),
('Bandeja fija', 5.20, 91, 3),
('Bolígrafos de colores', 1.50, 76, 2),
('Camiseta con logo', 15.00, 58, 9),
('Calculadora científica', 12.00, 99, 4),
('Calculadora especial', 15.00, 21, 4),
('Clip caja', 2.30, 84, 5),
('Clip colores', 2.70, 39, 5),
('Folios de colores', 6.00, 73, 1),
('Folios personalizados', 7.00, 88, 1),
('Folios reciclaje', 6.00, 45, 1),
('Grapadora manual', 13.60, 62, 5),
('Grapadora metálica', 20.30, 97, 5),
('Lápices Staedtler', 2.00, 59, 2),
('Portalápices con reloj', 10.00, 66, 3),
('Portalápices serigrafiado', 6.00, 31, 3),
('Post-it colores', 3.00, 80, 1),
('Post-it único color', 2.50, 55, 1),
('Sobres 90 G/M2', 2.50, 71, 1),
('Subrayador de colores', 9.00, 43, 1),
('Subrayador único color', 2.20, 90, 1),
('USB Expedit', 7.00, 64, 4),
('Sobres personalizados', 4.00, 36, 1),
('Alfombrillas varias', 2.50, 78, 9),
('Agendas Zepelin', 15.00, 29, 3),
('Portaminas Pilot 05', 1.50, 82, 2),
('USB 16 GB', 9.24, 53, 4),
('Folios con logo', 2.50, 40, 1),
('Libreta con Logo', 4.00, 61, 1),
('Aire acondicionado Fijo Aire Plus 3 x 1', 825.61, 12, 8),
('ALEX cómoda con 9 cajones', 106.61, 25, 6),
('Cubo pedal 40 litros CURVER CROMADO MATE', 25.57, 70, 6),
('Estantería de resina ELEGANCE NEGRO 138 X 60 X 30', 10.70, 34, 6),
('M-CAJONERA', 66.00, 49, 6),
('MESAS DE DIRECCIÓN H2 DE HERPESA', 147.00, 19, 6),
('Nespresso De Longhi INISSIA', 61.61, 11, 8),
('Pantalla con trípode FONESTAR', 128.09, 38, 4),
('Pantalla Retina 4K Procesador a 3 GHz 1 TB de almacenamiento', 1244.30, 7, 4),
('REPOSAPIES BULTRUPUDOS', 28.00, 95, 5),
('SILLA DE ESCRITORIO NELF', 60.00, 44, 6),
('SOPORTE NEGRO', 3.50, 86, 5),
('VISCHAN Reloj de pared', 12.39, 67, 7),
('LÁMPARA FLEXO PLATEADO', 12.50, 52, 7);



