CREATE DATABASE second_db;

use second_db;

create table persons
(
    id         int not null primary key ,
    last_name  varchar(256),
    first_name varchar(256),
    age        int         not null check ( age > 10 ),
    phone      varchar(11) not null unique,
    address_id int ,
    foreign key (address_id) references address(id)
);

create table address(
    id int primary key ,
    details varchar(100)
);
drop table persons;

#ràng buô not null

alter table persons
    modify id int not null;

alter table persons
    add constraint check_first_name check ( length(first_name) >= 4 );

#khoá chính tổ hợp/ phức hợp

insert into address(id, details) values (1,'hn');
insert into persons(id, last_name, first_name, age, phone) value (1, 'phung', 'dang', 12, '09832948232');