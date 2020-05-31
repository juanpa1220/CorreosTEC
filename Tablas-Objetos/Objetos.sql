CREATE OR REPLACE TYPE Direccion AS OBJECT
(
    Pais      VARCHAR2(20),
    Ciudad    VARCHAR2(20),
    Direccion VARCHAR2(40)
);

CREATE OR REPLACE TYPE NombreCompleto AS OBJECT
(
    Nombre    VARCHAR2(30),
    Apellido1 VARCHAR2(30),
    Apellido2 VARCHAR2(30)
);

CREATE OR REPLACE TYPE NumTel AS OBJECT
(
    Especificacion VARCHAR2(20),
    NumTelefono    NUMBER
);

-- Coleccion de numeros de Telefono
CREATE TYPE NumTelefonos as
    VARRAY (4) of NumTel;


CREATE OR REPLACE TYPE Correo AS OBJECT
(
    Especificacion VARCHAR2(20),
    Correo         VARCHAR2(40)
);

-- Coleccion de Correos
CREATE TYPE Correos as
    VARRAY (4) of Correo;


CREATE OR REPLACE TYPE Paquete AS OBJECT
(
    Descripcion VARCHAR2(40),
    Peso        NUMBER
);

-- Coleccion de Paquetes
CREATE TYPE Paquetes as
    VARRAY (10) of Paquete;