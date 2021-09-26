create database JuanDanielGonzalez_Aereolinea_10092021;

use JuanDanielGonzalez_Aereolinea_10092021;

create table roles(
	id_rol varchar(50) not null,
    rol varchar(50) not null,
    primary key (id_rol)
);

create table persona(
	id_persona varchar(50) not null,
	primer_nombre varchar(255) not null,
	primer_apellido varchar(255) not null,
    fecha_nacimiento date not null,
    salario int not null,
    tipo_viajero varchar(255) not null,
    millas int not null,
    esCliente boolean not null,
	esEmpleado boolean not null,
    id_rol varchar(50),
    primary key (id_persona),
    constraint fk_persona_rol
	foreign key(id_rol) 
    references roles(id_rol)
    on delete no action
    on update cascade
);

create table telefono(
	id_persona varchar(50) not null,
    numero varchar(50) not null,
    primary key (id_persona,numero),
    constraint fk_telefono_persona
    foreign key (id_persona) 
    references persona(id_persona)
    on delete no action
    on update cascade
);

create table correo(
	id_persona varchar(50) not null,
    email varchar(50) not null,
    primary key (id_persona,email),
    constraint fk_correo_persona
    foreign key (id_persona) 
    references persona(id_persona)
    on delete no action
    on update cascade
);

create table check_in(
	id_persona varchar(50) not null,
    modulo varchar(50) not null,
	primary key (id_persona),
    constraint fk_check_in_persona
    foreign key (id_persona) 
    references persona(id_persona)
    on delete no action
    on update cascade
);

create table venta(
	id_persona varchar(50) not null,
    area varchar(50) not null,
	primary key (id_persona),
    constraint fk_venta_persona
    foreign key (id_persona) 
    references persona(id_persona)
    on delete no action
    on update cascade
);

create table transporte(
	id_persona varchar(50) not null,
    rango varchar(50) not null,
	primary key (id_persona),
    constraint fk_transporte_persona
    foreign key (id_persona) 
    references persona(id_persona)
    on delete no action
    on update cascade
);

create table tiquete(
	id_persona varchar(50) not null,
	id_tiquete varchar(50) not null,
    numero_asiento int not null,
    letra_asiento varchar(20) not null,
    fecha_salida date not null,
    fecha_llegada date not null,
    primary key (id_tiquete),
    constraint fk_tiquete_persona
    foreign key (id_persona) references persona(id_persona)
	on delete no action
    on update cascade
);

create table equipaje(
	id_tiquete varchar(50) not null,    
	id_equipaje varchar(50) not null,
    peso float(6,2) not null,
    primary key (id_tiquete,id_equipaje),
    constraint fk_equipaje_tiquete
    foreign key (id_tiquete) 
    references tiquete(id_tiquete)
);

create table vehiculo(
	id_vehiculo varchar(50) not null,
    capacidad_pasajeros int not null,
    primary key (id_vehiculo)
);

create table manejar(
	id_vehiculo varchar(50) not null,
	id_persona varchar(50) not null,
    fecha_conduccion date not null,
    hora_inicio time not null,
    hora_fin time not null,
    primary key (id_vehiculo,id_persona,fecha_conduccion),
    constraint fk_manejar_persona
    foreign key (id_persona) 
    references persona(id_persona)
    on delete no action
    on update cascade,
    constraint fk_manejar_vehiculo
	foreign key (id_vehiculo) 
    references vehiculo(id_vehiculo)
    on delete no action
    on update cascade
);

create table bus(
	id_vehiculo varchar(50) not null,
    ruta varchar(50) not null,
    primary key (id_vehiculo),
    constraint fk_bus_vehiculo
    foreign key (id_vehiculo) 
    references vehiculo(id_vehiculo)
    on delete no action
    on update cascade
);

create table avion(
	id_vehiculo varchar(50) not null,
	modelo varchar(50) not null,
    primary key (id_vehiculo),
    constraint fk_avion_vehiculo
    foreign key (id_vehiculo) 
    references vehiculo(id_vehiculo)
    on delete no action
    on update cascade
);

create table vuelo(
	id_vuelo int not null,
    lugar_despegue varchar(255) not null,
	lugar_aterrizaje varchar(255) not null,
	hora_salida time not null,
    hora_llegada time,
    tiempo_vuelo time not null,
    tarifa int not null,
    primary key (id_vuelo)
); 

