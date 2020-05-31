-- RealizarEnvio: Realiza envio de un paquete
CREATE OR REPLACE PROCEDURE RealizarEnvio(IdEnvio_ IN Number, IdCliente_ IN NUMBER, IdSucOrigen IN NUMBER,
                                          IdSucDestino IN NUMBER,
                                          IdTipoPaq IN NUMBER, Paquetes_ IN PAQUETES,
                                          NumConf OUT NUMBER) AS
    Monto_   NUMBER := 0;
    MontoPre Number;
    NumConf  NUMBER := DBMS_RANDOM.RANDOM;
BEGIN
    -- Calcula monto
    SELECT Monto_
    INTO MontoPre
    FROM TIPOSERVICIO
    WHERE IDTIPOSERVICIO = IdTipoPaq;
    Monto_ := + MontoPre;

    for i in 1..Paquetes_.COUNT
        loop
            SELECT P.MONTO
            INTO MontoPre
            FROM PESORANGO P
            WHERE PESOINFERIOR < Paquetes_(i)(1)
              AND Paquetes_(i)(1) > PESOSUPERIOR;
            Monto_ := + MontoPre;
        end loop;

    INSERT INTO ENVIO (IDENVIO, IDCLIENTE, IDSUCURSALORIGEN, IDSUCURSALDESTINO, IDTIPOSERVICIO, PAQUETES, MONTO,
                       NUMEROCONFIMARCION)
    VALUES (IdEnvio_, IdCliente_, IdSucOrigen, IdSucDestino, IdTipoPaq, Paquetes_, Monto_, NumConf);
END;

-- Prueba
BEGIN
    RealizarEnvio(110, 1, 1, 2, 1,
                  PAQUETES(PAQUETE('carro', 12)), 1234);
end;




