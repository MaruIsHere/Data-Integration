/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     19/09/2023 09:15:30                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_BOOK_RELATIONS_AUTHOR') then
    alter table BOOK
       delete foreign key FK_BOOK_RELATIONS_AUTHOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_BOOK_RELATIONS_PUBLISHE') then
    alter table BOOK
       delete foreign key FK_BOOK_RELATIONS_PUBLISHE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SHOPPING_RELATIONS_CUSTOMER') then
    alter table SHOPPINGBASKET
       delete foreign key FK_SHOPPING_RELATIONS_CUSTOMER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SHOPPING_RELATIONS_BOOK') then
    alter table SHOPPINGBASKET_BOOK
       delete foreign key FK_SHOPPING_RELATIONS_BOOK
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SHOPPING_RELATIONS_SHOPPING') then
    alter table SHOPPINGBASKET_BOOK
       delete foreign key FK_SHOPPING_RELATIONS_SHOPPING
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_WAREHOUS_RELATIONS_BOOK') then
    alter table WAREHOUSE_BOOK
       delete foreign key FK_WAREHOUS_RELATIONS_BOOK
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_WAREHOUS_RELATIONS_WAREHOUS') then
    alter table WAREHOUSE_BOOK
       delete foreign key FK_WAREHOUS_RELATIONS_WAREHOUS
end if;

drop index if exists AUTHOR.AUTHOR_PK;

drop table if exists AUTHOR;

drop index if exists BOOK.RELATIONSHIP_5_FK;

drop index if exists BOOK.RELATIONSHIP_1_FK;

drop index if exists BOOK.BOOK_PK;

drop table if exists BOOK;

drop index if exists CUSTOMER.CUSTOMER_PK;

drop table if exists CUSTOMER;

drop index if exists PUBLISHER.PUBLISHER_PK;

drop table if exists PUBLISHER;

drop index if exists SHOPPINGBASKET.RELATIONSHIP_7_FK;

drop index if exists SHOPPINGBASKET.SHOPPINGBASKET_PK;

drop table if exists SHOPPINGBASKET;

drop index if exists SHOPPINGBASKET_BOOK.RELATIONSHIP_6_FK;

drop index if exists SHOPPINGBASKET_BOOK.RELATIONSHIP_4_FK;

drop table if exists SHOPPINGBASKET_BOOK;

drop index if exists WAREHOUSE.WAREHOUSE_PK;

drop table if exists WAREHOUSE;

drop index if exists WAREHOUSE_BOOK.RELATIONSHIP_3_FK;

drop index if exists WAREHOUSE_BOOK.RELATIONSHIP_2_FK;

drop table if exists WAREHOUSE_BOOK;

/*==============================================================*/
/* Table: AUTHOR                                                */
/*==============================================================*/
create table AUTHOR 
(
   NAME2                varchar(225)                   not null,
   ADDRESS              varchar(225)                   not null,
   URL                  integer                        null,
   constraint PK_AUTHOR primary key (NAME2, ADDRESS)
);

/*==============================================================*/
/* Index: AUTHOR_PK                                             */
/*==============================================================*/
create unique index AUTHOR_PK on AUTHOR (
NAME2 ASC,
ADDRESS ASC
);

/*==============================================================*/
/* Table: BOOK                                                  */
/*==============================================================*/
create table BOOK 
(
   ISBN                 varchar(225)                   not null,
   NAME1                varchar(225)                   null,
   NAME2                varchar(225)                   null,
   ADDRESS              varchar(225)                   null,
   PUBLISHERNAME        varchar(225)                   null,
   AUTHORNAME           varchar(225)                   null,
   AUTHORADDRESS        varchar(225)                   null,
   YEAR                 integer                        null,
   TITTLE               varchar(225)                   null,
   PRICE                numeric(19)                    null,
   constraint PK_BOOK primary key (ISBN)
);

