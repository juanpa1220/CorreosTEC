-- ConsultarUsuario: consulta cliente por nombre de usuario
CREATE OR REPLACE PROCEDURE ConsultarUsuario(nombreUsuario VARCHAR2) IS
BEGIN
    SELECT * FROM Cliente C WHERE C.USUARIO = nombreUsuario;
END;


-- ModificarUsuario: modificar cliente por nombre de usuario
CREATE OR REPLACE FUNCTION ModificarUsuario(IdCliente_ NUMBER, user VARCHAR2 DEFAULT NULL,
                                            nombre_ VARCHAR2 DEFAULT NULL,
                                            cedula_ NUMBER DEFAULT NULL, direct DIRECCION DEFAULT NULL,
                                            numsTel_ NUMTELEFONOS DEFAULT NULL,
                                            correos_ CORREOS DEFAULT NULL) RETURN NUMBER AS
    IdPersona_ NUMBER;

BEGIN
    SELECT P1.IDPERSONA
    INTO IdPersona_
    FROM PERSONA P1
             INNER JOIN CLIENTE C on P1.IDPERSONA = C.IDPERSONA;

    if user is not null then
        UPDATE CLIENTE C
        SET USUARIO = user
        WHERE C.IDCLIENTE = IdCliente_;
    end if;

    if nombre_ is not null then
        UPDATE PERSONA P2
        SET P2.NOMBRE = nombre_
        WHERE IDPERSONA = IdPersona_;
    end if;

    if cedula_ is not null then
        UPDATE PERSONA P2
        SET P2.CEDULA = cedula_
        WHERE IDPERSONA = IdPersona_;
    end if;

    if direct is not null then
        UPDATE PERSONA P2
        SET P2.DIRECCION = direct
        WHERE IDPERSONA = IdPersona_;
    end if;

    if numsTel_ is not null then
        UPDATE PERSONA P2
        SET P2.NUMEROSTELEFONO= numsTel_
        WHERE IDPERSONA = IdPersona_;
    end if;

    if correos_ is not null then
        UPDATE PERSONA P2
        SET P2.CORREOS = correos_
        WHERE IDPERSONA = IdPersona_;
    end if;
    RETURN 1;
END ModificarUsuario;