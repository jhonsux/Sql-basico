--creacion de la base de datos

CREATE DATABASE IF NOT EXISTS Biblioteca_Huachi;
USE Biblioteca_Huachi;

--creacion de las tablas

CREATE TABLE Libros(
    libro_id int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
    titulo varchar(100) NOT NULL,
    autor varchar(100) NOT NULL,
    año_publicacion varchar(10) NOT NULL,
    genero varchar(100) NOT NULL,
    num_inventario int(100) NOT NULL,
    PRIMARY KEY (libro_id),
    UNIQUE KEY (num_inventario)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE Usuarios(
    usuario_id int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre varchar(100) NOT NULL,
    apellido varchar(100) NOT NULL,
    num_identificacion varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    rol varchar(100) NOT NULL,
    PRIMARY KEY (usuario_id),
    UNIQUE KEY (num_identificacion),
    UNIQUE KEY (email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE Prestamos(
    prestamo_id int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
    usuario_id int(100) NOT NULL,
    libro_id int(100) NOT NULL,
    fecha_prestamo timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_devolucion date DEFAULT NULL,
    estado varchar(100),
    PRIMARY KEY (prestamo_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE Reservas(
    reserva_id int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
    usuario_id int(100) NOT NULL,
    libro_id int(100) NOT NULL,
    fecha_reserva DATE,
    PRIMARY KEY (reserva_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE Historiales(
    historial_id int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
    usuario_id int(100) NOT NULL,
    libro_id int(100) NOT NULL,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    PRIMARY KEY (historial_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


--insertar datos en tablas

INSERT INTO Libros(titulo, autor, año_publicacion, genero, num_inventario)
VALUES ("Cien años de soledad", "Gabriel García Márquez", "1967", "Realismo mágico, novela latinoamericana", 1),
("1984", "George Orwell", "1949", "Distopía, ciencia ficción", 2),
("El señor de los anillos", "J.R.R. Tolkien", "1954-1955", "Fantasía épica", 3),
("To Kill a Mockingbird", "Harper Lee", "1960", "Novela social, drama", 4),
("Crimen y castigo", "Fyodor Dostoevsky", "1866", "Novela psicológica, ficción literaria", 5),
("One Hundred Years of Solitude", "Gabriel García Márquez", "1967", "Realismo mágico, novela latinoamericana", 6),
("The Great Gatsby", "F. Scott Fitzgerald", "1925", "Ficción moderna, novela del jazz", 7),
("The Hitchhiker's Guide to the Galaxy", "Douglas Adams", "1979", "Ciencia ficción, comedia", 8),
("The Catcher in the Rye", "J.D. Salinger", "1951", "Novela de iniciación, ficción literaria", 9),
("The Hunger Games", "Suzanne Collins", "2008", "Distopía, ciencia ficción, aventura juvenil", 10);


INSERT INTO Usuarios(nombre, apellido, num_identificacion, email, rol)
VALUES ("jhon", "sosa", "123JSC", "jhon@correo.com", "estudiante"),
("Alejandra", "García López", "123AGL", "alejandra@correo.com", "profesor"),
("Carlos", "Rodríguez Martínez", "123CRM", "carlos@correo.com", "estudiante"),
("Sofía ", "Hernández Reyes", "123SHR", "sofia@correo.com", "personal"),
("Javier", "González Ramírez", "123JGR", "javier@correo.com", "estudiante"),
("Isabella", "Morales Pérez", "123IMP", "isabella@correo.com", "personal"),
("Ricardo", "Flores Sánchez", "123RFS", "ricardo@correo.com", "profesor"),
("Fernanda", "Díaz Vargas", "123FDV", "fernanda@correo.com", "estudiante"),
("Martín", "Cruz Núñez", "123MCN", "martin@correo.com", "personal"),
("Gabriela", "Torres Jiménez", "123GTJ", "gabriela@correo.com", "profesor");

INSERT INTO Prestamos(usuario_id, libro_id, fecha_devolucion, estado)
VALUES (1, 1, "2023-12-22", "pendiente"),
(1, 2, "2023-12-22", "pendiente"),
(2, 3, "2023-12-22", "pendiente"),
(2, 4, "2023-12-22", "pendiente"),
(3, 5, "2023-12-22", "pendiente"),
(3, 6, "2023-12-22", "pendiente"),
(4, 7, "2023-12-22", "pendiente"),
(4, 8, "2023-12-22", "pendiente"),
(5, 9, "2023-12-22", "pendiente"),
(5, 10, "2023-12-22", "pendiente");


INSERT INTO Reservas(usuario_id, libro_id, fecha_reserva)
VALUES (1, 3, "2023-12-22"),
(1, 4, "2023-12-22"),
(2, 5, "2023-12-22"),
(2, 6, "2023-12-22"),
(3, 7, "2023-12-22"),
(3, 8, "2023-12-22"),
(4, 9, "2023-12-22"),
(4, 10, "2023-12-22"),
(5, 1, "2023-12-22"),
(5, 2, "2023-12-22");

INSERT INTO Historiales(usuario_id, libro_id, fecha_prestamo, fecha_devolucion)
VALUES (1, 1, "2023-12-22", "2023-12-22"),
(1, 2, "2023-12-22", "2023-12-22"),
(2, 3, "2023-12-22", "2023-12-22"),
(2, 4, "2023-12-22", "2023-12-22"),
(3, 5, "2023-12-22", "2023-12-22"),
(3, 6, "2023-12-22", "2023-12-22"),
(4, 7, "2023-12-22", "2023-12-22"),
(4, 8, "2023-12-22", "2023-12-22"),
(5, 9, "2023-12-22", "2023-12-22"),
(5, 10, "2023-12-22", "2023-12-22");

--sentencias Select

SELECT * FROM Libros;

SELECT * FROM Usuarios;

SELECT * FROM Prestamos WHERE estado = 'pendiente';

SELECT Libros.titulo, reservas.fecha_reserva, usuarios.nombre AS nombre_usuario
FROM Reservas
 LEFT JOIN Libros 
    ON Reservas.libro_id = Libros.libro_id
 LEFT JOIN Usuarios 
    ON Reservas.usuario_id = Usuarios.usuario_id;

SELECT Libros.titulo, Historiales.fecha_prestamo, Historiales.fecha_devolucion
FROM Historiales
LEFT JOIN Libros 
    ON Historiales.libro_id = Libros.libro_id
WHERE Historiales.usuario_id In(1,3,5);

--sentencias Delete

DELETE FROM Prestamos WHERE prestamo_id = 3 AND estado = 'pendiente';

DELETE FROM Reservas WHERE reserva_id = 2;

--sentecia Update

UPDATE Prestamos 
SET estado = 'devuelto', fecha_devolucion = '2023-04-01' 
WHERE prestamo_id = 1;

UPDATE Reservas 
SET fecha_reserva = '2023-05-01' WHERE reserva_id = 2;

UPDATE Usuarios 
SET rol = "personal" WHERE usuario_id IN(1,3); 

UPDATE Libros 
SET genero = "perfantacia" WHERE libro_id IN(1,3,5); 



INSERT INTO `Reservas` (`Id_Usuario`, `Id_Libro`, `Fecha_Reserva` ,`Estado`)
VALUES
(1, 3, "2012-12-18", "Disponible"),
(2, 5, "2022-12-22", "Pendiente"),
(3, 7, "2000-12-28", "Pendiente"),
(4, 9, "2013-01-03", "Pendiente"),
(5, 2, "2013-01-08", "Pendiente"),
(6, 4, "2023-01-13", "Disponible"),
(7, 6, "2020-01-18", "Pendiente"),
(8, 8, "2023-01-23", "Disponible"),
(9, 10, "2013-01-28", "Pendiente"),
(10, 1, "2020-02-02", "Disponible");

INSERT INTO `HistorialPrestamos` (`Id_Usuario`, `Id_Libro`, `Fecha_Prestamo`, `Fecha_Devolucion`)
VALUES
(1, 1, "2022-12-15", "2022-12-30"),
(2, 3, "2022-12-20", "2023-01-05"),
(3, 5, "2022-12-25", "2023-01-10"),
(4, 7, "2023-01-01", "2023-01-15"),
(5, 9, "2023-01-05", "2023-01-20"),
(6, 2, "2023-01-10", "2023-01-25"),
(7, 4, "2023-01-15", "2023-01-30"),
(8, 6, "2023-01-20", "2023-02-04"),
(9, 8, "2023-01-25", "2023-02-09"),
(10, 10, "2023-01-30", "2023-02-14");