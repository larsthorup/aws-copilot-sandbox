create table greeting (
  id serial primary key,
  greeting text not null
);
insert into greeting (greeting) values ('hello');