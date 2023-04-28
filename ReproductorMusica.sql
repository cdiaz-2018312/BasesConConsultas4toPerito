create database spotifake;
use spotifake;

create table genero (id_genero integer not null,
nombre varchar(20),
primary key (id_genero));

insert into genero (id_genero,nombre) VALUES
("1","Rock"),
("2","Pop"),
("3","micro-pop"),
("4","Trap ingles"),
("5","Rap");

create table artista (id_artista integer not null,
nombre varchar(20),
apellido VArchar(20),
cantidad_albums Integer,
primary key (id_artista));

insert into artista(id_artista,nombre,apellido,cantidad_albums)VAlues
("1","Carlos","Lázaro","3"),
("2","Joseph","Dun","7"),
("3","Tyler","Josh","7"),
("4","Melissa","Díaz","11"),
("5","Jorge","Santana","9");

create table album(id_album integer not null,
nombre varchar(20),
cant_canciones integer,
id_artista integer,
primary key (id_album));

insert into album(id_album,nombre,cant_canciones,id_artista)VAlues
("1","Gucci","21","1"),
("2","For her","11","2"),
("3","ScaledandIcy","9","3"),
("4","Única","5","4"),
("5","tres capos","15","5");

create table sencillo(id_sencillo integer not null,
nombre varchar(20),
duracion float,
id_album integer,
foreign key  (id_album) REferences album(id_album),
primary key (id_sencillo));

insert into sencillo(id_sencillo,nombre,duracion,id_album)VAlues
("1","TheOutside","2.04","1"),("6","No chances","2.42","3"),
("2","Riders","4.09","1"),("7","Chill","4.56","4"),
("3","CounterFlyes","3.06","2"),("8","DuckCrazy","3.11","4"),
("4","rellyMiler","6.54","2"),("9","cantFly","3.06","5"),
("5","Modesto","3.15","3"),("10","sin fallo","1.56","5");

create table asig_SencilloGenero(id_asigSencilloGenero integer not null,
id_sencillo integer,
id_genero integer,
primary key (id_asigSencilloGenero),
foreign key (id_sencillo)REFERENCES sencillo(id_sencillo),
foreign key (id_genero) REFERENCES genero (id_genero));

insert into asig_SencilloGenero(id_asigSencilloGenero,id_sencillo,id_genero) VALUES
("1","1","1"),
("2","2","2"),
("3","3","3"),
("4","4","4"),
("5","5","5");

create table Asig_AlbumGenero(id_asigAlbumGenero integer not null,
id_album integer,
id_genero integer,
foreign key (id_genero) REFERENCES genero(id_genero),
foreign key (id_album)REFERENCES album(id_album),
Primary key (id_asigALbumGenero));

insert into Asig_AlbumGenero(id_asigAlbumGenero,id_album,id_genero) Values
("1","1","1"),("2","3","2"),
("3","1","4"),("4","4","1"),
("5","2","2"),("6","4","4"),
("7","2","3"),("8","5","5"),
("9","3","1"),("10","5","4");

create table pais(id_pais integer not null,
nombre varchar(20),
Primary key (id_pais));
insert into pais(id_pais,nombre)VALUES
("1","Guatemala"),
("2","Honduras"),
("3","NOruega"),
("4","USA"),
("5","Mexico"),
("6","Argentina"),
("7","España"),
("8","INglaterra"),
("9","Escocia"),
("10","Alemania");

Create table Usuario(id_usuario integer Not null,
nombre varchar(20),
apellido varchar(20),
fecha_nac date,
id_pais integer,
foreign key (id_pais) REferences pais(id_pais),
Primary key (id_usuario));

insert into usuario(id_usuario,nombre,apellido,fecha_nac,id_pais) VALUES
("1","Samuel","Gonzales",'2001-03-27',"3"),
("2","ROdrigo","Stamp",'1999-07-11',"6"),
("3","Julie","worth",'1992-01-30',"9"),
("4","Sol","Amounts",'1996-11-17',"2"),
("5","Ronnie","Garza",'2005-09-23',"1");
create table Lista_rep(id_ListaRep integer not null,
id_usuario integer not null,
id_sencillo integer not null,
veces_escuchada integer,
foreign key (id_usuario) REferences usuario (id_usuario),
foreign key (id_sencillo) REFERENCES sencillo(id_sencillo));
INsert into Lista_rep(id_ListaRep,id_usuario,id_sencillo,Veces_escuchada)VALUES
("1","1","3","122"),("2","1","1","112"),("3","1","5","234"),
("4","2","2","98"),("5","2","4","42"),("6","2","1","111"),
("7","3","1","73"),("8","3","2","52"),("9","3","4","153"),
("10","4","4","114"),("11","4","3","56"),("12","4","2","251"),
("13","5","5","212"),("14","5","1","162"),("15","5","2","98");

create table Planes(id_plan integer not null,
nombre varchar(20),
precio varchar(15),
duracion varchar(20),
Primary key (id_plan));

Insert into planes(id_plan,nombre,duracion,precio) VAlues
("1","Diamond","12 meses","8 dolares"),
("2","Gold","8 meses","6 dolares"),
("3","Silver","4 meses","3 dolares");

create table formas_pago(id_formasPago integer not null,
nombre varchar(20),
primary key (id_formasPago));

insert into formas_pago(id_FormasPago,nombre) VALUES
("1","TarjetaDebito"), 
("2","TarjetaCredito"), 
("3","bitCoin"),
("4","cheque");

create table Asig_cuentas (id_asigCuentas integer not null,
id_usuario integer,
id_plan integer,
id_FormasPago integer,
Primary key (id_asigCuentas),
Foreign key (id_usuario) REFERENCES Usuario(id_usuario),
Foreign key (id_plan) REFERENCES planes (id_plan),
foreign key (id_formasPago)REFERENCES formas_pago(id_formasPago));
Insert into Asig_cuentas(id_asigCuentas,id_usuario,id_plan,id_FormasPago) VAlues
("1","1","3","1"),
("2","2","2","2"),
("3","3","1","2"),
("4","4","1","4"),
("5","5","2","3");







