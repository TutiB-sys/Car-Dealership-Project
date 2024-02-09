--Create tables

create table _salesperson (
saleperson_id SERIAL primary key,
first_name  VARCHAR(100),
last_name VARCHAR(100),
salary  Numeric(10,2),
commision Numeric(10,2)

);



create table Car_customer(
customer_id SERIAL primary key,
first_name VARCHAR(100),
last_name VARCHAR(100),
address VARCHAR(200),
phone CHAR(20)
);


create table _Car(
carSerialNumber SERIAL primary key,
Model   VARCHAR(100),
Make   VARCHAR(100)

);

create table _mechanic(
mechanic_id SERIAL primary key,
first_name VARCHAR(100),
last_name VARCHAR(100)

);

create table invoice(
invoiceNumber SERIAL primary key,
invoice_date date,
totalAmount Numeric(10,2)

);

 

create table service_history(
service_id SERIAL primary key,
serviceDescription VARCHAR(200),
service_date  date,
carSerialNumber integer not null,
foreign key (carSerialNumber) references _Car(carSerialNumber) 

);

create table service_ticket(
serivceTicket_id SERIAL primary key,
typeOfService VARCHAR(200),
carSerialNumber integer not null,
foreign key(carSerialNumber) references _Car(carSerialNumber)


);


create table parts(
part_id SERIAL primary key,
partName VARCHAR(150),
carSerialNumber integer not null,
foreign key (carSerialNumber) references _Car(carSerialNumber) 

);

drop table parts

--insertion

insert into _salesperson(
saleperson_id,first_name,last_name,salary, commision)
values(1,'Habtom','berhe',10000,500);


insert into _salesperson(saleperson_id,first_name,last_name,salary,commision)
values(2,'Gabtom','Aerhe',15000,800);

select * from _salesperson 

insert into Car_customer(customer_id,first_name,last_name,address,phone)
values(1,'Fili','Mussie','234 e chamberse st , Aurora CO 80012','7205674321');

insert into Car_customer(customer_id,first_name,last_name,address,phone)
values(2,'Abel','Hussie','233 e florida st , Aurora CO 80012','7205634321');


insert into _Car(carSerialNumber,Model,Make )
values(1,'Accord','Honda');

insert into _Car(carSerialNumber,Model,Make )
values(2,'Prius','Toyota');

insert into  _mechanic(mechanic_id,first_name,last_name)
values(1,'Alex','Abraham');

insert into  _mechanic(mechanic_id,first_name,last_name)
values(2,'Alem','Bbran');


insert into invoice(invoiceNumber,invoice_date,totalAmount)
values(1,'2022-02-09',23000);

insert into invoice(invoiceNumber,invoice_date,totalAmount)
values(2,'2021-02-08',32000);


insert into service_history( service_id, serviceDescription, service_date, carSerialNumber)
values(1,'oil change','2023-01-02',1);

insert into service_history( service_id, serviceDescription, service_date, carSerialNumber)
values(2,'Tire change','2023-04-08',2);


insert into service_ticket(serivceTicket_id,typeOfService,carSerialNumber)
values(1, 'Buying a car', 1);

insert into service_ticket(serivceTicket_id,typeOfService,carSerialNumber)
values(2, 'Buying a car', 2);


insert into parts(part_id,partName,carSerialNumber)
values(1,'Tire',1);

insert into parts(part_id,partName,carSerialNumber)
values(2,'Bumpers',1);


create table Car_customer(
customer_id SERIAL primary key,
first_name VARCHAR(100),
last_name VARCHAR(100),
address VARCHAR(200),
phone CHAR(20)
);


--Adding 2 customers using stored function 

create or replace function add_customer(

      _customer_id INTEGER,
      _first_name VARCHAR,
      _last_name VARCHAR,
      _address VARCHAR,
      _phone CHAR
     
)
returns void
as $MAIN$
begin
	insert into Car_customer(customer_id, first_name, last_name, address, phone)
	Values(_customer_id, _first_name, _last_name, _address, _phone);
end;
$MAIN$
language plpgsql;

select add_customer(3, 'Kibrom', 'Kifl','234 W flamingo Ave, Denver CO', '3032989876');




create or replace function add_customer(

      _customer_id INTEGER,
      _first_name VARCHAR,
      _last_name VARCHAR,
      _address VARCHAR,
      _phone CHAR
     
)
returns void
as $MAIN$
begin
	insert into Car_customer(customer_id, first_name, last_name, address, phone)
	Values(_customer_id, _first_name, _last_name, _address, _phone);
end;
$MAIN$
language plpgsql;

select add_customer(4, 'Stela', 'Mebrhatu','134 W Jewell Ave, Denver CO', '3032989234');


select * from Car_customer