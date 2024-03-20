create table Cities
(
    /*
Cities (Cities):
CityID (INT, PRIMARY KEY, NOT NULL)
Name (VARCHAR, NOT NULL, UNIQUE)
CountryID (INT, FOREIGN KEY REFERENCES Countries(CountryID), NOT NULL)
    */
    id         int primary key not null auto_increment,
    name       varchar(90)     not null unique,
    country_id int             not null,
    foreign key (country_id) references countries (id)
);