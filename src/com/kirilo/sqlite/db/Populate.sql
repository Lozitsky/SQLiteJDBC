INSERT INTO Car (id, car_type_id, model_id, transmission_id, drivetrain_id, capacity, vehicle_id) VALUES (1, 3, 1, 2, 1, 4, 2);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, drivetrain_id, capacity, vehicle_id) VALUES (2, 1, 2, 1, 2, 4, 3);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, drivetrain_id, capacity, vehicle_id) VALUES (3, 7, 3, 3, 4, 3, 4);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, drivetrain_id, capacity, vehicle_id) VALUES (4, 8, 4, 4, 2, 2.6, 1);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, drivetrain_id, capacity, vehicle_id) VALUES (5, 3, 11, 2, 1, 2.5, 5);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, drivetrain_id, capacity, vehicle_id) VALUES (36, 8, 4, 3, 3, 3.5, 41);

INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (1, 'SUV', 'Позашляховик');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (2, 'Truck', 'Пікап');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (3, 'Sedan', 'Седан');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (4, 'Van', 'Фургон');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (5, 'Couple', 'Купе');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (6, 'Wagon', 'Універсал');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (7, 'Convertible', 'Кабріолет');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (8, 'Sports Car', 'Спортивна машина');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (9, 'Diesel', 'Дизель');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (10, 'Crossover', 'Кросовер');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (11, 'Luxury Car', 'Розкішний автомобіль');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (12, 'Hybride/Electric', 'Гібридні/Електричні');
INSERT INTO dir_CarType (id, name_en, name_ua) VALUES (13, 'Certified Pre-Owned', 'Сертифікований б/в');

INSERT INTO dir_Color (id, name_en, name_ua) VALUES (1, 'blue', 'синій');
INSERT INTO dir_Color (id, name_en, name_ua) VALUES (2, 'red', 'червоний');
INSERT INTO dir_Color (id, name_en, name_ua) VALUES (3, 'green', 'зелений');

INSERT INTO dir_Condition (id, name_en, name_ua) VALUES (1, 'New', 'Новий');
INSERT INTO dir_Condition (id, name_en, name_ua) VALUES (2, 'Used', 'Вживаний');

INSERT INTO dir_Currency (id, name_en, name_ua, shortname_en, shortname_ua) VALUES (1, 'Dollar', 'Долар США', 'USD', 'USD');
INSERT INTO dir_Currency (id, name_en, name_ua, shortname_en, shortname_ua) VALUES (2, 'Euro', 'Євро', 'EUR', 'EUR');
INSERT INTO dir_Currency (id, name_en, name_ua, shortname_en, shortname_ua) VALUES (3, 'Hryvnia', 'Гривня', 'UAH', 'ГРН');

INSERT INTO dir_Drivetrain (id, name_en, name_ua) VALUES (1, 'Front Wheel Drive', 'Передній привід');
INSERT INTO dir_Drivetrain (id, name_en, name_ua) VALUES (2, 'Rear Wheel Drive', 'Задній привід');
INSERT INTO dir_Drivetrain (id, name_en, name_ua) VALUES (3, 'Four Wheel Drive', 'Чотирьох привідний');
INSERT INTO dir_Drivetrain (id, name_en, name_ua) VALUES (4, 'All-Wheel Drive', 'Повнопривідний');

