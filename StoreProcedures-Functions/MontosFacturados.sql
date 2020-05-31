-- MontoXServicio: consulta montos facturados por servicio
CREATE OR REPLACE PROCEDURE MontoXServicio IS
BEGIN
    SELECT T.SERVICIO, SUM(Monto) AS Montos
    FROM ENVIO E
             INNER JOIN TIPOSERVICIO T on E.IDTIPOSERVICIO = T.IDTIPOSERVICIO
    GROUP BY T.SERVICIO;
END;


-- MontoXSucursal: consulta montos facturados por Sucursal
CREATE OR REPLACE PROCEDURE MontoXSucursal IS
BEGIN
    SELECT S.NOMBRE, SUM(Monto) AS Montos
    FROM ENVIO E
             INNER JOIN SUCURSAL S on E.IDSUCURSALDESTINO = S.IDSUCURSAL
    GROUP BY S.NOMBRE;
END;