create table pertenecer(
	id_vuelo int not null,
    id_tiquete varchar(50) not null,
    id_vehiculo varchar(50) not null,
    primary key (id_vuelo,id_tiquete),
    constraint fk_pertenecer_vuelo
    foreign key (id_vuelo) 
    references vuelo(id_vuelo)
    on delete no action
    on update cascade,
    constraint fk_pertenecer_tiquete
	foreign key (id_tiquete) 
    references tiquete(id_tiquete)
    on delete no action
    on update cascade
);

/* LLenado de tablas*/

/* tabla roles*/
insert into roles values('1','cliente');
insert into roles values('2','piloto');
insert into roles values('3','conductor de bus');
insert into roles values('4','agente call center');
insert into roles values('5','vendedor de oficina');
insert into roles values('6','part time');
insert into roles values('7','full time');

/* LLenado persona que son solo clientes*/
insert into persona values('1216716509','Daniel','Gonzalez','1994-09-02',0,'frecuente',1250,true,false,'1');
insert into persona values('78386916','Milagros','Miranda','1998-02-03',0,'silver',3500,true,false,'1');
insert into persona values('1127060731','Enrique','Betancur','1986-06-13',0,'gold',5400,true,false,'1');
insert into persona values('1216742508','Mariano','Lozano','1968-01-11',0,'frecuente',1200,true,false,'1');
insert into persona values('3214998','Graciela','Palma','1978-05-22',0,'frecuente',700,true,false,'1');
insert into persona values('1021179209','Ines','Colomer','1965-12-28',0,'gold',6700,true,false,'1');
insert into persona values('87029194','Matero','Sanchez','1997-03-28',0,'silver',3650,true,false,'1');
insert into persona values('1181727924','Chalsie','Speers','1995-11-23',0,'silver',3030,true,false,'1');
insert into persona values('1009981155','Latif','Defilippo','1996-02-01',0,'frecuente',500,true,false,'1');
insert into persona values('1139286828','Tancredo','Clemens','1987-03-10',0,'frecuente',340,true,false,'1');

/* LLenado persona que son clientes y empelados*/
/*empleados en el area de transporte*/
insert into persona values('1122321995','Caridad','Santa','1966-10-14',5000000,'beneficio',15400,true,true,'2');
insert into persona values('1150887907','Elgar','Oliveros','1966-07-28',5000000,'beneficio',13500,true,true,'2');
insert into persona values('1034060363','Eva','Sueiro','1966-06-09',1800000,'beneficio',2350,true,true,'3');
insert into persona values('1287168467','Nitzia','Joli','1980-08-16',1800000,'beneficio',3320,true,true,'3');
/*empleados en el area de ventas*/
insert into persona values('1004689738','Celina','Vinayo','1972-09-23',2300000,'beneficio',7540,true,true,'4');
insert into persona values('1228272142','Antonella','Gago','1981-03-18',2300000,'beneficio',1000,true,true,'5');
insert into persona values('1235087893','Ivonne','Porras','1971-05-21',2300000,'beneficio',1500,true,true,'5');
/*empleados en el area de check_in*/
insert into persona values('1094846456','Chalsie','Speers','1982-12-08',1000000,'beneficio',6400,true,true,'6');
insert into persona values('1284174506','Harlan','James','1996-05-13',1000000,'beneficio',300,true,true,'6');
insert into persona values('1030728332','Arjun','James','1981-01-01',2000000,'beneficio',2400,true,true,'7');


/*llenado telefono*/
insert into telefono values('1216716509','3109555226');
insert into telefono values('78386916','3488449742');
insert into telefono values('1127060731','3386143224');
insert into telefono values('1216742508','3202067910');
insert into telefono values('3214998','3314001486');
insert into telefono values('1021179209','3410007918');
insert into telefono values('87029194','3448236590');
insert into telefono values('1181727924','3296435193');
insert into telefono values('1009981155','3070646141');
insert into telefono values('1139286828','3204376721');
insert into telefono values('1216716509','3004182160');
insert into telefono values('87029194','3002131043');
insert into telefono values('1181727924','3294046153');
insert into telefono values('1009981155','3113705528');
insert into telefono values('1139286828','3251531040');
insert into telefono values('1122321995','3082895501');
insert into telefono values('1150887907','3110647933');
insert into telefono values('1034060363','3233210026');
insert into telefono values('1287168467','3222682276');
insert into telefono values('1004689738','3354084292');
insert into telefono values('1228272142','3068402102');
insert into telefono values('1235087893','3163806619');
insert into telefono values('1094846456','3027440062');
insert into telefono values('1284174506','3367577818');
insert into telefono values('1030728332','3315436808');
insert into telefono values('1122321995','3470317717');
insert into telefono values('1094846456','3199100448');
insert into telefono values('1284174506','3187646459');
insert into telefono values('1030728332','3419964581');

