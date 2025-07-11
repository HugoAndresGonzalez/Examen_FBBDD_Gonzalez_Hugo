create database if not exists bike_BD;

use bike_BD;

create table cliente (
    id_cliente int primary key,
    nombre_cliente varchar(50) not null,
    tel_cliente varchar(10) not null,
    producto_solicitado varchar(50) not null
);

create table orden_venta (
    id_venta int primary key,
    cantidad_venta int not null,
    valor_venta float not null,
    producto_solicitado varchar(50) not null,
    id_cliente int,
    foreign key (producto_solicitado) references cliente(producto_solicitado),
    foreign key (id_cliente) references cliente(id_cliente)
);

create table transaccion_clientes(
    cod_transaccion_cliente int primary key,
    id_venta int,
    cantidad_venta int,
    valor_venta float,
    foreign key (id_venta) references orden_venta(id_venta),
    foreign key (cantidad_venta) references orden_venta(cantidad_venta)
    foreign key (valor_venta) references orden_venta(cantidad_venta)
);


create table gestion_compra_venta(
    decision_venta varchar(50),
    decision_compra varchar(50),
    cod_transaccion_cliente int,
    primary key(decision_compra,decision_venta),
    foreign key (cod_transaccion_cliente) references transaccion_clientes(cod_transaccion_cliente)
);

create table proveedores (
    id_proveedor int primary key,
    nombre_proveedor varchar(50) not null,
    tel_proveedor varchar(10) not null,
    terminos_suministro varchar(50) not null
);


create table orden_compra(
    id_compra int primary key,
    cantidad_compra int not null,
    valor_compra float not null,
    decision_compra varchar(50),
    id_proveedor int,
    foreign key (id_proveedor) references proveedores(id_proveedor),
    foreign key (decision_compra) references gestion_compra_venta(decision_compra)
);

create table pedido (
    id_pedido int primary key,
    tipo_pedido varchar(20),
    decision_venta varchar(50),
    foreign key (decision_venta) references gestion_compra_venta(decision_venta)
);

create table inventario (
    cant_disponible int primary key,
    id_pedido int,
     foreign key (id_pedido) references pedido(id_pedido)
);