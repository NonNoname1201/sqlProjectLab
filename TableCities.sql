create table cities
(
    /*
Cities (Cities):
CityID (INT, PRIMARY KEY, NOT NULL)
Name (VARCHAR, NOT NULL, UNIQUE)
CountryID (INT, FOREIGN KEY REFERENCES Countries(CountryID), NOT NULL) n:1 with Countries
    */
    id         int primary key not null auto_increment,
    name       varchar(90)     not null unique,
    country_id int             not null,
    foreign key (country_id) references countries (id)
);

insert into cities (name, country_id) values ('Warsaw', 1);
insert into cities (name, country_id) values ('Krakow', 1);
insert into cities (name, country_id) values ('Gdansk', 1);
insert into cities (name, country_id) values ('Berlin', 2);
insert into cities (name, country_id) values ('Hamburg', 2);
insert into cities (name, country_id) values ('Paris', 3);