/*llenado tabla correos*/
insert into correo values('1216716509','Daniel.Gonzalez@gmail.com');
insert into correo values('78386916','Milagros.Miranda@gmail.com');
insert into correo values('1127060731','Enrique.Betancur@gmail.com');
insert into correo values('1216742508','Mariano.Lozano@gmail.com');
insert into correo values('3214998','Graciela.Palma@gmail.com');
insert into correo values('1021179209','Ines.Colomer@gmail.com');
insert into correo values('87029194','Matero.Sanchez@gmail.com');
insert into correo values('1181727924','Chalsie.Speers@gmail.com');
insert into correo values('1009981155','Latif.Defilippo@gmail.com');
insert into correo values('1139286828','Tancredo.Clemens@gmail.com');
insert into correo values('1122321995','Caridad.Santa@gmail.com');
insert into correo values('1150887907','Elgar.Oliveros@gmail.com');
insert into correo values('1034060363','Eva.Sueiro@gmail.com');
insert into correo values('1287168467','Nitzia.Joli@gmail.com');
insert into correo values('1004689738','Celina.Vinayo@gmail.com');
insert into correo values('1228272142','Antonella.Gago@gmail.com');
insert into correo values('1235087893','Ivonne.Porras@gmail.com');
insert into correo values('1094846456','Chalsie.Speers@gmail.com');
insert into correo values('1284174506','Harlan.James@gmail.com');
insert into correo values('1030728332','Arjun.James@gmail.com');
insert into correo values('1122321995','Caridad.Santa@aereolinea.com');
insert into correo values('1150887907','Elgar.Oliveros@aereolinea.com');
insert into correo values('1034060363','Eva.Sueiro@aereolinea.com');
insert into correo values('1287168467','Nitzia.Joli@aereolinea.com');
insert into correo values('1004689738','Celina.Vinayo@aereolinea.com');
insert into correo values('1228272142','Antonella.Gago@aereolinea.com');
insert into correo values('1235087893','Ivonne.Porras@aereolinea.com');
insert into correo values('1094846456','Chalsie.Speers@aereolinea.com');
insert into correo values('1284174506','Harlan.James@aereolinea.com');
insert into correo values('1030728332','Arjun.James@aereolinea.com');

/*llenar check_in*/
insert into check_in values('1094846456','counter');
insert into check_in values('1284174506','counter');
insert into check_in values('1030728332','sala');

/* llenar venta*/
insert into venta values('1004689738','telemercadeo');
insert into venta values('1228272142','ventas');
insert into venta values('1235087893','ventas');

/*llenar tranporte*/
insert into transporte values('1122321995','capitan');
insert into transporte values('1150887907','copiloto');
insert into transporte values('1034060363','corductor');
insert into transporte values('1287168467','aux');

