
#-----uc1-ceate database-----------
create database Address_Book_service;

#-----uc2-Ability to create Tables---------
use Address_Book_service;
show tables;
create table contacts (
id int auto_increment,
first_name varchar(10),
last_name varchar(10),
address varchar(10),
city varchar(10),
state varchar(10),
zip varchar(10),
phone_Number varchar(12),
email_Id varchar(30),
Primary key(id)
);

desc contactscontacts;
#-----------uc3-Ability to insert data-------------
insert into contacts (first_name,last_name,address,city,state,zip,phone_Number,email_Id) values("Anil","pawar","","cidco","Aurangabad","431001","9534567890","anilp@gmail.com");
insert into contacts (first_name,last_name,address,city,state,zip,phone_Number,email_Id) values("Arun","pawar","","cidco","Aurangabad","431001","9634567890","anilp@gmail.com");
insert into contacts (first_name,last_name,address,city,state,zip,phone_Number,email_Id) values("Naresh","pawar","","cidco","Aurangabad","431001","9734567890","anilp@gmail.com");
insert into contacts (first_name,last_name,address,city,state,zip,phone_Number,email_Id) values("Dipak","pawar","","cidco","Aurangabad","431001","9834567890","anilp@gmail.com");

 
select * from contacts;
#-----------------uc4-Ability to edit existing contactperson using their name---------------
update contacts 
set first_name ='Aniket',last_name='patil',city='mumbai'
where id =2;

select * from contacts;
#---------------uc5-Ability to delete a person using person'sname----------------
delete from contacts 
where first_name='Dipak';
#---------------uc6-Ability to Retrieve Person belonging to a City or State from the Address Book-----------------
select * from contacts;

select * from contacts where city like 'g__%';

select * from contacts where state like 'B__%';

select count(*) from contacts where first_name like 'a__%';
#------------------uc7-Ability to understand the size of address book by City and State------------------
select (id), State from contacts group by state;

select (id), city from contacts group by city;
#------------------uc8- Ability to retrieve entries  sorted alphabetically by Person’s name for a given city----------------------
select * from contacts order by first_name asc;
select * from contacts where first_name like 'a__%';

#------------------uc9-Ability to identify each Address Book with name and Type----------------------
create table contact_type(
contact_id int auto_increment,
contact_type1 varchar(20),
primary key(id),
foreign key (contact_id) references contacts(id)
);

select * from contact_type;

select * from contacts;
#----------------uc10-Ability to get number of contact persons i.e. count by type---------------------

select count(*) contact_type
from contact_type group by contact_type;
#------------------------uc11-Ability to add person to both Friend and Family------------------
insert into contact_type(contact_type,contact_id) values('friend',1),('friends',2),('family',4);

Select c.id,c.first_name,c.last_name,c.address,c.city,c.state,c.zip,c.phone_Number,c.email_Id,ct.contact_type from contacts as c right join contact_type as ct
on c.id = ct.contact_id;

#---------------uc ER DAIGRAM------------------