INSERT INTO dir_Make (id, name_en, name_ua) VALUES (1, 'Acura', 'Acura');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (2, 'Alfa Romeo', 'Alfa Romeo');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (3, 'Aston Martin', 'Aston Martin');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (4, 'Audi', 'Audi');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (5, 'Bentley', 'Bentley');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (6, 'BMW', 'BMW');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (7, 'Buick', 'Buick');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (8, 'Cadillac', 'Cadillac');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (9, 'Chevrolet', 'Chevrolet');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (10, 'Chrysler', 'Chrysler');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (11, 'Daewoo', 'Daewoo');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (12, 'Dodge', 'Dodge');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (13, 'FIAT', 'FIAT');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (14, 'Fisker', 'Fisker');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (15, 'Ford', 'Ford');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (16, 'Genesis', 'Genesis');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (17, 'Honda', 'Honda');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (18, 'Hyundai', 'Hyundai');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (19, 'INFINITI', 'INFINITI');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (20, 'Jaguar', 'Jaguar');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (21, 'Jeep', 'Jeep');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (22, 'Karma Automotive', 'Karma Automotive');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (23, 'Kia', 'Kia');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (24, 'Lexus', 'Lexus');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (25, 'Lincoln', 'Lincoln');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (26, 'Maserati', 'Maserati');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (27, 'Maybach', 'Maybach');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (28, 'Mazda', 'Mazda');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (29, 'Mercedes-Benz', 'Mercedes-Benz');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (30, 'Mercury', 'Mercury');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (31, 'MINI', 'MINI');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (32, 'Mitsubishi', 'Mitsubishi');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (33, 'Nissan', 'Nissan');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (34, 'Oldsmobile', 'Oldsmobile');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (35, 'Plymouth', 'Plymouth');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (36, 'Pontiac', 'Pontiac');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (37, 'Porsche', 'Porsche');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (38, 'Rolls-Royce', 'Rolls-Royce');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (39, 'Saab', 'Saab');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (40, 'Saturn', 'Saturn');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (41, 'Scion', 'Scion');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (42, 'Subaru', 'Subaru');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (43, 'Suzuki', 'Suzuki');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (44, 'Tesla Motors', 'Tesla Motors');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (45, 'Toyota', 'Toyota');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (46, 'Volkswagen', 'Volkswagen');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (47, 'Volvo', 'Volvo');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (48, 'Acabion', 'Acabion');
INSERT INTO dir_Make (id, name_en, name_ua) VALUES (49, 'Aprilia', 'Aprilia');

INSERT INTO dir_Model (id, name_en, name_ua) VALUES (1, 'ILX', 'ILX');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (2, 'Giulia', 'Giulia');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (3, 'Vanquish', 'Vanquish');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (4, 'A4', 'A4');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (5, 'Mulsanne', 'Mulsanne');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (6, '4 Series', '4 Series');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (7, 'Regal Sportback', 'Regal Sportback');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (8, 'XT5', 'XT5');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (9, 'Corvette', 'Corvette');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (10, 'Pacifica', 'Pacifica');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (11, 'Lanos', 'Ланос');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (12, 'GTBO 55', 'GTBO 55');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (13, 'Caponord 1200', 'Caponord 1200');
INSERT INTO dir_Model (id, name_en, name_ua) VALUES (14, 'F 800 ST Touring', 'F 800 ST Touring');

INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (1, 'Sport', 'Спортивний');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (2, 'Sport touring', 'Спортивно-туристичний');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (3, 'Touring', 'Туристичний');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (4, 'Custom / cruiser', 'Спеціальний / крейсер');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (5, 'Trial', 'Пробний');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (6, 'Enduro / offroad', 'Позашляховик');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (7, 'Cross / motocross', 'Кросовий / мотокросовий');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (8, 'Super motard', 'Супермото');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (9, 'Naked bike', 'Без оптікачів');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (10, 'Classic', 'Класичний');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (11, 'Scooter', 'Скутер');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (12, 'Allround', 'Універсальний');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (13, 'Minibike, cross', 'Міні крос');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (14, 'Minibike, sport', 'Міні спорт');
INSERT INTO dir_MotorcycleType (id, name_en, name_ua) VALUES (15, 'Prototype / concept model', 'Прототип / концептуальна модель');

INSERT INTO dir_Transmission (id, name_en, name_ua) VALUES (1, 'Automatic Transmission', 'Автоматична');
INSERT INTO dir_Transmission (id, name_en, name_ua) VALUES (2, 'Manual Transmission', 'Механічна');
INSERT INTO dir_Transmission (id, name_en, name_ua) VALUES (3, 'Automated Manual Transmission', 'Комбінована');
INSERT INTO dir_Transmission (id, name_en, name_ua) VALUES (4, 'Continuously Variable Transmission', 'Безступенева');

INSERT INTO dir_VehicleType (id, name_en, name_ua, table_name) VALUES (1, 'Car', 'Автомобіль', 'Car');
INSERT INTO dir_VehicleType (id, name_en, name_ua, table_name) VALUES (2, 'Motorcycle', 'Мотоцикл', 'Motorcycle');

INSERT INTO "Make&Models" (make_id, model_id, id) VALUES (1, 1, 1);
INSERT INTO "Make&Models" (make_id, model_id, id) VALUES (2, 2, 2);
INSERT INTO "Make&Models" (make_id, model_id, id) VALUES (3, 3, 3);
INSERT INTO "Make&Models" (make_id, model_id, id) VALUES (4, 4, 4);
INSERT INTO "Make&Models" (make_id, model_id, id) VALUES (5, 5, 5);
INSERT INTO "Make&Models" (make_id, model_id, id) VALUES (6, 6, 6);
INSERT INTO "Make&Models" (make_id, model_id, id) VALUES (7, 7, 7);
INSERT INTO "Make&Models" (make_id, model_id, id) VALUES (8, 8, 8);

