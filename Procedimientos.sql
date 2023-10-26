use Talleres
-- Insertar datos a la tabla Estudiantes
create procedure SP_InsertarEstudiantes
(@IDEs as nvarchar(8), @nombre as nvarchar(50), @apellido as nvarchar(50),
@dni as varchar(10), @fechaNac as date, @genero as nvarchar(10), @direccion as nvarchar(50), @correo as nvarchar(50),
@celular as varchar(10), @IDDistrito as nvarchar(8))
as
begin
insert into ESTUDIANTES(IDEstudiante, NombreEst, ApellidoEst, DniEst, FechaNacimiento, GeneroEst, DireccionEst, CorreoEst, CelularEst, IDDistrito)
values (@IDEs, @nombre, @apellido, @dni, @fechaNac, @genero, @direccion, @correo, @celular, @IDDistrito)
end
go

exec SP_InsertarEstudiantes 'ES00001', 'Marx Alonso', 'Chipana Belleza', '76170311', '2004-03-19', 'Masculino', 'Av. Bentancourt Los Olivos de Pro', 'marxchip9@gmail.com', '944603274', 'DIS0001'
exec SP_InsertarEstudiantes 'ES00002', 'Laura', 'García', '23456782', '2002-06-10', 'Femenino', 'Calle Principal 123', 'laura@gmail.com', '987654321', 'DIS0002'
exec SP_InsertarEstudiantes 'ES00003', 'Carlos', 'Pérez', '87654321', '2003-04-15', 'Masculino', 'Avenida Central 456', 'carlos@gmail.com', '999888777', 'DIS0003'
exec SP_InsertarEstudiantes 'ES00004', 'Ana', 'López', '45678901', '2001-09-25', 'Femenino', 'Calle de la Rosa 789', 'ana@gmail.com', '955666777', 'DIS0004'
exec SP_InsertarEstudiantes 'ES00005', 'Pedro', 'Ramírez', '13579246', '2000-11-30', 'Masculino', 'Calle del Sol 234', 'pedro@gmail.com', '923456789', 'DIS0005'
exec SP_InsertarEstudiantes 'ES00006', 'Sofía', 'Martínez', '98765432', '1999-08-12', 'Femenino', 'Avenida de las Flores 567', 'sofia@gmail.com', '989456123', 'DIS0006'
exec SP_InsertarEstudiantes 'ES00007', 'Diego', 'Gómez', '23456789', '2005-03-03', 'Masculino', 'Calle de las Aves 890', 'diego@gmail.com', '987123456', 'DIS0007'
exec SP_InsertarEstudiantes 'ES00008', 'Luisa', 'Hernández', '65432109', '2000-07-20', 'Femenino', 'Calle de los Árboles 123', 'luisa@gmail.com', '967890123', 'DIS0008'
exec SP_InsertarEstudiantes 'ES00009', 'Roberto', 'Ortega', '01234567', '2004-02-15', 'Masculino', 'Avenida de las Estrellas 456', 'roberto@gmail.com', '954321987', 'DIS0001'
exec SP_InsertarEstudiantes 'ES00010', 'Carolina', 'Sánchez', '98765432', '2002-10-05', 'Femenino', 'Calle de la Luna 345', 'carolina@gmail.com', '987654321', 'DIS0001'
exec SP_InsertarEstudiantes 'ES00011', 'Fernando', 'Gutiérrez', '12345678', '2003-12-08', 'Masculino', 'Avenida de las Nubes 678', 'fernando@gmail.com', '989123456', 'DIS0002'


select * from ESTUDIANTES

-- Insertar datos a la tabla Distritos
create procedure SP_InsertarDistrito
(@IDDistrito as nvarchar(8), @nombredis as nvarchar(50), @region as nvarchar(50))
as
begin
insert into DISTRITOS(IDDistrito, NombreDistrito, RegionDistrito)
values (@IDDistrito, @nombredis, @region)
end
go

exec SP_InsertarDistrito 'DIS0001','Los Olivos','Lima'
exec SP_InsertarDistrito 'DIS0002','Comas','Lima'
exec SP_InsertarDistrito 'DIS0003','Miraflores','Lima'
exec SP_InsertarDistrito 'DIS0004','Breña','Lima'
exec SP_InsertarDistrito 'DIS0005','La Molina','Lima'
exec SP_InsertarDistrito 'DIS0006','Rimac','Lima'
exec SP_InsertarDistrito 'DIS0007','San Borja','Lima'
exec SP_InsertarDistrito 'DIS0008','Surco','Lima'

select * from DISTRITOS


-- Insertar Datos a la tabla Ambiente
create procedure SP_InsertarAmbiente
(
  @IDAmbiente as nvarchar(8),
  @IDDistrito as nvarchar(8),
  @direccion as nvarchar(50),
  @nombreAmb as nvarchar(50)
)
as
begin
  insert into AMBIENTE(IDAmbiente, IDDistrito, DireccionAmb, NombreAmb)
  values (@IDAmbiente, @IDDistrito, @direccion, @nombreAmb)
end
go

exec SP_InsertarAmbiente 'AMB0001','DIS0001','Av Bentancourt','Parque Santa Ana'
exec SP_InsertarAmbiente 'AMB0002','DIS0001','Av Bentancourt','Colegio 2025'
select * from AMBIENTE

