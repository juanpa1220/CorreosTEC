CREATE TABLE Sucursal
(
    IdSucursal NUMBER PRIMARY KEY NOT NULL,
    Nombre     VARCHAR2(30),
    Direccion  DIRECCION
);

CREATE TABLE DistanciaXSucursal
(
    IdSucursalOrigen  NUMBER,
    IdSucursalDestino NUMBER,
    Distancia         NUMBER, -- Distancias en Kilometros
    CONSTRAINT fk_SucursalOrigen FOREIGN KEY (IdSucursalOrigen) REFERENCES Sucursal (IdSucursal),
    CONSTRAINT fk_SucursalDestino FOREIGN KEY (IdSucursalDestino) REFERENCES Sucursal (IdSucursal)
);

CREATE TABLE Persona
(
    IdPersona       NUMBER PRIMARY KEY NOT NULL,
    Nombre          NOMBRECOMPLETO,
    Cedula          NUMBER,
    Direccion       DIRECCION,
    NumerosTelefono NUMTELEFONOS,
    Correos         CORREOS
);

CREATE TABLE Cliente
(
    IdCliente NUMBER PRIMARY KEY NOT NULL,
    IdPersona NUMBER,
    Usuario   VARCHAR2(20),
    CONSTRAINT fk_PersonaCliente FOREIGN KEY (IdPersona) REFERENCES Persona (IdPersona)
);

CREATE TABLE TipoEmpleo
(
    IdTipoEmpleo NUMBER PRIMARY KEY NOT NULL,
    Empleo       VARCHAR2(20),
    Descripcion  VARCHAR2(50)
);

CREATE TABLE Empleado
(
    IdEmpleado     NUMBER PRIMARY KEY NOT NULL,
    IdPersona      NUMBER,
    Identificacion VARCHAR2(20),
    IdTipoEmpleo   NUMBER,
    CONSTRAINT fk_PersonaEmpleado FOREIGN KEY (IdPersona) REFERENCES Persona (IdPersona),
    CONSTRAINT fk_TipoEmpleoEmpleado FOREIGN KEY (IdTipoEmpleo) REFERENCES TipoEmpleo (IdTipoEmpleo)
);

CREATE TABLE TipoServicio
(
    IdTipoServicio NUMBER PRIMARY KEY NOT NULL,
    Servicio       VARCHAR2(20),
    Descripcion    VARCHAR2(50),
    MontoBase      Number -- Monto en Dolares
);

CREATE TABLE PesoRango
(
    IdPesoRango  NUMBER PRIMARY KEY NOT NULL,
    PesoInferior Number, -- Peso en kilos
    PesoSuperior Number,
    Monto        Number  -- Monto en Dolares
);

CREATE TABLE DistanciaRango
(
    IdDistanciaRango  NUMBER PRIMARY KEY NOT NULL,
    DistanciaInferior Number,
    DistanciaSuperior Number,
    Monto             Number -- Monto en Dolares
);

CREATE TABLE ProcesoEnvio
(
    IdProcesoEnvio NUMBER PRIMARY KEY NOT NULL,
    ProcesoEnvio   VARCHAR2(20),
    Descripcion    VARCHAR2(50)
);


CREATE TABLE CondicionPaquete
(
    IdCondicionPaquete NUMBER PRIMARY KEY NOT NULL,
    CondicionPaquete   VARCHAR2(20),
    Descripcion        VARCHAR2(50)
);

CREATE TABLE Envio
(
    IdEnvio            NUMBER PRIMARY KEY NOT NULL,
    IdCliente          NUMBER,
    IdSucursalOrigen   NUMBER,
    IdSucursalDestino  NUMBER,
    IdTipoServicio     NUMBER,
    Paquetes           PAQUETES,
    Monto              NUMBER,
    NumeroConfimarcion NUMBER,
    CONSTRAINT fk_ClienteEnvio FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente),
    CONSTRAINT fk_SucursalOrigenEnvio FOREIGN KEY (IdSucursalOrigen) REFERENCES Sucursal (IdSucursal),
    CONSTRAINT fk_SucursalDestinoEnvio FOREIGN KEY (IdSucursalDestino) REFERENCES Sucursal (IdSucursal),
    CONSTRAINT fk_TipoServicioEnvio FOREIGN KEY (IdTipoServicio) REFERENCES TipoServicio (IdTipoServicio)
);

CREATE TABLE EstadoEnvio
(
    IdEstadoEnvio      NUMBER PRIMARY KEY NOT NULL,
    IdEnvio            NUMBER,
    IdProcesoEnvio     NUMBER,
    IdCondicionPaquete NUMBER,
    LugarActual        VARCHAR2(20),
    CONSTRAINT fk_Envio FOREIGN KEY (IdEnvio) REFERENCES Envio (IdEnvio),
    CONSTRAINT fk_ProcesoEnvioEstadoEnvio FOREIGN KEY (IdProcesoEnvio) REFERENCES ProcesoEnvio (IdProcesoEnvio),
    CONSTRAINT fk_CondicionPaqueteEstadoEnvio FOREIGN KEY (IdCondicionPaquete) REFERENCES CondicionPaquete (IdCondicionPaquete)
);

CREATE TABLE Distribucion
(
    IdDistribucion   NUMBER PRIMARY KEY NOT NULL,
    IdEnvio          NUMBER,
    IdEmpleado       NUMBER,
    Distancio        NUMBER,
    DireccionDestino DIRECCION,
    CONSTRAINT fk_EnvioDistribucion FOREIGN KEY (IdEnvio) REFERENCES Envio (IdEnvio),
    CONSTRAINT fk_EmpleadoDistribucion FOREIGN KEY (IdEmpleado) REFERENCES Empleado (IdEmpleado)
);