/*==============================================================*/
/* Index: BOOK_PK                                               */
/*==============================================================*/
create unique index BOOK_PK on BOOK (
ISBN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on BOOK (
NAME2 ASC,
ADDRESS ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on BOOK (
NAME1 ASC
);

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER 
(
   EMAIL                varchar(225)                   not null,
   NAME                 varchar(225)                   null,
   PHONE                varchar(225)                   null,
   ADDRESS1             varchar(225)                   null,
   constraint PK_CUSTOMER primary key (EMAIL)
);

/*==============================================================*/
/* Index: CUSTOMER_PK                                           */
/*==============================================================*/
create unique index CUSTOMER_PK on CUSTOMER (
EMAIL ASC
);

/*==============================================================*/
/* Table: PUBLISHER                                             */
/*==============================================================*/
create table PUBLISHER 
(
   NAME1                varchar(225)                   not null,
   ADDRESS1             varchar(225)                   null,
   PHONE                varchar(225)                   null,
   URL                  integer                        null,
   constraint PK_PUBLISHER primary key (NAME1)
);

/*==============================================================*/
/* Index: PUBLISHER_PK                                          */
/*==============================================================*/
create unique index PUBLISHER_PK on PUBLISHER (
NAME1 ASC
);

/*==============================================================*/
/* Table: SHOPPINGBASKET                                        */
/*==============================================================*/
create table SHOPPINGBASKET 
(
   ID                   integer                        not null,
   EMAIL                varchar(225)                   null,
   CUSTOMEREMAIL        varchar(225)                   null,
   constraint PK_SHOPPINGBASKET primary key (ID)
);

/*==============================================================*/
/* Index: SHOPPINGBASKET_PK                                     */
/*==============================================================*/
create unique index SHOPPINGBASKET_PK on SHOPPINGBASKET (
ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on SHOPPINGBASKET (
EMAIL ASC
);

/*==============================================================*/
/* Table: SHOPPINGBASKET_BOOK                                   */
/*==============================================================*/
create table SHOPPINGBASKET_BOOK 
(
   ISBN                 varchar(225)                   null,
   ID                   integer                        null,
   SHOPPINGBASKETID     integer                        null,
   BOOKISBN             varchar(225)                   null,
   COUNT                integer                        null
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on SHOPPINGBASKET_BOOK (
ISBN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on SHOPPINGBASKET_BOOK (
ID ASC
);

/*==============================================================*/
/* Table: WAREHOUSE                                             */
/*==============================================================*/
create table WAREHOUSE 
(
   CODE                 integer                        not null,
   PHONE                varchar(225)                   null,
   ADDRESS1             varchar(225)                   null,
   constraint PK_WAREHOUSE primary key (CODE)
);

/*==============================================================*/
/* Index: WAREHOUSE_PK                                          */
/*==============================================================*/
create unique index WAREHOUSE_PK on WAREHOUSE (
CODE ASC
);

/*==============================================================*/
/* Table: WAREHOUSE_BOOK                                        */
/*==============================================================*/
create table WAREHOUSE_BOOK 
(
   ISBN                 varchar(225)                   null,
   CODE                 integer                        null,
   WAREHOUSECODE        integer                        null,
   BOOKISBN             varchar(225)                   null,
   COUNT                integer                        null
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on WAREHOUSE_BOOK (
ISBN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on WAREHOUSE_BOOK (
CODE ASC
);

alter table BOOK
   add constraint FK_BOOK_RELATIONS_AUTHOR foreign key (NAME2, ADDRESS)
      references AUTHOR (NAME2, ADDRESS)
      on update restrict
      on delete restrict;

alter table BOOK
   add constraint FK_BOOK_RELATIONS_PUBLISHE foreign key (NAME1)
      references PUBLISHER (NAME1)
      on update restrict
      on delete restrict;

alter table SHOPPINGBASKET
   add constraint FK_SHOPPING_RELATIONS_CUSTOMER foreign key (EMAIL)
      references CUSTOMER (EMAIL)
      on update restrict
      on delete restrict;

alter table SHOPPINGBASKET_BOOK
   add constraint FK_SHOPPING_RELATIONS_BOOK foreign key (ISBN)
      references BOOK (ISBN)
      on update restrict
      on delete restrict;

alter table SHOPPINGBASKET_BOOK
   add constraint FK_SHOPPING_RELATIONS_SHOPPING foreign key (ID)
      references SHOPPINGBASKET (ID)
      on update restrict
      on delete restrict;

alter table WAREHOUSE_BOOK
   add constraint FK_WAREHOUS_RELATIONS_BOOK foreign key (ISBN)
      references BOOK (ISBN)
      on update restrict
      on delete restrict;

alter table WAREHOUSE_BOOK
   add constraint FK_WAREHOUS_RELATIONS_WAREHOUS foreign key (CODE)
      references WAREHOUSE (CODE)
      on update restrict
      on delete restrict;

