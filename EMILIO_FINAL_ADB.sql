create database Orfanato_2
use Orfanato_2
go
--TABLA HUERFANO---
Create table huerfano
(id_huer int,
codigo_diagnostico varchar (15),
codigo_huerfano int,
codigo_habitacion int,
nombre varchar (15),
apellido varchar (15),
fecha_de_nacimiento date,
f_llegada date,
nacionalidad varchar (20),
edad int,
razon varchar (50), 
primary key (id_huer)
);
drop table huerfano

insert into huerfano values
(1,8001,1001,2001,'Luis','Velez','2003-10-13','2004-11-10','Venezolano',17,'Perdido en el Pa�s'),
(2,8002,1002,2002,'Ronald','Quiroz','2004-11-13','2005-12-14','Ecuatoriano',16,'Fallecieron sus padres'),
(3,8003,1003,2003,'Jennifer','Mero','2005-09-13','2010-12-13','Ecuatoriana',15,'Sin familiares');



select * from huerfano
use Orfanato_2

--TABLA ADOPCION--
Create table adopcion
(cedula_representante varchar (15),
 codigo_huerfano int,
 codigo_adopcion varchar (15),
fecha_de_adopcion date,
descripcion_adopcion varchar (50),
adoptado varchar (50),
primary key (codigo_adopcion) 
);

insert into adopcion values
('1351447071',1001,'5001','2020-01-10','El ni�o extra�ar� a sus amigos','S�' ),
('1234488921',1002,'5002','2020-11-11','El ni�o est� de acuerdo con su nueva familia','No'),
('1948123453',1003,'5003','2020-05-18','La ni�a est� de acuerdo con su nueva familia','S�');


drop table adopcion
select * from adopcion
use Orfanato_2

--TABLA SEGUIMIENTO--
Create table seguimiento
(id_c int,
codigo_seguimiento varchar (50),
 codigo_empleado varchar (50),
 codigo_adopcion varchar (15),
fecha date,
descripcion_seguimiento varchar (50),
estado_del_hogar varchar (50),
primary key (id_c) 
);

drop table seguimiento

insert into seguimiento values
(1,'3001','4001','5001','2019-12-10','El ni�o se encuentra en buen estado','Buena'),
(2,'3001','4001','5001','2019-12-17','El ni�o se encuentra en buen estado','Buena'),
(3,'3001','4001','5001','2020-01-06','El ni�o se encuentra en buen estado','Buena'),
(4,'3002','4002','5002','2020-10-11','Sin datos','sin datos'),
(5,'3002','4002','5002','2020-10-18','Sin datos','sin datos'),
(6,'3003','4003','5003','2020-04-18','El ni�o se encuentra en buen estado','Buena');



select * from seguimiento
use Orfanato_2


--TABLA EMPLEADO--
Create table empleado
(codigo_empleado varchar (50),
 nombre_empleado varchar (15),
 apellido_empleado varchar (15),
edad int,
primary key (codigo_empleado) 
);

insert into empleado values
('4001','Emilio','Moreira',24),
('4002','Alfonso','Torres',28),
('4003','Denisse','Aspacio',27);

select * from empleado
use Orfanato_2

--TABLA PERSONA-ADOPCION--
Create table persona_adopcion
(cedula varchar (15),
 nombre_representante varchar (15),
 apellido_representante varchar (15),
 antecedentes varchar (50),
 estado_civil varchar (50),
 conyuge_nomb varchar (50),
 conyuge_apell varchar (50),
 ocupacion varchar (50),
 residencia varchar (50),
 salario int,
primary key (cedula) 
);

drop table persona_adopcion

insert into persona_adopcion values
('1269874321','Dante','Cede�o','No posee antecedentes','casado','Julia','Ortiz','Terapeuta','Barrio Jocay',1100),
('1354058382','Alisson','Gomez','No posee antecendentes','casada','Cristian','Ronaldo','Enfermera','Los Esteros',800),
('1324853924','Robert','Velez','No posee antecendentes','casado','Gema','Garc�a','Abogado','Barrio el Paraiso',1000);

select * from persona_adopcion
use Orfanato_2

