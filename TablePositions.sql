create table positions (
    /*
Positions (Positions):
PositionID (INT, PRIMARY KEY, NOT NULL)
Name (VARCHAR, NOT NULL, UNIQUE)
Description (TEXT, NOT NULL)
      */
    id int primary key auto_increment not null,
    name varchar(255) not null unique,
    description text not null
);

insert into positions (name, description) values
('CEO', 'Chief Executive Officer'),
('CFO', 'Chief Financial Officer'),
('WM', 'Warehouse Manager'),
('SM', 'Sales Manager'),
('PM', 'Production Manager'),
('HR', 'Human Resources');