-- Insertar Datos a la tabla Profesores
create procedure SP_InsertarProfesores
(@IDProfesor as nvarchar(8), @nombre as nvarchar(50), @dni as varchar(10), @esp as nvarchar(50), @correo as nvarchar(50), @celular as varchar(10))
as
begin
insert PROFESORES(IDProfesor,NombreProf,DniProf,EspecializacionProf,CorreoProf,CelularProf)
values (@IDProfesor,@nombre,@dni,@esp,@correo,@celular)
end
go

exec SP_InsertarProfesores 'PROF0001','Martin Gutierrez', '9876645','Matematica','martin987@gmail.com','987554331'
exec SP_InsertarProfesores 'PROF0002','Max Cervantes', '1776445','Robotica','maxCer@gmail.com','955463211'
exec SP_InsertarProfesores 'PROF0004','Maria Cabanillas', '2146645','Dibujo','maria25@hotmail.com','997758644'
exec SP_InsertarProfesores 'PROF0005','Franchesca Guevara', '1476632','Musica','franches36@live.com','944331124'
select * from PROFESORES


-- insertar datos a la tabla Horarios
create procedure SP_InsertarHorarios
(@IDHorarioa as nvarchar(8), @diaSem as nvarchar(50), @Hinicio as time(0), @HFinal as time(0))
as
begin
insert HORARIOS(IDHorario,DiaSemana,HoraInicio,HoraFinalizacion)
values(@IDHorarioa,@diaSem,@Hinicio,@HFinal)
end
go

exec SP_InsertarHorarios 'HOR0001','Lunes-Martes','09:00:00','10:30:00'
exec SP_InsertarHorarios 'HOR002', 'Miercoles-Sabado', '14:30:00', '16:30:00'
exec SP_InsertarHorarios 'HOR003', 'Viernes-Sabado', '10:00:00', '12:00:00'
exec SP_InsertarHorarios 'HOR004','Martes-Jueves','11:00:00','13:00:00'
exec SP_InsertarHorarios 'HOR005','Lunes-Miercoles','08:00:00','10:00:00'
exec SP_InsertarHorarios 'HOR006','Lunes-Miercoles-Viernes','15:00:00','16:30:00'
exec SP_InsertarHorarios 'HOR007','Martes-Jueves-Sabado','17:00:00','19:30:00'
exec SP_InsertarHorarios 'HOR008','Lunes-Miercoles-Viernes','11:00:00','12:30:00'

select * from HORARIOS



--Insertar datos a la tabla Talleres
select * from PROFESORES
CREATE PROCEDURE SP_InsertarTaller
(
    @IDTaller nvarchar(8),
    @NombreTaller nvarchar(50),
    @DescripcionTaller nvarchar(50),
    @Costo money,
    @CupoMaximo int,
    @IDProfesor nvarchar(8),
    @IDAmbiente nvarchar(8),
    @IDHorario nvarchar(8),
    @IDDistrito nvarchar(8)
)
AS
BEGIN
    INSERT INTO TALLERES (IDTaller, NombreTaller, DescripcionTaller, Costo, CupoMaximo, IDProfesor, IDAmbiente, IDHorario, IDDistrito)
    VALUES (@IDTaller, @NombreTaller, @DescripcionTaller, @Costo, @CupoMaximo, @IDProfesor, @IDAmbiente, @IDHorario, @IDDistrito)
END

EXEC SP_InsertarTaller 'TLLR001', 'Taller de Pintura', 'Aprende a pintar al óleo', 100.00, 20, 'PROF0004', 'AMB0001', 'HOR0001', 'DIS0001'

select * from TALLERES


-- Insertar Datos a la tabla Inscripciones
CREATE PROCEDURE SP_InsertarInscripcion
(
    @IDInscripciones nvarchar(8),
    @FechaInscripcion date,
    @EstadoPago nvarchar(20),
    @IDTaller nvarchar(8),
    @IDEstudiante nvarchar(8)
)
AS
BEGIN
    INSERT INTO INSCRIPCIONES (IDInscripciones, FechaInscripcion, EstadoPago, IDTaller, IDEstudiante)
    VALUES (@IDInscripciones, @FechaInscripcion, @EstadoPago, @IDTaller, @IDEstudiante)
END
EXEC SP_InsertarInscripcion 'IN00001', '2023-10-26', 'Pagado', 'TLLR001', 'ES00001'
select * from INSCRIPCIONES


-- Insertar datos a la tabla Matricula
CREATE PROCEDURE SP_InsertarMatricula
(
    @IDMatricula nvarchar(8),
    @IDInscripciones nvarchar(8),
    @MontoPagado money,
    @FechaPago date,
    @MetodoPago varchar(50)
)
AS
BEGIN
    INSERT INTO MATRICULA (IDMatricula, IDInscripciones, MontoPagado, FechaPago, MetodoPago)
    VALUES (@IDMatricula, @IDInscripciones, @MontoPagado, @FechaPago, @MetodoPago)
END
EXEC SP_InsertarMatricula 'MAT0001', 'IN00001', 100.00, '2023-10-26', 'Tarjeta de Crédito'
select * from MATRICULA