/* llenar vuelo*/
insert into vuelo values(1,'rio negro','cali','06:00:00','07:30:00','01:30:00',106000);
insert into vuelo values(2,'rio negro','cali','13:00:00','14:30:00','01:30:00',106000);
insert into vuelo values(3,'rio negro','cali','17:00:00','18:30:00','01:30:00',106000);
insert into vuelo values(4,'rio negro','pasto','06:00:00','07:45:00','01:45:00',218000);
insert into vuelo values(5,'rio negro','pasto','13:00:00','14:45:00','01:45:00',218000);
insert into vuelo values(6,'rio negro','pasto','17:00:00','18:45:00','01:45:00',218000);
insert into vuelo values(7,'rio negro','barranquilla','13:00:00','15:00:00','02:00:00',144200);
insert into vuelo values(8,'rio negro','santa marta','06:00:00','07:45:00','01:45:00',135000);
insert into vuelo values(9,'rio negro','santa marta','13:00:00','14:45:00','01:45:00',135000);
insert into vuelo values(10,'rio negro','cartagena','13:00:00','14:45:00','01:45:00',223000);
insert into vuelo values(11,'rio negro','cartagena','17:00:00','18:45:00','01:45:00',223000);
insert into vuelo values(12,'rio negro','san andres','06:00:00','08:00:00','02:00:00',160000);
insert into vuelo values(13,'rio negro','san andres','13:00:00','15:00:00','02:00:00',160000);
insert into vuelo values(14,'rio negro','san andres','17:00:00','19:00:00','02:00:00',160000);
insert into vuelo values(15,'rio negro','cucuta','14:00:00','15:00:00','01:00:00',134000);
insert into vuelo values(16,'rio negro','cucuta','15:00:00','17:00:00','02:00:00',134000);
insert into vuelo values(17,'rio negro','riohacha','09:00:00','10:30:00','01:30:00',265400);
insert into vuelo values(18,'rio negro','riohacha','18:00:00','19:30:00','01:30:00',265400);
insert into vuelo values(19,'rio negro','leticia','06:00:00','08:00:00','02:00:00',190850);
insert into vuelo values(20,'rio negro','leticia','13:00:00','15:00:00','02:00:00',190850);
insert into vuelo values(21,'rio negro','leticia','17:00:00','19:00:00','02:00:00',190850);
insert into vuelo values(22,'rio negro','bucaramanga','06:00:00','07:45:00','01:45:00',264500);
insert into vuelo values(23,'rio negro','bucaramanga','13:00:00','14:45:00','01:45:00',264500);
insert into vuelo values(24,'rio negro','bucaramanga','17:00:00','18:45:00','01:45:00',264500);
insert into vuelo values(25,'rio negro','valledupar','06:00:00','07:30:00','01:30:00',158500);
insert into vuelo values(26,'rio negro','valledupar','13:00:00','14:30:00','01:30:00',158500);
insert into vuelo values(27,'rio negro','valledupar','17:00:00','18:30:00','01:30:00',158500);
insert into vuelo values(28,'rio negro','monteria','06:00:00','07:30:00','01:30:00',255000);
insert into vuelo values(29,'rio negro','monteria','13:00:00','14:30:00','01:30:00',255000);
insert into vuelo values(30,'rio negro','monteria','17:00:00','18:30:00','01:30:00',255000);

/* llenar tiquete */
insert into tiquete values('1216716509','V7dRW',6,'a','2020-10-08','2020-10-08');
insert into tiquete values('78386916','2NKzE',20,'d','2020-06-04','2020-06-04');
insert into tiquete values('1127060731','QrwzR',8,'f','2021-04-13','2021-04-13');
insert into tiquete values('1216742508','Gk3HM',20,'c','2021-08-23','2021-08-23');
insert into tiquete values('3214998','hbF7X',7,'a','2022-08-01','2022-08-01');
insert into tiquete values('1021179209','UPMeR',11,'e','2020-08-12','2020-08-12');
insert into tiquete values('87029194','3zzJT',17,'e','2020-03-19','2020-03-19');
insert into tiquete values('1181727924','HSfyj',8,'b','2020-05-11','2020-05-11');
insert into tiquete values('1009981155','RfKQd',14,'d','2022-05-04','2022-05-04');
insert into tiquete values('1139286828','WNJMd',10,'b','2021-07-21','2021-07-21');
insert into tiquete values('1216716509','HGALJ',15,'a','2022-12-12','2022-12-12');
insert into tiquete values('78386916','LYWRR',20,'d','2022-12-17','2022-12-17');
insert into tiquete values('1127060731','WNWF2',18,'e','2020-06-17','2020-06-17');
insert into tiquete values('1216742508','SW5BJ',6,'f','2021-12-06','2021-12-06');
insert into tiquete values('3214998','YYYDP',4,'b','2020-11-13','2020-11-13');

