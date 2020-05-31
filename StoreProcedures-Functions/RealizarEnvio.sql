-- RealizarEnvio: Realiza envio de un paquete
CREATE OR REPLACE PROCEDURE RealizarEnvio(IdEnvio_ Number, IdCliente_ NUMBER, IdSucOrigen NUMBER, IdSucDestino NUMBER,
                                          IdTipoPaq NUMBER, Paquetes_ PAQUETES, Monto_ NUMBER, NumConf NUMBER) IS
BEGIN
    INSERT INTO ENVIO (IDENVIO, IDCLIENTE, IDSUCURSALORIGEN, IDSUCURSALDESTINO, IDTIPOSERVICIO, PAQUETES, MONTO,
                       NUMEROCONFIMARCION)
    VALUES (IdEnvio_, IdCliente_, IdSucOrigen, IdSucDestino, IdTipoPaq, Paquetes_, Monto_, NumConf);
END;
