create table Seller
(
    id        INTEGER       not null
        primary key autoincrement,
    full_name NVARCHAR(200) not null,
    birthday  DATE          not null
);

create table dir_CarType
(
    id      INTEGER      not null
        primary key autoincrement
        unique,
    name_en NVARCHAR(50) not null,
    name_ua NVARCHAR(50) not null,
    unique (name_en, name_ua)
);

create table dir_Color
(
    id      INTEGER      not null
        primary key autoincrement
        unique,
    name_en NVARCHAR(50) not null,
    name_ua NVARCHAR(50) not null,
    unique (name_en, name_ua)
);

create table dir_Condition
(
    id      INTEGER      not null
        primary key autoincrement
        unique,
    name_en NVARCHAR(50) not null,
    name_ua NVARCHAR(50) not null,
    unique (name_en, name_ua)
);

create table dir_Currency
(
    id           INTEGER      not null
        primary key autoincrement
        unique,
    name_en      NVARCHAR(50) not null,
    name_ua      NVARCHAR(50) not null,
    shortname_en NVARCHAR(10) not null,
    shortname_ua NVARCHAR(10) not null,
    unique (name_en, name_ua),
    unique (shortname_en, shortname_ua)
);

create table dir_Drivetrain
(
    id      INTEGER      not null
        primary key autoincrement
        unique,
    name_en NVARCHAR(50) not null,
    name_ua NVARCHAR(50) not null,
    unique (name_en, name_ua)
);

create table dir_Make
(
    id      INTEGER      not null
        primary key autoincrement
        unique,
    name_en NVARCHAR(50) not null,
    name_ua NVARCHAR(50) not null,
    unique (name_en, name_ua)
);

create table Vehicle
(
    id              INTEGER not null
        primary key autoincrement
        unique,
    make_id         INTEGER not null
        references dir_Make
            on delete restrict,
    price           DOUBLE  not null,
    currency_id     INTEGER default 1 not null
        references dir_Currency
            on delete restrict,
    condition_id    INTEGER not null
        references dir_Condition
            on delete restrict,
    color_id        INTEGER not null
        references dir_Color
            on delete restrict,
    issue_year      DATE    not null,
    vehicle_type_id INTEGER default 1 not null,
    description     NVARCHAR(500)
);

create table Sale
(
    id          INTEGER       not null
        primary key autoincrement,
    seller_id   INTEGER       not null
        references Seller
            on delete restrict,
    sale_date   DATE          not null,
    vehicle_id  INTEGER       not null
        references Vehicle
            on delete restrict,
    description NVARCHAR(500) not null
);

create table dir_Model
(
    id      INTEGER      not null
        primary key autoincrement
        unique,
    name_en NVARCHAR(50) not null,
    name_ua NVARCHAR(50) not null,
    unique (name_en, name_ua)
);

create table "Make&Models"
(
    make_id  INTEGER not null
        references dir_Make
            on delete restrict,
    model_id INTEGER not null
        references dir_Model
            on delete restrict,
    id       INTEGER not null
        primary key autoincrement
        unique,
    unique (make_id, model_id)
);

create table dir_MotorcycleType
(
    id      INTEGER      not null
        primary key autoincrement
        unique,
    name_en NVARCHAR(50) not null,
    name_ua NVARCHAR(50) not null,
    unique (name_en, name_ua)
);

create table Motorcycle
(
    id                 INTEGER not null
        primary key autoincrement
        unique,
    motorcycle_type_id INTEGER not null
        references dir_MotorcycleType
            on delete restrict,
    seat_count         INTEGER not null,
    vehicle_id         INTEGER not null
        references Vehicle
            on delete cascade,
    unique (motorcycle_type_id, seat_count, vehicle_id)
);

create table dir_Transmission
(
    id      INTEGER      not null
        primary key autoincrement
        unique,
    name_en NVARCHAR(50) not null,
    name_ua NVARCHAR(50) not null,
    unique (name_en, name_ua)
);

create table Car
(
    id              INTEGER not null
        primary key autoincrement
        unique,
    car_type_id     INTEGER not null
        references dir_CarType
            on delete restrict,
    model_id        INTEGER not null
        references dir_Model
            on delete restrict,
    transmission_id INTEGER not null
        references dir_Transmission
            on delete restrict,
    drivetrain_id   INTEGER not null
        references dir_Drivetrain
            on delete restrict,
    capacity        DOUBLE  not null,
    vehicle_id      INTEGER not null
        unique
        references Vehicle
            on delete cascade
);

create table dir_VehicleType
(
    id         INTEGER      not null
        primary key autoincrement
        unique,
    name_en    NVARCHAR(50) not null,
    name_ua    NVARCHAR(50) not null,
    table_name NVARCHAR(50) not null,
    unique (name_en, name_ua, table_name)
);