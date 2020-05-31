-- ConsultarUsuario: consulta cliente por nombre de usuario
CREATE OR REPLACE PROCEDURE ConsultarUsuario(nombreUsuario IN VARCHAR2, nombre_ OUT NOMBRECOMPLETO) AS
BEGIN
    SELECT P.NOMBRE
    INTO nombre_
    FROM Cliente C
             INNER JOIN PERSONA P on C.IDPERSONA = P.IDPERSONA
    WHERE C.USUARIO = nombreUsuario;
END;

-- Prueba consulta usuario
DECLARE
    nombre_ NOMBRECOMPLETO;
BEGIN
    ConsultarUsuario('Usuario 5', nombre_);
    DBMS_OUTPUT.PUT(nombre_.NOMBRE);
end;



-- ModificarUsuario: modificar cliente por nombre de usuario
CREATE OR REPLACE PROCEDURE ModificarUsuario(IdCliente_ IN NUMBER, user IN VARCHAR2 DEFAULT NULL, nombre_ IN NOMBRECOMPLETO DEFAULT NULL,
                                             cedula_ IN NUMBER DEFAULT NULL, direct IN DIRECCION DEFAULT NULL, numsTel_ IN NUMTELEFONOS DEFAULT NULL,
                                             correos_ IN CORREOS DEFAULT NULL) AS
    IdPersona_ NUMBER;

BEGIN
    SELECT P1.IDPERSONA
    INTO IdPersona_
    FROM PERSONA P1
             INNER JOIN CLIENTE C on P1.IDPERSONA = C.IDPERSONA
    WHERE C.IDCLIENTE = IdCliente_;


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
END ModificarUsuario;

-- Prueba ModificarUsuario
BEGIN
    ModificarUsuario(1, 'User 1111'); -- Cambia el nombre de usuario
end;