INSERT INTO Motorcycle (id, motorcycle_type_id, seat_count, vehicle_id) VALUES (1, 1, 1, 42);
INSERT INTO Motorcycle (id, motorcycle_type_id, seat_count, vehicle_id) VALUES (2, 2, 2, 43);
INSERT INTO Motorcycle (id, motorcycle_type_id, seat_count, vehicle_id) VALUES (3, 3, 2, 44);

INSERT INTO Sale (id, seller_id, sale_date, vehicle_id, description) VALUES (1, 1, '2019-09-14', 1, 'коментар');
INSERT INTO Sale (id, seller_id, sale_date, vehicle_id, description) VALUES (2, 2, '2019-09-03', 2, 'олриівплріви');
INSERT INTO Sale (id, seller_id, sale_date, vehicle_id, description) VALUES (3, 3, '2019-09-09', 4, 'цкаіваіва');
INSERT INTO Sale (id, seller_id, sale_date, vehicle_id, description) VALUES (4, 3, '2019-08-08', 3, 'uihuh');
INSERT INTO Sale (id, seller_id, sale_date, vehicle_id, description) VALUES (5, 2, '2018-06-14', 2, 'k;''kl;');
INSERT INTO Sale (id, seller_id, sale_date, vehicle_id, description) VALUES (6, 2, '2019-09-15', 5, 'Lanos');
INSERT INTO Sale (id, seller_id, sale_date, vehicle_id, description) VALUES (7, 3, '2019-09-12', 5, 'yui6uy7iuy');
INSERT INTO Sale (id, seller_id, sale_date, vehicle_id, description) VALUES (8, 1, '2019-09-16', 4, 'rghdfdhdf');

INSERT INTO Seller (id, full_name, birthday) VALUES (1, 'Jone Smith', '1989-06-15');
INSERT INTO Seller (id, full_name, birthday) VALUES (2, 'Edward Snowden', '1980-09-09');
INSERT INTO Seller (id, full_name, birthday) VALUES (3, 'Jone Full', '1989-12-14');
INSERT INTO Seller (id, full_name, birthday) VALUES (7, 'Will Smith', '1975-10-10');

INSERT INTO Vehicle (id, make_id, price, currency_id, condition_id, color_id, issue_year, vehicle_type_id, description) VALUES (1, 1, 5000, 1, 1, 1, '2015-09-16', 1, null);
INSERT INTO Vehicle (id, make_id, price, currency_id, condition_id, color_id, issue_year, vehicle_type_id, description) VALUES (2, 2, 2000, 1, 1, 2, '2016-06-02', 1, null);
INSERT INTO Vehicle (id, make_id, price, currency_id, condition_id, color_id, issue_year, vehicle_type_id, description) VALUES (3, 3, 3000, 1, 1, 3, '2017-06-28', 1, null);
INSERT INTO Vehicle (id, make_id, price, currency_id, condition_id, color_id, issue_year, vehicle_type_id, description) VALUES (4, 4, 5000, 1, 1, 2, '2017-03-02', 1, null);
INSERT INTO Vehicle (id, make_id, price, currency_id, condition_id, color_id, issue_year, vehicle_type_id, description) VALUES (5, 11, 500, 1, 2, 1, '2009-06-10', 1, '');
INSERT INTO Vehicle (id, make_id, price, currency_id, condition_id, color_id, issue_year, vehicle_type_id, description) VALUES (41, 1, 3500, 1, 1, 1, '2019-02-17', 1, null);
INSERT INTO Vehicle (id, make_id, price, currency_id, condition_id, color_id, issue_year, vehicle_type_id, description) VALUES (42, 48, 5000, 1, 1, 2, '2007-09-12', 2, 'Top speed:	466.7 km/h');
INSERT INTO Vehicle (id, make_id, price, currency_id, condition_id, color_id, issue_year, vehicle_type_id, description) VALUES (43, 49, 6000, 1, 1, 1, '2018-06-06', 2, null);
INSERT INTO Vehicle (id, make_id, price, currency_id, condition_id, color_id, issue_year, vehicle_type_id, description) VALUES (44, 6, 3500, 1, 1, 1, '2012-07-13', 2, null);

