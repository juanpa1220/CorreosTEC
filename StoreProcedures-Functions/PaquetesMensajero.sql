-- PaquetesMensajero: consulta lista de distribucion de un mesajero
CREATE OR REPLACE PROCEDURE PaquetesMensajero IS
BEGIN
    SELECT E.IDENTIFICACION AS IdentificacionMensajero, D.DIRECCIONDESTINO AS DireccionDestino, D.DISTANCIO AS Distancia
    FROM DISTRIBUCION D
             INNER JOIN EMPLEADO E on D.IDEMPLEADO = E.IDEMPLEADO
    WHERE E.IDEMPLEADO = 2 -- Empleado al cual queremos ver lista de distribucion
    ORDER BY Distancia DESC;
END;

