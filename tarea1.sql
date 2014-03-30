
CREATE TABLE tarea1.Categoria (
                ID_Categoria INTEGER NOT NULL,
                Nombre_Categoria VARCHAR NOT NULL,
                CONSTRAINT categoria_pk PRIMARY KEY (ID_Categoria)
);


CREATE TABLE tarea1.Plato (
                ID_Plato INTEGER NOT NULL,
                Nombre_Plato VARCHAR NOT NULL,
                Precio INTEGER NOT NULL,
                ID_Categoria INTEGER NOT NULL,
                CONSTRAINT plato_pk PRIMARY KEY (ID_Plato)
);


CREATE TABLE tarea1.Usuarios (
                RUT INTEGER NOT NULL,
                Password VARCHAR NOT NULL,
                Nombre VARCHAR NOT NULL,
                Apellido VARCHAR NOT NULL,
                Email VARCHAR NOT NULL,
                Rol INTEGER NOT NULL,
                CONSTRAINT usuarios_pk PRIMARY KEY (RUT)
);


CREATE TABLE tarea1.Pedidos (
                ID_Pedidos INTEGER NOT NULL,
                RUT INTEGER NOT NULL,
                Fecha TIMESTAMP NOT NULL,
                CONSTRAINT pedidos_pk PRIMARY KEY (ID_Pedidos)
);


CREATE TABLE tarea1.Plato_Pedidos (
                ID_Plato INTEGER NOT NULL,
                ID_Pedidos INTEGER NOT NULL,
                CONSTRAINT plato_pedidos_pk PRIMARY KEY (ID_Plato, ID_Pedidos)
);


ALTER TABLE tarea1.Plato ADD CONSTRAINT categoria_plato_fk
FOREIGN KEY (ID_Categoria)
REFERENCES tarea1.Categoria (ID_Categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tarea1.Plato_Pedidos ADD CONSTRAINT plato_plato_pedidos_fk
FOREIGN KEY (ID_Plato)
REFERENCES tarea1.Plato (ID_Plato)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tarea1.Pedidos ADD CONSTRAINT usuarios_pedidos_fk
FOREIGN KEY (RUT)
REFERENCES tarea1.Usuarios (RUT)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tarea1.Plato_Pedidos ADD CONSTRAINT pedidos_plato_pedidos_fk
FOREIGN KEY (ID_Pedidos)
REFERENCES tarea1.Pedidos (ID_Pedidos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
