/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
 
/* 1. Создаем таблицы БД */

create table "ROLES" (
    "ID" integer unique not null,
    "NAME" varchar (255) primary key
);

create table "USERINFO" (
    "ID" integer primary key,
    "NAME" varchar(255), /* NAME – зарезервированное слово, в MySQL такие слова выделяются с помощью символа обратного апострофа (back quote) " ` " */
    "SURNAME" varchar(255)
);

create table "USER" (
    "ID" integer not null unique generated always as identity, 
    "EMAIL" varchar(255) not null primary key,
    "PASSWORD" varchar(255) not null,
    "INFO" integer not null unique references "USERINFO" ("ID"),
    "ROLE" integer not null references "ROLES" ("ID")
);

create table "ORDER" ( 
    "ID" integer not null generated always as identity primary key,
    "USER" integer not null references "USER" ("ID"),
    CREATED TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

create table "SUPPLIER" (
    "ID" integer not null unique generated always as identity,
    "NAME" varchar(255) not null primary key,
    "ADDRESS" varchar(255),
    "PHONE" varchar(255) not null,
    "REPRESENTATIVE" varchar(255)
);

create table "PRODUCT" (
    "ID" integer not null unique generated always as identity,
    "CODE" varchar(255) not null primary key,
    "TITLE" varchar(255) not null,
    "SUPPLIER" integer not null references "SUPPLIER" ("ID"),
    "INITIAL_PRICE" double not null,
    "RETAIL_VALUE" double not null
);

create table "ORDER2PRODUCT" (
    "ORDER" integer not null references "ORDER" ("ID"),
    "PRODUCT" integer not null references "PRODUCT" ("ID"),
    constraint pk_order_product primary key ("ORDER", "PRODUCT")
);

/* 2. Добавляем записи */

-- в "ROLES"

insert into "ROLES" ("ID", "NAME") values (1, 'admin');
insert into "ROLES" ("ID", "NAME") values (2, 'customer');
insert into "ROLES" ("ID", "NAME") values (3, 'user');

-- в "USERINFO"

insert into "USERINFO" ("ID", "NAME", "SURNAME") values (1, 'Edvard', 'McRoy');
insert into "USERINFO" ("ID", "NAME", "SURNAME") values (2, 'Sofi', 'Galar');
insert into "USERINFO" ("ID", "NAME", "SURNAME") values (3, 'Philip', 'Keins');

-- в USER

insert into "USER" ("EMAIL", "PASSWORD", INFO, "ROLE") values ('ebdacarr@mail.ru', '6spdW~4H', 11, 2);
insert into "USER" ("EMAIL", "PASSWORD", INFO, "ROLE") values ('sifilakie@gmail.com', 'xH3?ykWl', 12, 3);
insert into "USER" ("EMAIL", "PASSWORD", INFO, "ROLE") values ('phayllye@yandex.ru', 'X?j0x$T#', 13, 1);

-- в ORDER

insert into "ORDER" ("USER", CREATED) values (1423, default);
insert into "ORDER" ("USER", CREATED) values (1123, default);
insert into "ORDER" ("USER", CREATED) values (7851, default);

-- в "SUPPLIER"

insert into "SUPPLIER" ("NAME", "ADDRESS", "PHONE", "REPRESENTATIVE") 
values ('Avilon Inds.', '635 Stroop Hill Road, Monticello', '404-838-5314', 'Alexander Cooper');
insert into "SUPPLIER" ("NAME", "ADDRESS", "PHONE", "REPRESENTATIVE") 
values ('Bars Ltd', '249 Hickory Heights Drive, Columbia', '443-838-2041', 'Brian Pope');
insert into "SUPPLIER" ("NAME", "ADDRESS", "PHONE", "REPRESENTATIVE") 
values ('Gear Motors Inds.', '4911 Glenwood Avenue, Cleveland', '216-373-4680', 'Gordon Kennedy');

-- в "PRODUCT"

insert into "PRODUCT" ("CODE", "TITLE", "SUPPLIER", "INITIAL_PRICE", "RETAIL_VALUE") 
values ('repair_parts', 'inner fender', 1, 12600.34, 18900);  
insert into "PRODUCT" ("CODE", "TITLE", "SUPPLIER", "INITIAL_PRICE", "RETAIL_VALUE") 
values ('engine', 'valves 231', 2, 1987.59, 3500);  
insert into "PRODUCT" ("CODE", "TITLE", "SUPPLIER", "INITIAL_PRICE", "RETAIL_VALUE") 
values ('glass', 'windshield', 3, 14123.42, 20000);