/*llenar equipaje*/
insert into equipaje values('V7dRW','equip1',10.14);
insert into equipaje values('V7dRW','equip2',16.18);
insert into equipaje values('2NKzE','equip1',23.09);
insert into equipaje values('2NKzE','equip2',20.94);
insert into equipaje values('2NKzE','equip3',15.63);
insert into equipaje values('QrwzR','equip1',16.79);
insert into equipaje values('QrwzR','equip2',15.75);
insert into equipaje values('Gk3HM','equip1',14.41);
insert into equipaje values('hbF7X','equip1',10.69);
insert into equipaje values('UPMeR','equip1',21.87);
insert into equipaje values('3zzJT','equip1',17.52);
insert into equipaje values('HSfyj','equip1',18.42);
insert into equipaje values('RfKQd','equip1',22.69);
insert into equipaje values('WNJMd','equip1',20.35);
insert into equipaje values('HGALJ','equip1',20.65);
insert into equipaje values('HGALJ','equip2',14.48);
insert into equipaje values('HGALJ','equip3',11.56);
insert into equipaje values('LYWRR','equip1',14.27);
insert into equipaje values('WNWF2','equip1',10.26);
insert into equipaje values('WNWF2','equip2',17.28);
insert into equipaje values('SW5BJ','equip1',19.2);
insert into equipaje values('YYYDP','equip1',14.78);
insert into equipaje values('YYYDP','equip2',22.98);
insert into equipaje values('YYYDP','equip3',18.1);

/*llenar vehiculo*/
insert into vehiculo values('ZRZ873',20);
insert into vehiculo values('KNH280',20);
insert into vehiculo values('AVL549',20);
insert into vehiculo values('HGR815',20);
insert into vehiculo values('JZW479',20);
insert into vehiculo values('FQX970',30);
insert into vehiculo values('BDD801',30);
insert into vehiculo values('DVE912',30);
insert into vehiculo values('MUC854',30);
insert into vehiculo values('HGP468',30);
insert into vehiculo values('HK634',250);
insert into vehiculo values('HK519',250);
insert into vehiculo values('HK585',230);
insert into vehiculo values('HK536',230);
insert into vehiculo values('HK614',210);
insert into vehiculo values('HK671',210);
insert into vehiculo values('HK524',190);
insert into vehiculo values('HK651',190);
insert into vehiculo values('HK619',180);
insert into vehiculo values('HK658',180);

/* llenar manejar*/
insert into manejar values('ZRZ873','1034060363','2020-05-22','11:48:26','20:54:26');
insert into manejar values('KNH280','1287168467','2021-12-02','13:18:31','20:16:45');
insert into manejar values('AVL549','1034060363','2020-05-11','11:33:34','21:49:18');
insert into manejar values('HGR815','1287168467','2020-05-02','11:41:22','20:36:46');
insert into manejar values('JZW479','1034060363','2021-11-06','11:44:11','20:22:25');
insert into manejar values('FQX970','1287168467','2020-01-29','11:03:42','21:53:27');
insert into manejar values('BDD801','1034060363','2021-12-08','11:21:56','20:44:54');
insert into manejar values('DVE912','1287168467','2020-09-08','13:05:49','20:47:04');
insert into manejar values('MUC854','1034060363','2021-01-09','11:35:56','21:14:01');
insert into manejar values('HGP468','1287168467','2020-02-14','14:47:38','21:38:51');
insert into manejar values('HK634','1122321995','2021-05-24','11:51:31','20:05:38');
insert into manejar values('HK519','1150887907','2021-09-23','13:04:56','21:26:56');
insert into manejar values('HK585','1122321995','2020-03-12','11:11:52','21:12:04');
insert into manejar values('HK536','1150887907','2021-07-10','12:48:34','21:59:42');
insert into manejar values('HK614','1122321995','2020-10-02','13:25:57','20:15:20');
insert into manejar values('HK671','1150887907','2020-01-31','14:25:15','20:35:35');
insert into manejar values('HK524','1122321995','2020-08-29','14:57:50','21:04:38');
insert into manejar values('HK651','1150887907','2021-07-31','13:26:54','20:15:21');
insert into manejar values('HK619','1122321995','2020-01-17','14:38:35','20:32:47');
insert into manejar values('HK658','1150887907','2020-09-06','14:44:40','20:16:22');

/*llenar bus*/
insert into bus values('ZRZ873','RT1');
insert into bus values('KNH280','RT2');
insert into bus values('AVL549','RT3');
insert into bus values('HGR815','RT4');
insert into bus values('JZW479','RT5');
insert into bus values('FQX970','RT6');
insert into bus values('BDD801','RT7');
insert into bus values('DVE912','RT8');
insert into bus values('MUC854','RT9');
insert into bus values('HGP468','RT10');

