CREATE TABLE [Customer] (
	[Customer_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[first_name] nvarchar(100) NOT NULL,
	[last_name] int NOT NULL,
	[phone_number] nvarchar(25) NOT NULL,
	[email] nvarchar(255) NOT NULL,
	PRIMARY KEY ([Customer_id])
);

CREATE TABLE [ServiceOrders] (
	[order_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[customer_id] int NOT NULL,
	[service_id] int NOT NULL,
	[amount] decimal(18,0) NOT NULL,
	[order_date] date NOT NULL,
	PRIMARY KEY ([order_id])
);

CREATE TABLE [Services] (
	[service_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[service_name] nvarchar(100) NOT NULL,
	[price] decimal(18,0) NOT NULL,
	PRIMARY KEY ([service_id])
);

CREATE TABLE [Reservations] (
	[reservation_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[customer_id] int NOT NULL,
	[employee_id] int NOT NULL,
	[reservation_date] date NOT NULL,
	PRIMARY KEY ([reservation_id])
);

CREATE TABLE [Rooms] (
	[room_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[room_number] nvarchar(20) NOT NULL,
	[room_type] nvarchar(50) NOT NULL,
	[price_per_night] decimal(18,0) NOT NULL,
	PRIMARY KEY ([room_id])
);

CREATE TABLE [Payments] (
	[payment_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[reservation_id] int NOT NULL,
	[payment_date] date NOT NULL,
	[amount] decimal(18,0) NOT NULL,
	PRIMARY KEY ([payment_id])
);

CREATE TABLE [Employees] (
	[employee_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[first_name] nvarchar(100) NOT NULL,
	[last_name] nvarchar(100) NOT NULL,
	[position] nvarchar(100) NOT NULL,
	[employment_date] date NOT NULL,
	[bonus] decimal(18,0) NOT NULL,
	PRIMARY KEY ([employee_id])
);

ALTER TABLE [Customer] ADD CONSTRAINT [Customer_fk0] FOREIGN KEY ([Customer_id]) REFERENCES [ServiceOrders]([customer_id]);
ALTER TABLE [ServiceOrders] ADD CONSTRAINT [ServiceOrders_fk2] FOREIGN KEY ([service_id]) REFERENCES [Services]([service_id]);

ALTER TABLE [Reservations] ADD CONSTRAINT [Reservations_fk0] FOREIGN KEY ([reservation_id]) REFERENCES [Payments]([reservation_id]);

ALTER TABLE [Reservations] ADD CONSTRAINT [Reservations_fk1] FOREIGN KEY ([customer_id]) REFERENCES [Customer]([Customer_id]);

ALTER TABLE [Reservations] ADD CONSTRAINT [Reservations_fk2] FOREIGN KEY ([employee_id]) REFERENCES [Employees]([employee_id]);
ALTER TABLE [Rooms] ADD CONSTRAINT [Rooms_fk0] FOREIGN KEY ([room_id]) REFERENCES [Customer]([Customer_id]);

