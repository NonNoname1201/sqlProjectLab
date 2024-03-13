create table kategorie
(
    id               int auto_increment
        primary key,
    name             varchar(30) not null,
    parentCategoryID int         null,
    constraint id
        unique (id),
    constraint kategorie_ibfk_1
        foreign key (parentCategoryID) references kategorie (id)
);

create index parentCategoryID
    on kategorie (parentCategoryID);

create table klienci
(
    id         int auto_increment
        primary key,
    first_name varchar(30)                        not null,
    last_name  varchar(30)                        not null,
    email      varchar(100)                       not null,
    phone      varchar(13)                        not null,
    address    varchar(100)                       not null,
    city       varchar(31)                        not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    constraint email
        unique (email),
    constraint id
        unique (id),
    constraint phone
        unique (phone)
);

create table koszyki
(
    id          int auto_increment
        primary key,
    customer_id int not null,
    quantity    int not null,
    constraint id
        unique (id),
    constraint koszyki_ibfk_1
        foreign key (customer_id) references klienci (id)
);

create index customer_id
    on koszyki (customer_id);

create table kraje
(
    id   int auto_increment
        primary key,
    name varchar(30) not null,
    constraint id
        unique (id),
    constraint name
        unique (name)
);

create table marki
(
    id      int auto_increment
        primary key,
    name    varchar(30) not null,
    country int         not null,
    constraint id
        unique (id),
    constraint name
        unique (name),
    constraint marki_ibfk_1
        foreign key (country) references kraje (id)
);

create index country
    on marki (country);

create table metodyplatnosci
(
    id          int auto_increment
        primary key,
    name        varchar(255) not null,
    description text         not null,
    constraint id
        unique (id),
    constraint name
        unique (name)
);

create table pracownicy
(
    id          int auto_increment
        primary key,
    first_name  varchar(30)  not null,
    fast_name   varchar(30)  not null,
    position    varchar(30)  not null,
    email       varchar(100) not null,
    phone       varchar(13)  not null,
    hire_date   date         not null,
    hourly_rate decimal      not null,
    constraint email
        unique (email),
    constraint id
        unique (id),
    constraint phone
        unique (phone)
);

create table produkty
(
    id             int auto_increment
        primary key,
    name           varchar(30)    not null,
    brand_id       int            not null,
    category_id    int            null,
    description    text           not null,
    price          decimal(10, 2) not null,
    stock_quantity int            not null,
    warranty       varchar(300)   not null,
    constraint id
        unique (id),
    constraint produkty_ibfk_1
        foreign key (brand_id) references marki (id),
    constraint produkty_ibfk_2
        foreign key (category_id) references kategorie (id)
);

create table ocenaproduktu
(
    id          int auto_increment
        primary key,
    product_id  int            not null,
    client_id   int            null,
    rating      decimal(10, 2) null,
    description text           not null,
    constraint id
        unique (id),
    constraint ocenaproduktu_ibfk_1
        foreign key (product_id) references produkty (id),
    constraint ocenaproduktu_ibfk_2
        foreign key (client_id) references klienci (id)
);

create index client_id
    on ocenaproduktu (client_id);

create index product_id
    on ocenaproduktu (product_id);

create table productwkoszyku
(
    id         int auto_increment
        primary key,
    cart_id    int     not null,
    product_id int     not null,
    quantity   int     not null,
    price      decimal not null,
    constraint id
        unique (id),
    constraint productwkoszyku_ibfk_1
        foreign key (cart_id) references koszyki (id),
    constraint productwkoszyku_ibfk_2
        foreign key (product_id) references produkty (id)
);

create index cart_id
    on productwkoszyku (cart_id);

create index product_id
    on productwkoszyku (product_id);

create index brand_id
    on produkty (brand_id);

create index category_id
    on produkty (category_id);

create table punktylojalnosciowe
(
    id          int auto_increment
        primary key,
    customer_id int  not null,
    points      int  not null,
    expiry_date date not null,
    constraint id
        unique (id),
    constraint punktylojalnosciowe_ibfk_1
        foreign key (customer_id) references klienci (id)
);

create index customer_id
    on punktylojalnosciowe (customer_id);

create table sklepy
(
    id      int auto_increment
        primary key,
    name    varchar(30) not null,
    address varchar(30) not null,
    city    varchar(30) not null,
    country varchar(30) not null,
    constraint address
        unique (address),
    constraint id
        unique (id)
);

create table uzytkownicy
(
    id          int auto_increment
        primary key,
    customer_id int                    null,
    employee_id int                    null,
    username    varchar(30)            not null,
    password    varchar(32)            not null,
    role        enum ('admin', 'user') null,
    constraint customer_id
        unique (customer_id),
    constraint employee_id
        unique (employee_id),
    constraint id
        unique (id),
    constraint username
        unique (username),
    constraint uzytkownicy_ibfk_1
        foreign key (customer_id) references klienci (id),
    constraint uzytkownicy_ibfk_2
        foreign key (employee_id) references pracownicy (id)
);

create table zamowienia
(
    id          int auto_increment
        primary key,
    customer_id int                                       not null,
    store_id    int                                       not null,
    orderDate   datetime                                  not null,
    shipDate    datetime                                  null,
    status      enum ('pending', 'shipping', 'delivered') not null,
    totalAmount decimal(38, 3)                            not null,
    constraint id
        unique (id),
    constraint zamowienia_ibfk_1
        foreign key (customer_id) references klienci (id),
    constraint zamowienia_ibfk_2
        foreign key (store_id) references sklepy (id)
);

create table produktwzamowieniu
(
    id         int auto_increment
        primary key,
    order_id   int            not null,
    product_id int            not null,
    quantity   int            not null,
    price      decimal(10, 2) not null,
    constraint id
        unique (id),
    constraint produktwzamowieniu_ibfk_1
        foreign key (order_id) references zamowienia (id),
    constraint produktwzamowieniu_ibfk_2
        foreign key (product_id) references produkty (id)
);

create index order_id
    on produktwzamowieniu (order_id);

create index product_id
    on produktwzamowieniu (product_id);

create table transakcje
(
    id               int auto_increment
        primary key,
    order_id         int            not null,
    paymentMethod_id int            not null,
    amount           decimal(10, 2) not null,
    transaction_date datetime       not null,
    constraint id
        unique (id),
    constraint transakcje_ibfk_1
        foreign key (order_id) references zamowienia (id),
    constraint transakcje_ibfk_2
        foreign key (paymentMethod_id) references metodyplatnosci (id)
);

create index order_id
    on transakcje (order_id);

create index paymentMethod_id
    on transakcje (paymentMethod_id);

create index customer_id
    on zamowienia (customer_id);

create index store_id
    on zamowienia (store_id);