--TABLA HABITACION--
Create table habitacion
(codigo_habitacion varchar (15),
 habitacion varchar (15),
 cantidad_maxima_huerfanos int,
primary key (codigo_habitacion) 
);

insert into habitacion values
('2001','Masculino',5),
('2002','Masculino',5),
('2003','Femenino',5);

select * from habitacion
use Orfanato_2

--TABLA DISCAPACIDAD--
Create table discapacidad
(id_dis int,
codigo_discapacidad varchar (15),
 codigo_huerfano int,
 codigo_diagnostico varchar (15),
 descripcion_discapacidad varchar (50),
 fecha_revision date,
primary key (id_dis) 
);

insert into discapacidad values
(1,'23001',1001,'8001','Discapacidad sensorial','2019-08-23'),
(4,'23001',1001,'8001','Discapacidad sensorial','2019-08-23'),
(2,'23002',1002,'8002','Ninguna','2019-08-24'),
(3,'23003',1003,'8003','Ninguna','2019-08-26');
drop table discapacidad

select * from discapacidad
use Orfanato_2

--TABLA DIAGNOSTICO--
Create table diagnostico
(id_d int,
codigo_diagnostico varchar (15),
 codigo_doctor varchar (15),
 codigo_huerfano int,
 fecha_diagnostico date,
 receta varchar (50),
primary key (id_d) 
);

insert into diagnostico values
(9001,'8001','53001',1001,'2019-08-29','ciprofloxacina'),
(9004,'8001','53001',1001,'2019-08-29','ciprofloxacina'),
(9006,'8001','53001',1001,'2019-08-29','ciprofloxacina'),
(9002,'8002','53002',1002,'2019-08-30','Vitamina C'),
(9007,'8002','53002',1002,'2019-08-30','Vitamina C'),
(9003,'8003','53003',1003,'2019-08-28','Vitamina C');



drop table diagnostico
select * from diagnostico
use Orfanato_2

--TABLA DOCTOR--
Create table doctor
(codigo_doctor varchar (15),
 nombre varchar (15),
 apellido varchar (15),
 especialidad varchar(50),
primary key (codigo_doctor) 
);

insert into doctor values
(1010,'Marcelo','Cobos','Audiologista'),
(1011,'Ricardo','Calderon','Pediatra '),
(1012,'Josue','Palacios','Neur�logo');

select * from doctor
use Orfanato_2

--Consultas--

--Top de seguimiento por empleado.--

select e.nombre_empleado as [Nombre del Empleado], s.codigo_empleado as [Codigo del Empleado], count (s.codigo_seguimiento) as [Cantidad de Visitas por Empleador] from seguimiento s, empleado e where s.codigo_empleado = e.codigo_empleado 
group by s.codigo_empleado, s.codigo_seguimiento, e.nombre_empleado 

--Top de antiguedad de los huerfanos. (De mayor a menor)--

Select DATEDIFF(YEAR,f_llegada,GETDATE()) as [Tiempo en el orfanato] from huerfano

--Conocer la cantidad de atenciones medicas que ha recibido cada huerfano--

select h.nombre, count (d.codigo_diagnostico) as [Cantidad de Consultas Medicas] from diagnostico d, huerfano h
where d.codigo_diagnostico = h.codigo_diagnostico
group by d.codigo_diagnostico, h.nombre

--Consultar qu� ni�os no han sido adoptados--

select a.adoptado as [Ni�os No Adoptados], h.nombre as [Nombre del Ni�o] from adopcion a, huerfano h where a.codigo_huerfano = h.codigo_huerfano and a.adoptado ='No'
--En caso de consultar por los ni�os que han sido adoptados
select a.adoptado as [Ni�os Adoptados], h.nombre as [Nombre del Ni�o]from adopcion a, huerfano h where a.codigo_huerfano = h.codigo_huerfano and a.adoptado ='S�'
--Total de ni�os no adoptados
select count (a.adoptado) as [No adoptados] from adopcion a where a.adoptado = 'No'
--Total de ni�os adoptados
select count (a.adoptado) as [Si adoptados] from adopcion a where a.adoptado = 'S�'
