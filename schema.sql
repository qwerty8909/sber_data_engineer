CREATE TABLE de11an.kore_client (
	client_id integer NOT NULL PRIMARY KEY,
	fName varchar(50) NOT NULL,
	lName varchar(50) NOT NULL,
	passport varchar(15) NOT NULL
);
insert into de11an.kore_client (client_id, fName, lName, passport) values (1004, 'Иван', 'Иванов', '2357 372819');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1005, 'Алексей', 'Алексеев', '3458 452946');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1006, 'Семен', 'Смирнов', '2738 846204');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1007, 'Ульяна', 'Ульянова', '8361 582132');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1008, 'Петр', 'Петров', '6106 789023');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1009, 'Гарик', 'Харламов', '8792 567111');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1010, 'Анна', 'Антонова', '4738 380001');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1011, 'Владимир', 'Медведев', '2511 567777');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1012, 'Ын', 'Ким', '1111 111111');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1013, 'Виталий', 'Корепанов', '2537 194622');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1014, 'Андрей', 'Андреев', '5005 6188997');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1015, 'Александр', 'Александров', '4510 561056');
insert into de11an.kore_client (client_id, fName, lName, passport) values (1016, 'Мария', 'Макарова', '3015 286610');

CREATE TABLE de11an.kore_cli_phones (
	client_id integer NOT NULL,
	phone varchar(15) NOT NULL,
	CONSTRAINT kore_cli_phones_fk FOREIGN KEY (client_id) REFERENCES de11an.kore_client (client_id)
);
insert into de11an.kore_cli_phones (client_id, phone) values (1004, '79184445588');
insert into de11an.kore_cli_phones (client_id, phone) values (1004, '74527490597');
insert into de11an.kore_cli_phones (client_id, phone) values (1004, '79992534547');
insert into de11an.kore_cli_phones (client_id, phone) values (1005, '79184546378');
insert into de11an.kore_cli_phones (client_id, phone) values (1005, '79094562309');
insert into de11an.kore_cli_phones (client_id, phone) values (1006, '79284871239');
insert into de11an.kore_cli_phones (client_id, phone) values (1007, '79996392543');
insert into de11an.kore_cli_phones (client_id, phone) values (1008, '79184572385');
insert into de11an.kore_cli_phones (client_id, phone) values (1009, '79994444444');
insert into de11an.kore_cli_phones (client_id, phone) values (1010, '79247563251');
insert into de11an.kore_cli_phones (client_id, phone) values (1010, '79296473921');
insert into de11an.kore_cli_phones (client_id, phone) values (1010, '79053628495');
insert into de11an.kore_cli_phones (client_id, phone) values (1012, '77777777777');
insert into de11an.kore_cli_phones (client_id, phone) values (1012, '70000000000');
insert into de11an.kore_cli_phones (client_id, phone) values (1013, '79094509150');
insert into de11an.kore_cli_phones (client_id, phone) values (1014, '79015472677');
insert into de11an.kore_cli_phones (client_id, phone) values (1015, '78301735475');
insert into de11an.kore_cli_phones (client_id, phone) values (1016, '78923518496');
insert into de11an.kore_cli_phones (client_id, phone) values (1016, '79183546373');

CREATE TABLE de11an.kore_shop (
	shop_id integer NOT NULL PRIMARY KEY,
	title varchar(50) NOT NULL,
	address varchar(50) NOT NULL
);
insert into de11an.kore_shop (shop_id, title, address) values (5003, 'Бэст-Авто', 'ул. Ленина 129');
insert into de11an.kore_shop (shop_id, title, address) values (5004, 'Мир Авто', 'пл. Победы 18');
insert into de11an.kore_shop (shop_id, title, address) values (5008, 'CrazyAuto', 'ул. Мопра 35а');
insert into de11an.kore_shop (shop_id, title, address) values (5014, 'Автогород', 'пр-кт Мира 845');
insert into de11an.kore_shop (shop_id, title, address) values (5019, 'ХЗ', 'ул. Московская 53');

