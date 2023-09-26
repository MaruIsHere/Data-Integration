<?xml version="1.0" encoding="UTF-8"?>
<querybuilder version="8.3">
<source>
<database charset="utf8mb4" collation="utf8mb4_general_ci">penjualan</database>
</source>
<canvas>
<table tablename="jenis_produk" alias="" left="258" top="69" width="150" height="113" />
<table tablename="pembeli" alias="" left="65" top="166" width="150" height="113" />
<table tablename="penjualan" alias="" left="260" top="219" width="150" height="113" />
<table tablename="produk" alias="" left="711" top="69" width="150" height="113" />
<table tablename="stok" alias="" left="447" top="272" width="150" height="113" />
<table tablename="toko" alias="" left="722" top="276" width="150" height="113" />
<join type = "Inner Join">
<from tablename = "penjualan" alias = "">PEM_ID</from>
<to tablename = "pembeli" alias = "">ID</to>
</join>
<join type = "Inner Join">
<from tablename = "produk" alias = "">JEN_ID</from>
<to tablename = "jenis_produk" alias = "">ID</to>
</join>
<join type = "Inner Join">
<from tablename = "penjualan" alias = "">PRO_ID</from>
<to tablename = "produk" alias = "">ID</to>
</join>
<join type = "Inner Join">
<from tablename = "stok" alias = "">PRO_ID</from>
<to tablename = "produk" alias = "">ID</to>
</join>
<join type = "Inner Join">
<from tablename = "produk" alias = "">TOK_ID</from>
<to tablename = "stok" alias = "">TOK_ID</to>
</join>
<join type = "Inner Join">
<from tablename = "produk" alias = "">PRO_ID</from>
<to tablename = "stok" alias = "">PRO_ID</to>
</join>
<join type = "Inner Join">
<from tablename = "produk" alias = "">STO_ID</from>
<to tablename = "stok" alias = "">ID</to>
</join>
<join type = "Inner Join">
<from tablename = "stok" alias = "">TOK_ID</from>
<to tablename = "toko" alias = "">ID</to>
</join>
</canvas>
<grid>
</grid>
</querybuilder>