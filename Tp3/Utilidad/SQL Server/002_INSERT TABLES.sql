
go
use TP3
go
--REGISTROS EN TABLA ROL
INSERT INTO ROL(Descripcion) VALUES ('ADMINISTRADOR'),('EMPLEADO')

GO
--REGISTROS EN TABLA MENU
INSERT INTO MENU(Nombre,Icono) VALUES
('Administracion','fas fa-tools'),
('Clientes','fas fa-user-friends'),
('Compras','fas fa-cart-arrow-down'),
('Ventas','fas fa-cash-register'),
('Reportes','far fa-clipboard')

GO
--REGISTROS EN TABLA SUBMENU
INSERT INTO SUBMENU(IdMenu,Nombre,Controlador,Vista,Icono) VALUES
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Administracion'),'Rol','Rol','Crear','fas fa-user-tag'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Administracion'),'Asignar Permisos','Permisos','Crear','fas fa-user-lock'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Administracion'),'Usuarios','Usuario','Crear','fas fa-users-cog'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Administracion'),'Categorias','Categoria','Crear','fab fa-wpforms'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Administracion'),'Productos','Producto','Crear','fas fa-box-open'),

((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Clientes'),'Clientes','Cliente','Crear','fas fa-user-shield'),

((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Compras'),'Proveedores','Proveedor','Crear','fas fa-shipping-fast'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Compras'),'Asignar producto a Tienda','Producto','Asignar','fas fa-dolly'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Compras'),'Registrar Compra','Compra','Crear','fas fa-cart-arrow-down'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Compras'),'Consultar Compra','Compra','Consultar','far fa-list-alt'),

((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Ventas'),'Tiendas','Tienda','Crear','fas fa-store-alt'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Ventas'),'Registrar Venta','Venta','Crear','fas fa-cash-register'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Ventas'),'Consultar Venta','Venta','Consultar','far fa-clipboard'),

((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Reportes'),'Productos por tienda','Reporte','Producto','fas fa-boxes'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Reportes'),'Ventas','Reporte','Ventas','fas fa-shopping-basket')


GO
--REGISTROS EN TABLA TIENDA
INSERT INTO TIENDA(Nombre,RUC,Direccion,Telefono) VALUES ('Tienda 001','25689789654','AV.GRANDE 123','963852896')

GO
--REGISTROS USUARIO
insert into usuario(Nombres,Apellidos,Correo,Clave,IdTienda,IdRol)
values('Administrador','Thopsom','admin@gmail.com','7932b2e116b076a54f452848eaabd5857f61bd957fe8a218faf216f24c9885bb',(select TOP 1 IdTienda from TIENDA where Nombre = 'Tienda 001'),(select TOP 1 IdRol from ROL where Descripcion = 'ADMINISTRADOR'))
go
insert into usuario(Nombres,Apellidos,Correo,Clave,IdTienda,IdRol)
values('Tienda','azgun','tienda@gmail.com','29cfa0f8e37e40a1a7a723aa88eca2cc050f270417969bfbe753f6bc0919aefe',(select TOP 1 IdTienda from TIENDA where Nombre = 'Tienda 001'),(select TOP 1 IdRol from ROL where Descripcion = 'EMPLEADO'))


GO
--REGISTROS EN TABLA PERMISOS
INSERT INTO PERMISOS(IdRol,IdSubMenu)
SELECT (select TOP 1 IdRol from ROL where Descripcion = 'ADMINISTRADOR'), IdSubMenu FROM SUBMENU
go
INSERT INTO PERMISOS(IdRol,IdSubMenu,Activo)
SELECT (select TOP 1 IdRol from ROL where Descripcion = 'EMPLEADO'), IdSubMenu, 0 FROM SUBMENU 

go

update p set p.Activo = 1 from PERMISOS p
inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
where sm.Controlador in ('Venta') and p.IdRol = (select TOP 1 IdRol from ROL where Descripcion = 'EMPLEADO')


GO
--REGISTRO EN TABLA CATEGORIA
INSERT INTO CATEGORIA(Descripcion) VALUES

GO
--REGISTRO EN TABLA PRODUCTO