CREATE TABLE de11an.kore_seller (
	seller_id integer NOT NULL PRIMARY KEY,
	fName varchar(50) NOT NULL,
	lName varchar(50) NOT NULL,
	birthday date NOT NULL,
	shop_id integer NOT NULL,
	CONSTRAINT kore_seller_fk FOREIGN KEY (shop_id) REFERENCES de11an.kore_shop (shop_id)
);
insert into de11an.kore_seller (seller_id, fName, lName, birthday, shop_id) values (5730, 'Сергей', 'Иванов', '1987-03-12', 5003);
insert into de11an.kore_seller (seller_id, fName, lName, birthday, shop_id) values (5731, 'Александр', 'Фролов', '1990-06-24', 5014);
insert into de11an.kore_seller (seller_id, fName, lName, birthday, shop_id) values (5732, 'Наталья', 'Матвиенко', '1982-08-18', 5003);
insert into de11an.kore_seller (seller_id, fName, lName, birthday, shop_id) values (5733, 'Евгений', 'Гришко', '1999-12-31', 5004);
insert into de11an.kore_seller (seller_id, fName, lName, birthday, shop_id) values (5734, 'Иван', 'Царевич', '1981-06-20', 5019);
insert into de11an.kore_seller (seller_id, fName, lName, birthday, shop_id) values (5735, 'Майкл', 'Маус', '1989-09-04', 5003);
insert into de11an.kore_seller (seller_id, fName, lName, birthday, shop_id) values (5736, 'Алла', 'Михеева', '1982-10-10', 5014);
insert into de11an.kore_seller (seller_id, fName, lName, birthday, shop_id) values (5737, 'Бэн', 'Биг', '1992-11-03', 5008);
insert into de11an.kore_seller (seller_id, fName, lName, birthday, shop_id) values (5738, 'Антон', 'Выломов', '1988-02-21', 5008);

CREATE TABLE de11an.kore_sel_phones (
	seller_id integer NOT NULL,
	phone varchar(15) NOT NULL,
	CONSTRAINT kore_sel_phones_fk FOREIGN KEY (seller_id) REFERENCES de11an.kore_seller (seller_id)
);
insert into de11an.kore_sel_phones (seller_id, phone) values (5730, '79016374829');
insert into de11an.kore_sel_phones (seller_id, phone) values (5731, '79083416372');
insert into de11an.kore_sel_phones (seller_id, phone) values (5732, '79247584911');
insert into de11an.kore_sel_phones (seller_id, phone) values (5733, '79182273664');
insert into de11an.kore_sel_phones (seller_id, phone) values (5733, '79227469156');
insert into de11an.kore_sel_phones (seller_id, phone) values (5734, '79374511011');
insert into de11an.kore_sel_phones (seller_id, phone) values (5734, '79335491647');
insert into de11an.kore_sel_phones (seller_id, phone) values (5735, '79348601658');
insert into de11an.kore_sel_phones (seller_id, phone) values (5735, '79352856200');
insert into de11an.kore_sel_phones (seller_id, phone) values (5736, '79361174332');
insert into de11an.kore_sel_phones (seller_id, phone) values (5737, '79372255104');
insert into de11an.kore_sel_phones (seller_id, phone) values (5738, '79386142078');
insert into de11an.kore_sel_phones (seller_id, phone) values (5738, '79374192316');

CREATE TABLE de11an.kore_auto_brand (
	brand_id integer NOT NULL PRIMARY KEY,
	brand varchar(50) NOT NULL
);
insert into de11an.kore_auto_brand (brand_id, brand) values (1202, 'hyundai');
insert into de11an.kore_auto_brand (brand_id, brand) values (2031, 'kia');
insert into de11an.kore_auto_brand (brand_id, brand) values (3054, 'BMW');
insert into de11an.kore_auto_brand (brand_id, brand) values (4317, 'Lada');
insert into de11an.kore_auto_brand (brand_id, brand) values (5330, 'Koenigsegg');

CREATE TABLE de11an.kore_auto_model (
	model_id integer NOT NULL PRIMARY KEY,
	model varchar(50) NOT NULL
);
insert into de11an.kore_auto_model (model_id, model) values (12005, 'solaris');
insert into de11an.kore_auto_model (model_id, model) values (12017, 'creta');
insert into de11an.kore_auto_model (model_id, model) values (12019, 'tucson');
insert into de11an.kore_auto_model (model_id, model) values (12103, 'santa fe');
insert into de11an.kore_auto_model (model_id, model) values (20012, 'rio');
insert into de11an.kore_auto_model (model_id, model) values (20014, 'cerato');
insert into de11an.kore_auto_model (model_id, model) values (20038, 'k5');
insert into de11an.kore_auto_model (model_id, model) values (30101, '3');
insert into de11an.kore_auto_model (model_id, model) values (30121, '5');
insert into de11an.kore_auto_model (model_id, model) values (30162, '7');
insert into de11an.kore_auto_model (model_id, model) values (30163, 'x5');
insert into de11an.kore_auto_model (model_id, model) values (30165, 'x7');
insert into de11an.kore_auto_model (model_id, model) values (43001, 'Granta');
insert into de11an.kore_auto_model (model_id, model) values (43002, 'Priora');
insert into de11an.kore_auto_model (model_id, model) values (53379, 'CCXR Trevita');
insert into de11an.kore_auto_model (model_id, model) values (53392, 'Regera');

