use Talleres

-- Consultas Simples
select * from ESTUDIANTES
where FechaNacimiento between '20000101' and '20050101'

select * from ESTUDIANTES
where NombreEst like 'C%'

SELECT count(*) as Cantidad FROM ESTUDIANTES
WHERE GeneroEst = 'Masculino'

select * from ESTUDIANTES
where GeneroEst = 'Femenino'

SELECT * FROM DISTRITOS
WHERE IDDistrito = 'DIS0003'

select count(*) as TotalDistrito from DISTRITOS

select * from PROFESORES Order By NombreProf asc

select NombreDistrito, count(*) as Distritos from DISTRITOS
group by NombreDistrito

select IDDistrito, count(*) as DistritosEstudiantes from ESTUDIANTES
group by IDDistrito


-- Consultas Multiples
-- Consulta 1
SELECT E.NombreEst, E.ApellidoEst, D.NombreDistrito
FROM ESTUDIANTES E
INNER JOIN DISTRITOS D ON E.IDDistrito = D.IDDistrito

-- Consulta 2
SELECT T.NombreTaller, P.NombreProf, H.DiaSemana
FROM TALLERES T
INNER JOIN PROFESORES P ON T.IDProfesor = P.IDProfesor
INNER JOIN HORARIOS H ON T.IDHorario = H.IDHorario

-- Consulta 3
SELECT I.IDInscripciones, E.NombreEst, T.NombreTaller
FROM INSCRIPCIONES I
INNER JOIN ESTUDIANTES E ON I.IDEstudiante = E.IDEstudiante
INNER JOIN TALLERES T ON I.IDTaller = T.IDTaller

-- Consulta 4
SELECT T.NombreTaller, A.NombreAmb, D.NombreDistrito
FROM TALLERES T
INNER JOIN AMBIENTE A ON T.IDAmbiente = A.IDAmbiente
INNER JOIN DISTRITOS D ON A.IDDistrito = D.IDDistrito

-- Consulta 5
SELECT P.NombreProf, D.NombreDistrito
FROM PROFESORES P
INNER JOIN DISTRITOS D ON P.IDDistrito = D.IDDistrito

-- Consulta 6
SELECT E.NombreEst, T.NombreTaller, P.NombreProf
FROM INSCRIPCIONES I
INNER JOIN ESTUDIANTES E ON I.IDEstudiante = E.IDEstudiante
INNER JOIN TALLERES T ON I.IDTaller = T.IDTaller
INNER JOIN PROFESORES P ON T.IDProfesor = P.IDProfesor

-- Consulta 7
SELECT I.IDInscripciones, E.NombreEst, T.NombreTaller, P.NombreProf
FROM INSCRIPCIONES I
INNER JOIN ESTUDIANTES E ON I.IDEstudiante = E.IDEstudiante
INNER JOIN TALLERES T ON I.IDTaller = T.IDTaller
INNER JOIN PROFESORES P ON T.IDProfesor = P.IDProfesor

-- Consulta 9
SELECT T.NombreTaller, A.NombreAmb, D.NombreDistrito
FROM TALLERES T
INNER JOIN AMBIENTE A ON T.IDAmbiente = A.IDAmbiente
INNER JOIN DISTRITOS D ON A.IDDistrito = D.IDDistrito

-- Consulta 10
SELECT E.NombreEst, D.NombreDistrito, T.NombreTaller
FROM ESTUDIANTES E
INNER JOIN DISTRITOS D ON E.IDDistrito = D.IDDistrito
LEFT JOIN INSCRIPCIONES I ON E.IDEstudiante = I.IDEstudiante
LEFT JOIN TALLERES T ON I.IDTaller = T.IDTaller


use Talleres
-- Consultas Sub Consultas
-- Consulta 1
SELECT NombreTaller, Costo
FROM TALLERES
WHERE Costo > (SELECT AVG(Costo) FROM TALLERES)

-- Consulta 2
SELECT NombreEst
FROM ESTUDIANTES
WHERE IDEstudiante IN (
    SELECT I.IDEstudiante
    FROM INSCRIPCIONES I
    INNER JOIN TALLERES T ON I.IDTaller = T.IDTaller
    INNER JOIN PROFESORES P ON T.IDProfesor = P.IDProfesor
    WHERE P.EspecializacionProf = 'Matemática'
)

-- Consulta 3
SELECT NombreTaller,
    (SELECT STRING_AGG(CONCAT(NombreEst, ' ', ApellidoEst), ', ')
    FROM ESTUDIANTES E
    WHERE E.IDEstudiante IN (SELECT IDEstudiante FROM INSCRIPCIONES I WHERE I.IDTaller = T.IDTaller)) AS EstudiantesInscritos
FROM TALLERES T

-- Consulta 4
SELECT NombreTaller
FROM TALLERES
WHERE IDTaller IN (
    SELECT I.IDTaller
    FROM INSCRIPCIONES I
    GROUP BY I.IDTaller
    HAVING COUNT(*) = (SELECT CupoMaximo FROM TALLERES WHERE IDTaller = I.IDTaller)
)


-- Consulta 5
SELECT T.NombreTaller,
    (SELECT STRING_AGG(CONCAT(E.NombreEst, ' ', E.ApellidoEst), ', ')
    FROM INSCRIPCIONES I
    INNER JOIN ESTUDIANTES E ON I.IDEstudiante = E.IDEstudiante
    WHERE I.IDTaller = T.IDTaller AND I.IDInscripciones IN (
        SELECT IDInscripciones
        FROM MATRICULA
        WHERE MontoPagado > (SELECT AVG(MontoPagado) FROM MATRICULA)
    )) AS EstudiantesConMontoSuperior
FROM TALLERES T


