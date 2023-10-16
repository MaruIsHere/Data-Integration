/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/10/2023 16:16:38                          */
/*==============================================================*/


drop table if exists DIM_EMPLOYEE;

drop table if exists DIM_PRODUCT;

drop table if exists DIM_SALES_TYPE;

drop table if exists DIM_STORE;

drop table if exists DIM_TIME;

drop table if exists FACT_SALES;

/*==============================================================*/
/* Table: DIM_EMPLOYEE                                          */
/*==============================================================*/
create table DIM_EMPLOYEE
(
   EMPLOYEE_ID          int not null,
   FIRST_NAME           varchar(128),
   LAST_NAME            varchar(128),
   BIRTH_YEAR           int,
   primary key (EMPLOYEE_ID)
);

/*==============================================================*/
/* Table: DIM_PRODUCT                                           */
/*==============================================================*/
create table DIM_PRODUCT
(
   PRODUCT_ID           int not null,
   PRODUCT_NAME         varchar(256),
   PRODUCT_TYPE         varchar(256),
   primary key (PRODUCT_ID)
);

/*==============================================================*/
/* Table: DIM_SALES_TYPE                                        */
/*==============================================================*/
create table DIM_SALES_TYPE
(
   SALES_TYPE_ID        int not null,
   TYPE_NAME            varchar(128),
   primary key (SALES_TYPE_ID)
);

/*==============================================================*/
/* Table: DIM_STORE                                             */
/*==============================================================*/
create table DIM_STORE
(
   STORE_ID             int not null,
   STORE_ADDRESS        varchar(256),
   CITY                 varchar(128),
   REGION               varchar(128),
   STATE                varchar(128),
   COUNTRY              varchar(128),
   primary key (STORE_ID)
);

/*==============================================================*/
/* Table: DIM_TIME                                              */
/*==============================================================*/
create table DIM_TIME
(
   TIME_ID              int not null,
   ACTION_DATE          date,
   ACTION_WEEK          int,
   ACTION_YEAR          int,
   ACTION_WEEKDAY       varchar(16),
   primary key (TIME_ID)
);

/*==============================================================*/
/* Table: FACT_SALES                                            */
/*==============================================================*/
create table FACT_SALES
(
   PRODUCT_ID           int not null,
   SALES_TYPE_ID        int not null,
   EMPLOYEE_ID          int not null,
   STORE_ID             int not null,
   TIME_ID              int not null,
   PRICE                decimal(8,2),
   QUANTITY             decimal(8,2),
   primary key (PRODUCT_ID, SALES_TYPE_ID, EMPLOYEE_ID, STORE_ID, TIME_ID)
);

alter table FACT_SALES add constraint FK_RELATIONSHIP_1 foreign key (TIME_ID)
      references DIM_TIME (TIME_ID) on delete restrict on update restrict;

alter table FACT_SALES add constraint FK_RELATIONSHIP_2 foreign key (PRODUCT_ID)
      references DIM_PRODUCT (PRODUCT_ID) on delete restrict on update restrict;

alter table FACT_SALES add constraint FK_RELATIONSHIP_3 foreign key (STORE_ID)
      references DIM_STORE (STORE_ID) on delete restrict on update restrict;

alter table FACT_SALES add constraint FK_RELATIONSHIP_4 foreign key (SALES_TYPE_ID)
      references DIM_SALES_TYPE (SALES_TYPE_ID) on delete restrict on update restrict;

alter table FACT_SALES add constraint FK_RELATIONSHIP_5 foreign key (EMPLOYEE_ID)
      references DIM_EMPLOYEE (EMPLOYEE_ID) on delete restrict on update restrict;

