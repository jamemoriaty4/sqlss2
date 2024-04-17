#tạo cơ ở dữ leeeuj

CREATE DATABASE if not exists crm_demo;

use crm_demo;

#tạo họp đồng

create table if not exists Constract
(
    id          int auto_increment primary key,
    name        varchar(50),
    value       int,
    begin_at    date,
    expiry_at   date,
    employee_id int,
    customer_id int,
    status      enum ('cancel','prepare','done')
);

create table if not exists Customer
(
    id            int auto_increment primary key,
    first_name    varchar(15),
    last_name     varchar(15),
    date_of_birth date,
    sex           bit,
    address       varchar(50),
    phone         varchar(12)
);

create table if not exists Employee
(
    id            int auto_increment primary key,
    full_name     varchar(15),
    date_of_birth date,
    sex           bit,
    address       varchar(50),
    phone         varchar(12),
    department    varchar(50),
    status        bit
);

create table if not exists Transaction
(
    id           int auto_increment primary key,
    title        varchar(50),
    content      varchar(100),
    constract_id int,
    amount       int,
    created_at   date,
    status       bit
);

alter table Constract
    add constraint fk_01 foreign key (employee_id) references Employee (id);
alter table Constract
    add constraint fk_02 foreign key (customer_id) references Customer (id);
alter table Transaction
    add constraint fk_03 foreign key (constract_id) references Constract (id);