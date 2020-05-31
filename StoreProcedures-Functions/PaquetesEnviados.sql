-- PaquetesXServicio: consulta paquetes enviados por servicio
CREATE OR REPLACE PROCEDURE PaquetesXServicio IS
BEGIN
    SELECT T.SERVICIO, COUNT(E.IDENVIO) AS CantidaPaquetes
    FROM ENVIO E
             INNER JOIN TIPOSERVICIO T on E.IDTIPOSERVICIO = T.IDTIPOSERVICIO
    GROUP BY T.SERVICIO;
END;

-- PaquetesXSucursal: consulta paquetes enviados por Sucursal
CREATE OR REPLACE PROCEDURE PaqueetesXSucursal IS
BEGIN
    SELECT S.NOMBRE, COUNT(E.IDENVIO) AS CantidaPaquetes
    FROM ENVIO E
             INNER JOIN SUCURSAL S on E.IDSUCURSALDESTINO = S.IDSUCURSAL
    GROUP BY S.NOMBRE;
END;

