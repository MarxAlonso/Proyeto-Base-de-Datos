/*create database Talleres
use Talleres*/

CREATE TABLE PROFESORES
( 
	IDProfesor           nvarchar(8)  NOT NULL ,
	NombreProf           nvarchar(50)  NOT NULL ,
	DniProf              nvarchar(10)  NOT NULL ,
	EspecializacionProf  nvarchar(50)  NOT NULL ,
	CorreoProf           nvarchar(50)  NOT NULL ,
	CelularProf          varchar(10)  NOT NULL ,
	CONSTRAINT XPKPROFESORES PRIMARY KEY (IDProfesor ASC)
)
go



CREATE TABLE DISTRITOS
( 
	IDDistrito           nvarchar(8)  NOT NULL ,
	NombreDistrito       nvarchar(50)  NOT NULL ,
	RegionDistrito       nvarchar(50)  NOT NULL ,
	CONSTRAINT XPKDISTRITOS PRIMARY KEY (IDDistrito ASC)
)
go



CREATE TABLE AMBIENTE
( 
	IDAmbiente           nvarchar(8)  NOT NULL ,
	IDDistrito           nvarchar(8)  NOT NULL ,
	DireccionAmb         nvarchar(50)  NOT NULL ,
	NombreAmb            nvarchar(50)  NOT NULL ,
	CONSTRAINT XPKAMBIENTE PRIMARY KEY (IDAmbiente ASC,IDDistrito ASC),
	CONSTRAINT R_60 FOREIGN KEY (IDDistrito) REFERENCES DISTRITOS(IDDistrito)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE INDEX XIF1AMBIENTE ON AMBIENTE
( 
	IDDistrito            ASC
)
go



CREATE TABLE HORARIOS
( 
	IDHorario            nvarchar(8)  NOT NULL ,
	DiaSemana            nvarchar(50)  NULL ,
	HoraInicio           time(0)  NOT NULL ,
	HoraFinalizacion     time(0)  NOT NULL ,
	CONSTRAINT XPKHORARIOS PRIMARY KEY (IDHorario ASC)
)
go



CREATE TABLE TALLERES
( 
	IDTaller             nvarchar(8)  NOT NULL ,
	NombreTaller         nvarchar(50)  NOT NULL ,
	DescripcionTaller    nvarchar(50)  NOT NULL ,
	Costo                money  NOT NULL ,
	CupoMaximo           int  NOT NULL ,
	IDProfesor           nvarchar(8)  NULL ,
	IDAmbiente           nvarchar(8)  NOT NULL ,
	IDHorario            nvarchar(8)  NOT NULL ,
	IDDistrito           nvarchar(8)  NULL ,
	CONSTRAINT XPKTALLERES PRIMARY KEY (IDTaller ASC),
	CONSTRAINT R_41 FOREIGN KEY (IDProfesor) REFERENCES PROFESORES(IDProfesor)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT R_50 FOREIGN KEY (IDAmbiente,IDDistrito) REFERENCES AMBIENTE(IDAmbiente,IDDistrito)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT R_55 FOREIGN KEY (IDHorario) REFERENCES HORARIOS(IDHorario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT R_57 FOREIGN KEY (IDDistrito) REFERENCES DISTRITOS(IDDistrito)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE INDEX XIF2TALLERES ON TALLERES
( 
	IDProfesor            ASC
)
go



CREATE INDEX XIF3TALLERES ON TALLERES
( 
	IDAmbiente            ASC,
	IDDistrito            ASC
)
go



CREATE INDEX XIF4TALLERES ON TALLERES
( 
	IDHorario             ASC
)
go



CREATE INDEX XIF5TALLERES ON TALLERES
( 
	IDDistrito            ASC
)
go



CREATE TABLE ESTUDIANTES
( 
	IDEstudiante         nvarchar(8)  NOT NULL ,
	NombreEst            nvarchar(50)  NULL ,
	ApellidoEst          nvarchar(50)  NULL ,
	DniEst               varchar(10)  NULL ,
	FechaNacimiento      date  NULL ,
	GeneroEst            nvarchar(10)  NULL ,
	DireccionEst         nvarchar(50)  NULL ,
	CorreoEst            nvarchar(50)  NULL ,
	CelularEst           varchar(10)  NULL ,
	IDDistrito           nvarchar(8)  NULL ,
	CONSTRAINT XPKESTUDIANTES PRIMARY KEY (IDEstudiante ASC),
	CONSTRAINT R_56 FOREIGN KEY (IDDistrito) REFERENCES DISTRITOS(IDDistrito)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE INDEX XIF3ESTUDIANTES ON ESTUDIANTES
( 
	IDDistrito            ASC
)
go



CREATE TABLE INSCRIPCIONES
( 
	IDInscripciones      nvarchar(8)  NOT NULL ,
	FechaInscripcion     date  NOT NULL ,
	EstadoPago           nvarchar(20)  NOT NULL ,
	IDTaller             nvarchar(8)  NULL ,
	IDEstudiante         nvarchar(8)  NULL ,
	CONSTRAINT XPKINSCRIPCIONES PRIMARY KEY (IDInscripciones ASC),
	CONSTRAINT R_61 FOREIGN KEY (IDTaller) REFERENCES TALLERES(IDTaller)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT R_62 FOREIGN KEY (IDEstudiante) REFERENCES ESTUDIANTES(IDEstudiante)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE INDEX XIF6INSCRIPCIONES ON INSCRIPCIONES
( 
	IDTaller              ASC
)
go



CREATE INDEX XIF7INSCRIPCIONES ON INSCRIPCIONES
( 
	IDEstudiante          ASC
)
go



CREATE TABLE MATRICULA
( 
	IDMatricula          nvarchar(8)  NOT NULL ,
	IDInscripciones      nvarchar(8)  NOT NULL ,
	MontoPagado          money  NOT NULL ,
	FechaPago            date  NOT NULL ,
	MetodoPago           varchar(50)  NOT NULL ,
	CONSTRAINT XPKMATRICULA PRIMARY KEY (IDMatricula ASC,IDInscripciones ASC),
	CONSTRAINT R_59 FOREIGN KEY (IDInscripciones) REFERENCES INSCRIPCIONES(IDInscripciones)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE INDEX XIF1MATRICULA ON MATRICULA
( 
	IDInscripciones       ASC
)
go