CREATE TABLE de11an.kore_auto_equipment (
	equipment_id integer NOT NULL PRIMARY KEY,
	equipment varchar(50) NOT NULL
);
insert into de11an.kore_auto_equipment (equipment_id, equipment) values (582, 'Classic');
insert into de11an.kore_auto_equipment (equipment_id, equipment) values (621, 'Comfort');
insert into de11an.kore_auto_equipment (equipment_id, equipment) values (746, 'Luxe');
insert into de11an.kore_auto_equipment (equipment_id, equipment) values (833, 'Premium');
insert into de11an.kore_auto_equipment (equipment_id, equipment) values (925, 'Limited SE');

CREATE TABLE de11an.kore_buy_sel_auto (
	transaction_id varchar(7) NOT NULL PRIMARY KEY,
	brand_id integer NOT NULL,
	model_id integer NOT NULL,
	equipment_id integer NOT NULL,
	price integer NOT NULL,
	seller_id integer NOT NULL,
	client_id integer NOT NULL,
	s_date date NOT NULL,
	CONSTRAINT kore_buy_sel_auto_fk0 FOREIGN KEY (brand_id) REFERENCES de11an.kore_auto_brand (brand_id),
	CONSTRAINT kore_buy_sel_auto_fk1 FOREIGN KEY (model_id) REFERENCES de11an.kore_auto_model (model_id),
	CONSTRAINT kore_buy_sel_auto_fk2 FOREIGN KEY (equipment_id) REFERENCES de11an.kore_auto_equipment (equipment_id),
	CONSTRAINT kore_buy_sel_auto_fk3 FOREIGN KEY (seller_id) REFERENCES de11an.kore_seller (seller_id),
	CONSTRAINT kore_buy_sel_auto_fk4 FOREIGN KEY (client_id) REFERENCES de11an.kore_client (client_id)
);
insert into de11an.kore_buy_sel_auto (transaction_id, brand_id, model_id, equipment_id, price, seller_id, client_id, s_date) 
values ('a-00237', 1202, 12005, 582, 980, 5730, 1004, '2022-11-01');
insert into de11an.kore_buy_sel_auto (transaction_id, brand_id, model_id, equipment_id, price, seller_id, client_id, s_date) 
values ('a-00238', 4317, 43001, 582, 975, 5738, 1005, '2022-11-03');
insert into de11an.kore_buy_sel_auto (transaction_id, brand_id, model_id, equipment_id, price, seller_id, client_id, s_date) 
values ('a-00239', 1202, 12005, 621, 1050, 5737, 1007, '2022-11-03');
insert into de11an.kore_buy_sel_auto (transaction_id, brand_id, model_id, equipment_id, price, seller_id, client_id, s_date) 
values ('a-00240', 3054, 30163, 621, 2937, 5731, 1014, '2022-11-07');
insert into de11an.kore_buy_sel_auto (transaction_id, brand_id, model_id, equipment_id, price, seller_id, client_id, s_date) 
values ('a-00241', 2031, 20012, 582, 1012, 5734, 1006, '2022-11-09');
insert into de11an.kore_buy_sel_auto (transaction_id, brand_id, model_id, equipment_id, price, seller_id, client_id, s_date) 
values ('a-00242', 2031, 20038, 746, 3590, 5738, 1016, '2022-11-09');
insert into de11an.kore_buy_sel_auto (transaction_id, brand_id, model_id, equipment_id, price, seller_id, client_id, s_date) 
values ('a-00243', 3054, 30101, 621, 2011, 5732, 1009, '2022-11-14');
insert into de11an.kore_buy_sel_auto (transaction_id, brand_id, model_id, equipment_id, price, seller_id, client_id, s_date) 
values ('a-00244', 3054, 30121, 746, 3489, 5737, 1007, '2022-11-16');
insert into de11an.kore_buy_sel_auto (transaction_id, brand_id, model_id, equipment_id, price, seller_id, client_id, s_date) 
values ('a-00245', 1202, 12017, 582, 1370, 5731, 1004, '2022-11-17');

select * from de11an.kore_buy_sel_auto
