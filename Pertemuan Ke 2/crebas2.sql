/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     26/09/2023 09:02:10                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_PENJUALA_RELATIONS_PRODUK') then
    alter table PENJUALAN
       delete foreign key FK_PENJUALA_RELATIONS_PRODUK
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PENJUALA_RELATIONS_PEMBELI') then
    alter table PENJUALAN
       delete foreign key FK_PENJUALA_RELATIONS_PEMBELI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PRODUK_RELATIONS_JENIS_PR') then
    alter table PRODUK
       delete foreign key FK_PRODUK_RELATIONS_JENIS_PR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PRODUK_RELATIONS_STOK') then
    alter table PRODUK
       delete foreign key FK_PRODUK_RELATIONS_STOK
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_STOK_RELATIONS_TOKO') then
    alter table STOK
       delete foreign key FK_STOK_RELATIONS_TOKO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_STOK_RELATIONS_PRODUK') then
    alter table STOK
       delete foreign key FK_STOK_RELATIONS_PRODUK
end if;

drop index if exists JENIS_PRODUK.JENIS_PRODUK_PK;

drop table if exists JENIS_PRODUK;

drop index if exists PEMBELI.PEMBELI_PK;

drop table if exists PEMBELI;

drop index if exists PENJUALAN.RELATIONSHIP_2_FK;

drop index if exists PENJUALAN.RELATIONSHIP_1_FK;

drop index if exists PENJUALAN.PENJUALAN_PK;

drop table if exists PENJUALAN;

drop index if exists PRODUK.RELATIONSHIP_6_FK;

drop index if exists PRODUK.RELATIONSHIP_3_FK;

drop index if exists PRODUK.PRODUK_PK;

drop table if exists PRODUK;

drop index if exists STOK.RELATIONSHIP_6_FK;

drop index if exists STOK.RELATIONSHIP_5_FK;

drop index if exists STOK.STOK_PK;

drop table if exists STOK;

drop index if exists TOKO.TOKO_PK;

drop table if exists TOKO;

/*==============================================================*/
/* Table: JENIS_PRODUK                                          */
/*==============================================================*/
create table JENIS_PRODUK 
(
   ID                   integer                        not null,
   NAMA                 varchar(100)                   null,
   KETERANGAN           char(255)                      null,
   constraint PK_JENIS_PRODUK primary key (ID)
);

/*==============================================================*/
/* Index: JENIS_PRODUK_PK                                       */
/*==============================================================*/
create unique index JENIS_PRODUK_PK on JENIS_PRODUK (
ID ASC
);

/*==============================================================*/
/* Table: PEMBELI                                               */
/*==============================================================*/
create table PEMBELI 
(
   ID                   integer                        not null,
   NAMA                 varchar(100)                   null,
   ALAMAT               varchar(100)                   null,
   NOMOR_HP             varchar(20)                    null,
   TIPE                 integer                        null,
   constraint PK_PEMBELI primary key (ID)
);

/*==============================================================*/
/* Index: PEMBELI_PK                                            */
/*==============================================================*/
create unique index PEMBELI_PK on PEMBELI (
ID ASC
);

/*==============================================================*/
/* Table: PENJUALAN                                             */
/*==============================================================*/
create table PENJUALAN 
(
   ID                   integer                        not null,
   PRO_ID               integer                        null,
   PEM_ID               integer                        null,
   TANGGAL              date                           null,
   NOMINAL              decimal                        null,
   constraint PK_PENJUALAN primary key (ID)
);

/*==============================================================*/
/* Index: PENJUALAN_PK                                          */
/*==============================================================*/
create unique index PENJUALAN_PK on PENJUALAN (
ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on PENJUALAN (
PRO_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on PENJUALAN (
PEM_ID ASC
);

/*==============================================================*/
/* Table: PRODUK                                                */
/*==============================================================*/
create table PRODUK 
(
   ID                   integer                        not null,
   JEN_ID               integer                        null,
   TOK_ID               integer                        null,
   PRO_ID               integer                        null,
   STO_ID               integer                        null,
   NAMA                 varchar(100)                   null,
   HARGA                decimal(10,0)                  null,
   STOK                 integer                        null,
   constraint PK_PRODUK primary key (ID)
);

/*==============================================================*/
/* Index: PRODUK_PK                                             */
/*==============================================================*/
create unique index PRODUK_PK on PRODUK (
ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on PRODUK (
JEN_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on PRODUK (
TOK_ID ASC,
PRO_ID ASC,
STO_ID ASC
);

/*==============================================================*/
/* Table: STOK                                                  */
/*==============================================================*/
create table STOK 
(
   TOK_ID               integer                        not null,
   PRO_ID               integer                        not null,
   ID                   integer                        not null,
   JUMLAH               numeric                        null,
   NOMINAL              decimal                        null,
   constraint PK_STOK primary key (TOK_ID, PRO_ID, ID)
);

/*==============================================================*/
/* Index: STOK_PK                                               */
/*==============================================================*/
create unique index STOK_PK on STOK (
TOK_ID ASC,
PRO_ID ASC,
ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on STOK (
TOK_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on STOK (
PRO_ID ASC
);

/*==============================================================*/
/* Table: TOKO                                                  */
/*==============================================================*/
create table TOKO 
(
   ID                   integer                        not null,
   NAMA                 varchar(100)                   null,
   ALAMAT               varchar(100)                   null,
   PEMILIK              varchar(100)                   null,
   NOMOR_HP             varchar(20)                    null,
   constraint PK_TOKO primary key (ID)
);

/*==============================================================*/
/* Index: TOKO_PK                                               */
/*==============================================================*/
create unique index TOKO_PK on TOKO (
ID ASC
);

alter table PENJUALAN
   add constraint FK_PENJUALA_RELATIONS_PRODUK foreign key (PRO_ID)
      references PRODUK (ID)
      on update restrict
      on delete restrict;

alter table PENJUALAN
   add constraint FK_PENJUALA_RELATIONS_PEMBELI foreign key (PEM_ID)
      references PEMBELI (ID)
      on update restrict
      on delete restrict;

alter table PRODUK
   add constraint FK_PRODUK_RELATIONS_JENIS_PR foreign key (JEN_ID)
      references JENIS_PRODUK (ID)
      on update restrict
      on delete restrict;

alter table PRODUK
   add constraint FK_PRODUK_RELATIONS_STOK foreign key (TOK_ID, PRO_ID, STO_ID)
      references STOK (TOK_ID, PRO_ID, ID)
      on update restrict
      on delete restrict;

alter table STOK
   add constraint FK_STOK_RELATIONS_TOKO foreign key (TOK_ID)
      references TOKO (ID)
      on update restrict
      on delete restrict;

alter table STOK
   add constraint FK_STOK_RELATIONS_PRODUK foreign key (PRO_ID)
      references PRODUK (ID)
      on update restrict
      on delete restrict;

