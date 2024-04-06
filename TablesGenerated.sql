create table categories
(
    id                 int auto_increment
        primary key,
    name               varchar(50) not null,
    parent_category_id int         null,
    constraint id
        unique (id),
    constraint name
        unique (name),
    constraint categories_ibfk_1
        foreign key (parent_category_id) references categories (id)
);

create index parent_category_id
    on categories (parent_category_id);

create table countries
(
    id   int auto_increment
        primary key,
    name varchar(60) not null,
    constraint name
        unique (name)
);

create table cities
(
    id         int auto_increment
        primary key,
    name       varchar(90) not null,
    country_id int         not null,
    constraint name
        unique (name),
    constraint cities_ibfk_1
        foreign key (country_id) references countries (id)
);

create table addresses
(
    id          int          not null
        primary key,
    postal_code varchar(5)   not null,
    street      varchar(255) not null,
    city_id     int          not null,
    state       varchar(100) null,
    constraint addresses_ibfk_1
        foreign key (city_id) references cities (id)
);

create index city_id
    on addresses (city_id);

create table brands
(
    id          int auto_increment
        primary key,
    name        varchar(30) not null,
    description text        not null,
    address_id  int         null,
    constraint id
        unique (id),
    constraint name
        unique (name),
    constraint brands_ibfk_1
        foreign key (address_id) references addresses (id)
);

create index address_id
    on brands (address_id);

create index country_id
    on cities (country_id);

create table customers
(
    id         int auto_increment
        primary key,
    first_name varchar(30) not null,
    last_name  varchar(30) not null,
    email      varchar(50) null,
    phone      varchar(15) not null,
    address_id int         not null,
    constraint address_id
        unique (address_id),
    constraint email
        unique (email),
    constraint phone
        unique (phone),
    constraint customers_ibfk_1
        foreign key (address_id) references addresses (id)
);

create table payment_methods
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

create table checkouts
(
    id                int      not null
        primary key,
    customer_id       int      not null,
    payment_method_id int      not null,
    total_amount      decimal  not null,
    checkout_date     datetime not null,
    constraint checkouts_ibfk_1
        foreign key (customer_id) references customers (id),
    constraint checkouts_ibfk_2
        foreign key (payment_method_id) references payment_methods (id)
);

create index customer_id
    on checkouts (customer_id);

create index payment_method_id
    on checkouts (payment_method_id);

create table positions
(
    id          int auto_increment
        primary key,
    name        varchar(255) not null,
    description text         not null,
    constraint name
        unique (name)
);

create table employees
(
    id          int auto_increment
        primary key,
    name        varchar(30) not null,
    surname     varchar(30) not null,
    position_id int         not null,
    email       varchar(30) not null,
    phone       varchar(13) not null,
    hire_date   date        not null,
    hourly_rate decimal     not null,
    constraint employees_ibfk_1
        foreign key (position_id) references positions (id)
);

create index position_id
    on employees (position_id);

create table products
(
    id          int            not null
        primary key,
    name        varchar(30)    not null,
    brand_id    int            not null,
    category_id int            not null,
    description text           not null,
    price       decimal(10, 2) not null,
    constraint id
        unique (id),
    constraint products_ibfk_1
        foreign key (brand_id) references brands (id),
    constraint products_ibfk_2
        foreign key (category_id) references categories (id)
);

create table checkout_products
(
    id          int not null
        primary key,
    checkout_id int not null,
    product_id  int not null,
    quantity    int not null,
    constraint checkout_products_ibfk_1
        foreign key (checkout_id) references checkouts (id),
    constraint checkout_products_ibfk_2
        foreign key (product_id) references products (id)
);

create index checkout_id
    on checkout_products (checkout_id);

create index product_id
    on checkout_products (product_id);

create index brand_id
    on products (brand_id);

create index category_id
    on products (category_id);

create table promotions
(
    id         int auto_increment
        primary key,
    product_id int            not null,
    discount   decimal(10, 2) not null,
    start_date date           not null,
    end_date   date           null,
    constraint id
        unique (id),
    constraint product_id
        unique (product_id),
    constraint promotions_ibfk_1
        foreign key (product_id) references products (id)
);