/*llenar avion*/
insert into avion values('HK634','A330');
insert into avion values('HK519','A330');
insert into avion values('HK585','A321');
insert into avion values('HK536','A321');
insert into avion values('HK614','A320');
insert into avion values('HK671','A320');
insert into avion values('HK524','A319');
insert into avion values('HK651','A319');
insert into avion values('HK619','ATR-72');
insert into avion values('HK658','ATR-72');

/*llenar pertenecer*/
insert into pertenecer values(1,'V7dRW','HK519');
insert into pertenecer values(1,'2NKzE','HK519');
insert into pertenecer values(1,'QrwzR','HK519');
insert into pertenecer values(2,'Gk3HM','HK634');
insert into pertenecer values(2,'hbF7X','HK634');
insert into pertenecer values(2,'UPMeR','HK634');
insert into pertenecer values(3,'3zzJT','HK524');
insert into pertenecer values(3,'HSfyj','HK524');
insert into pertenecer values(3,'RfKQd','HK524');
insert into pertenecer values(4,'WNJMd','HK651');
insert into pertenecer values(4,'HGALJ','HK651');
insert into pertenecer values(4,'LYWRR','HK651');
insert into pertenecer values(5,'WNWF2','HK619');
insert into pertenecer values(5,'SW5BJ','HK619');
insert into pertenecer values(5,'YYYDP','HK619');

/*Vistas*/
/* vista de todas las personas*/
create or replace view vista_personas as 
	select
		p.id_persona as 'Identificacion',
		p.primer_nombre as 'nombre',
		p.primer_apellido as 'Apellido',
        p.fecha_nacimiento as 'Fecha de nacimiento',
        r.rol as 'rol'
	from persona p
	inner join
		roles r on r.id_rol = p.id_rol
;

/* vista de los telefonos y correos*/
create or replace view vista_personas_tel_correo as 
select
		p.primer_nombre as 'nombre',
		p.primer_apellido as 'Apellido',
        tel.numero as 'numero',
        corr.email as 'Correo'
	from persona p
	inner join
		telefono tel on tel.id_persona = p.id_persona
	inner join
		correo corr on corr.id_persona = p.id_persona
;

/* vista de los telefonos y correos empleados*/
create or replace view vista_empleado_tel_correo as 
select
		p.primer_nombre as 'nombre',
		p.primer_apellido as 'Apellido',
        tel.numero as 'numero',
        corr.email as 'Correo'
	from persona p 
	inner join
		telefono tel on tel.id_persona = p.id_persona
	inner join
		correo corr on corr.id_persona = p.id_persona
	where p.esEmpleado=1
;

/* vista de los telefonos y correos clientes*/
create or replace view vista_cliente_tel_correo as 
select
		p.primer_nombre as 'nombre',
		p.primer_apellido as 'Apellido',
        tel.numero as 'numero',
        corr.email as 'Correo'
	from persona p 
	inner join
		telefono tel on tel.id_persona = p.id_persona
	inner join
		correo corr on corr.id_persona = p.id_persona
	where p.esEmpleado=0
;

/* vista de los empelados que trabajan en transporte*/
create or replace view vista_transporte as 
select
		p.primer_nombre as 'nombre',
		p.primer_apellido as 'Apellido',
        r.rol as 'Rol',
        p.salario as 'Sueldo'
	from persona p 
	inner join
		roles r on r.id_rol=p.id_rol
	where r.id_rol=2 or r.id_rol=3
;

/* vista de los empelados que trabajan en ventas*/
create or replace view vista_venta as 
select
		p.primer_nombre as 'nombre',
		p.primer_apellido as 'Apellido',
        r.rol as 'Rol',
		p.salario as 'Sueldo'
	from persona p 
	inner join
		roles r on r.id_rol=p.id_rol
	where r.id_rol=4 or r.id_rol=5
;


/* vista de los empelados que trabajan en ventas*/
create or replace view vista_check_in as 
select
		p.primer_nombre as 'nombre',
		p.primer_apellido as 'Apellido',
        r.rol as 'Rol',
		p.salario as 'Sueldo'
	from persona p 
	inner join
		roles r on r.id_rol=p.id_rol
	where r.id_rol=6 or r.id_rol=7
;

