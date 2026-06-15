-- creaating the Users table

create table if not exists Users(
  user_id serial primary key,
  full_name varchar(100),
  email varchar(100) unique not null,
  role varchar(50) check (role in('Ticket Manager', 'Football Fan')),
  phone_number varchar(20)
);


-- creating the matches table
create table if not exists Matches(
  match_id serial primary key,
  fixture varchar(100),
  tournament_category varchar(100),
  base_ticket_price integer check (base_ticket_price >= 0),
  match_status varchar(30) check (match_status in ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);


-- creating the bookings table 
create table if not exists Bookings(
  booking_id serial primary key,
  user_id integer references users(user_id),
  match_id integer references matches(match_id),
  seat_number varchar(10),
  payment_status varchar(20) check (payment_status in('Pending', 'Confirmed', 'Cancelled', 'Refunded'))
);