create table stores
(
    id               int auto_increment
        primary key,
    name             varchar(30)                                   not null,
    address_id       varchar(255)                                  not null,
    store_manager_id int                                           not null,
    state            enum ('open', 'closed', 'under construction') not null,
    constraint address_id
        unique (address_id),
    constraint id
        unique (id)
);

create table product_in_stock
(
    id         int not null
        primary key,
    product_id int not null,
    store_id   int not null,
    quantity   int not null,
    constraint id
        unique (id),
    constraint product_in_stock_ibfk_1
        foreign key (product_id) references products (id),
    constraint product_in_stock_ibfk_2
        foreign key (store_id) references stores (id)
);

create index product_id
    on product_in_stock (product_id);

create index store_id
    on product_in_stock (store_id);

create table total_product_rating
(
    id           int           not null
        primary key,
    product_id   int           not null,
    total_rating decimal(5, 1) not null,
    total_votes  int           not null,
    constraint id
        unique (id),
    constraint product_id
        unique (product_id),
    constraint total_product_rating_ibfk_1
        foreign key (product_id) references products (id)
);

create table users
(
    id         int auto_increment
        primary key,
    username   varchar(30)            not null,
    password   varchar(32)            not null,
    email      varchar(45)            not null,
    phone      varchar(15)            null,
    address_id int                    not null,
    role       enum ('admin', 'user') not null,
    constraint address_id
        unique (address_id),
    constraint email
        unique (email),
    constraint id
        unique (id),
    constraint phone
        unique (phone),
    constraint username
        unique (username),
    constraint users_ibfk_1
        foreign key (address_id) references addresses (id)
);

create table cart_products
(
    id         int auto_increment
        primary key,
    user_id    int not null,
    product_id int not null,
    quantity   int not null,
    constraint id
        unique (id),
    constraint cart_products_ibfk_1
        foreign key (user_id) references users (id),
    constraint cart_products_ibfk_2
        foreign key (product_id) references products (id)
);

create index product_id
    on cart_products (product_id);

create index user_id
    on cart_products (user_id);

create table orders
(
    id         int auto_increment
        primary key,
    user_id    int                                       not null,
    order_date datetime                                  not null,
    ship_date  datetime                                  null,
    status     enum ('pending', 'shipping', 'delivered') not null,
    constraint id
        unique (id),
    constraint orders_ibfk_1
        foreign key (user_id) references users (id)
);

create table order_products
(
    id         int auto_increment
        primary key,
    order_id   int not null,
    product_id int not null,
    quantity   int not null,
    constraint id
        unique (id),
    constraint order_products_ibfk_1
        foreign key (order_id) references orders (id),
    constraint order_products_ibfk_2
        foreign key (product_id) references products (id)
);

create index order_id
    on order_products (order_id);

create index product_id
    on order_products (product_id);

create index user_id
    on orders (user_id);

create table product_rating
(
    id          int auto_increment
        primary key,
    product_id  int           not null,
    user_id     int           not null,
    rating      decimal(3, 2) not null,
    description text          null,
    constraint id
        unique (id),
    constraint user_id
        unique (user_id),
    constraint product_rating_ibfk_1
        foreign key (product_id) references products (id),
    constraint product_rating_ibfk_2
        foreign key (user_id) references users (id)
);

create index product_id
    on product_rating (product_id);

create table transactions
(
    transaction_id    int auto_increment
        primary key,
    order_id          int      null,
    payment_method_id int      not null,
    amount            decimal  not null,
    transaction_date  datetime not null,
    constraint transaction_id
        unique (transaction_id),
    constraint transactions_ibfk_1
        foreign key (order_id) references orders (id),
    constraint transactions_ibfk_2
        foreign key (payment_method_id) references payment_methods (id)
);

create index order_id
    on transactions (order_id);

create index payment_method_id
    on transactions (payment_method_id);