/* vista de las personas que compraron un tiquete*/
create or replace view vista_tiquetes as
select
        t.id_tiquete as 'tiquete',
		p.primer_nombre as 'nombre',
		p.primer_apellido as 'Apellido',
		per.id_vuelo as 'Vuelo',
        t.fecha_salida as 'Fecha salida',
		t.fecha_llegada as 'Fecha llegada',
        v.hora_salida as 'Hora del despegue',
		v.hora_llegada as 'Hora de aterrizaje',
        t.numero_asiento as 'Numero del asiento',
        t.letra_asiento as 'Posicion del asiento'
	from persona p
    inner join
		tiquete t on t.id_persona=p.id_persona
	inner join
		pertenecer per on per.id_tiquete=t.id_tiquete
	inner join
		vuelo v on v.id_vuelo=per.id_vuelo
;

/* vista de todos los vuelos*/
create or replace view vista_vuelos as
select
	v.id_vuelo as 'Vuelo',
    v.lugar_despegue as 'Lugar de despegue',
    v.lugar_aterrizaje as 'Lugar de aterrizaje',
    v.hora_salida as 'Hora despegue',
    v.hora_llegada as 'Hora aterrizaje',
    v.tiempo_vuelo as 'Tiempo de vuelo',
    v.tarifa as 'Tarifa'
    from vuelo v
;

/* vista de los aviones que ha conduccido cada piloto*/
create or replace view vista_conducciones_avion as
select 
	m.id_vehiculo as 'placa vehiculo',
    p.primer_nombre as 'nombre conductor',
    p.primer_apellido as 'Apellido',
    m.fecha_conduccion as 'Fecha de conducccioon',
    trans.rango as 'Rango',
    m.hora_inicio as 'hora inicio',
    m.hora_fin as 'hora_final'
    from manejar m
    inner join
		persona p on p.id_persona=m.id_persona
	inner join
		transporte trans on trans.id_persona=p.id_persona
	where p.id_rol = 2
;

/* vista de los buses que ha conduccido cada chofer*/
create or replace view vista_conducciones_bus as
select 
	m.id_vehiculo as 'placa vehiculo',
    p.primer_nombre as 'nombre conductor',
    p.primer_apellido as 'Apellido',
    m.fecha_conduccion as 'Fecha de conducccioon',
    trans.rango as 'Rango',
    m.hora_inicio as 'hora inicio',
    m.hora_fin as 'hora_final'
    from manejar m
    inner join
		persona p on p.id_persona=m.id_persona
	inner join
		transporte trans on trans.id_persona=p.id_persona
	where p.id_rol = 3
;

create or replace view vista_equipaje as
select
        t.id_tiquete as 'tiquete',
		p.primer_nombre as 'nombre',
		p.primer_apellido as 'Apellido',
        e.id_equipaje as 'Equipaje',
        e.peso as 'Peso'
	from persona p
    inner join
		tiquete t on t.id_persona=p.id_persona
	inner join
		equipaje e on e.id_tiquete = t.id_tiquete
;

/*Procedimientos Almacenados*/
DELIMITER $$
create procedure  sp_contar_equipaje(id_persona varchar(50))
begin
    select 
		p.primer_nombre as 'nombre',
		p.primer_apellido as 'Apellido',
        count(*) as 'Numero de maletas'
    from persona p
    inner join
		tiquete t on t.id_persona=p.id_persona
	inner join
		equipaje e on e.id_tiquete = t.id_tiquete
	where p.id_persona=id_persona
;
end
$$
DELIMITER ;

DELIMITER $$
create procedure  sp_contar_pasajeros(id_vuelo int)
begin
    select
		p.id_vuelo as 'Vuelo',
        count(*) as 'Numero de pasajeros'
	from pertenecer p
    where p.id_vuelo=id_vuelo
;
end
$$
DELIMITER ;

DELIMITER $$
create procedure  sp_crear_nuevo_cliente(id_persona varchar(50) ,
					primer_nombre varchar(255),
					primer_apellido varchar(255),
					fecha_nacimiento date,
					tipo_viajero varchar(255),
					millas int)
	
begin
    insert into persona values(id_persona,primer_nombre,primer_apellido,fecha_nacimiento,0,tipo_viajero,millas,true,false,'1');
    select * from persona p where p.id_persona=id_persona;
end
$$
DELIMITER ;