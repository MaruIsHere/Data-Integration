/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/10/2023 16:08:36                          */
/*==============================================================*/


drop table if exists DIM_CITY;

drop table if exists DIM_EMPLOYEE;

drop table if exists DIM_MONTH;

drop table if exists DIM_PRODUCT_TYPE;

drop table if exists DIM_PROJECT;

drop table if exists DIM_REGION;

drop table if exists DIM_SALES_TYPE;

drop table if exists DIM_STORE;

drop table if exists DIM_TIME;

drop table if exists DIM_WEEK;

drop table if exists DIM_WEEKDAY;

drop table if exists DIM_YEAR;

drop table if exists FACT_SALES;

/*==============================================================*/
/* Table: DIM_CITY                                              */
/*==============================================================*/
create table DIM_CITY
(
   CITY_ID              int not null,
   REGION_ID            int,
   CITY                 varchar(256),
   primary key (CITY_ID)
);

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
/* Table: DIM_MONTH                                             */
/*==============================================================*/
create table DIM_MONTH
(
   MONTH_ID             int not null,
   ACTION_MONTH         int,
   primary key (MONTH_ID)
);

/*==============================================================*/
/* Table: DIM_PRODUCT_TYPE                                      */
/*==============================================================*/
create table DIM_PRODUCT_TYPE
(
   PRODUCT_TYPE_ID      int not null,
   PRODUCT_TYPE_NAME    varchar(256),
   primary key (PRODUCT_TYPE_ID)
);

/*==============================================================*/
/* Table: DIM_PROJECT                                           */
/*==============================================================*/
create table DIM_PROJECT
(
   PRODUCT_ID           int not null,
   PRODUCT_TYPE_ID      int,
   PRODUCT_NAME         varchar(256),
   primary key (PRODUCT_ID)
);

/*==============================================================*/
/* Table: DIM_REGION                                            */
/*==============================================================*/
create table DIM_REGION
(
   REGION_ID            int not null,
   REGION               varchar(128),
   primary key (REGION_ID)
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
   CITY_ID              int,
   STORE_ADDRESS        varchar(256),
   primary key (STORE_ID)
);

/*==============================================================*/
/* Table: DIM_TIME                                              */
/*==============================================================*/
create table DIM_TIME
(
   TIME_ID              int not null,
   MONTH_ID             int,
   YEAR_ID              int,
   WEEKDAY_ID           int,
   WEEK_ID              int,
   ACTION_DATE          date,
   primary key (TIME_ID)
);

/*==============================================================*/
/* Table: DIM_WEEK                                              */
/*==============================================================*/
create table DIM_WEEK
(
   WEEK_ID              int not null,
   ACTION_WEEK          int,
   primary key (WEEK_ID)
);

/*==============================================================*/
/* Table: DIM_WEEKDAY                                           */
/*==============================================================*/
create table DIM_WEEKDAY
(
   WEEKDAY_ID           int not null,
   ACTION_WEEKDAY       varchar(16),
   primary key (WEEKDAY_ID)
);

/*==============================================================*/
/* Table: DIM_YEAR                                              */
/*==============================================================*/
create table DIM_YEAR
(
   YEAR_ID              int not null,
   ACTION_YEAR          int,
   primary key (YEAR_ID)
);

/*==============================================================*/
/* Table: FACT_SALES                                            */
/*==============================================================*/
create table FACT_SALES
(
   STORE_ID             int not null,
   SALES_TYPE_ID        int not null,
   TIME_ID              int not null,
   EMPLOYEE_ID          int not null,
   PRODUCT_ID           int not null,
   PRICE                decimal(8,2),
   QUANTITY             decimal(8,2),
   primary key (STORE_ID, SALES_TYPE_ID, TIME_ID, EMPLOYEE_ID, PRODUCT_ID)
);

alter table DIM_CITY add constraint FK_RELATIONSHIP_12 foreign key (REGION_ID)
      references DIM_REGION (REGION_ID) on delete restrict on update restrict;

alter table DIM_PROJECT add constraint FK_RELATIONSHIP_5 foreign key (PRODUCT_TYPE_ID)
      references DIM_PRODUCT_TYPE (PRODUCT_TYPE_ID) on delete restrict on update restrict;

alter table DIM_STORE add constraint FK_RELATIONSHIP_11 foreign key (CITY_ID)
      references DIM_CITY (CITY_ID) on delete restrict on update restrict;

alter table DIM_TIME add constraint FK_RELATIONSHIP_1 foreign key (WEEK_ID)
      references DIM_WEEK (WEEK_ID) on delete restrict on update restrict;

alter table DIM_TIME add constraint FK_RELATIONSHIP_2 foreign key (MONTH_ID)
      references DIM_MONTH (MONTH_ID) on delete restrict on update restrict;

alter table DIM_TIME add constraint FK_RELATIONSHIP_3 foreign key (YEAR_ID)
      references DIM_YEAR (YEAR_ID) on delete restrict on update restrict;

alter table DIM_TIME add constraint FK_RELATIONSHIP_4 foreign key (WEEKDAY_ID)
      references DIM_WEEKDAY (WEEKDAY_ID) on delete restrict on update restrict;

alter table FACT_SALES add constraint FK_RELATIONSHIP_10 foreign key (STORE_ID)
      references DIM_STORE (STORE_ID) on delete restrict on update restrict;

alter table FACT_SALES add constraint FK_RELATIONSHIP_6 foreign key (TIME_ID)
      references DIM_TIME (TIME_ID) on delete restrict on update restrict;

alter table FACT_SALES add constraint FK_RELATIONSHIP_7 foreign key (PRODUCT_ID)
      references DIM_PROJECT (PRODUCT_ID) on delete restrict on update restrict;

alter table FACT_SALES add constraint FK_RELATIONSHIP_8 foreign key (EMPLOYEE_ID)
      references DIM_EMPLOYEE (EMPLOYEE_ID) on delete restrict on update restrict;

alter table FACT_SALES add constraint FK_RELATIONSHIP_9 foreign key (SALES_TYPE_ID)
      references DIM_SALES_TYPE (SALES_TYPE_ID) on delete restrict on update restrict;

