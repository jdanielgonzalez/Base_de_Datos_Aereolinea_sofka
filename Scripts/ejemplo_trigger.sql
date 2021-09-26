create database Ejemplo_trigger;

use Ejemplo_trigger;

create table persona(
id_persona varchar(255) not null,
nombre varchar(255) not null,
apellido varchar(255) not null,
fecha_nacimiento date,
edad int,
esMayor boolean,
primary key (id_persona)
);

DELIMITER |
create trigger trigger_calculo_edad before insert on persona
for each row begin
	set new.edad = (select timestampdiff(year, new.fecha_nacimiento, curdate()));
    set new.esMayor = if(new.edad>=18, true, false);
end |
DELIMITER |

insert into persona(id_persona,nombre,apellido,fecha_nacimiento) values('1216716509','Daniel','Gonzalez','1994-09-02');
insert into persona (id_persona,nombre,apellido,fecha_nacimiento) values('32140998','Diana','Gonzalez','1978-06-12');
insert into persona (id_persona,nombre,apellido,fecha_nacimiento) values('1113660412','Andrea','Chaux','1993-01-27');
insert into persona (id_persona,nombre,apellido,fecha_nacimiento) values('1000548280','Michel','Salas','2000-11-03');
insert into persona (id_persona,nombre,apellido,fecha_nacimiento) values('1216716510','Chillin','Gonzalez','2005-09-02');

select * from persona;
