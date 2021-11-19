create table if not exists genre (
    id serial primary key,
    title varchar(300)
);

create table if not exists singer
(
    id serial primary key,
    singer_name varchar(100)
);

create table if not exists singer_genre
(
    id serial primary key,
    singer_id integer references singer (id),
    genre_id integer references genre (id)
);

create table if not exists album
(
    id serial primary key,
    title varchar(300),
    year_release integer,
);

create table if not exists singer_album
(
    id serial primary key,
    singer_id integer references singer (id),
    album_id integer references album (id)
);

create table if not exists track
(
    id serial primary key,
    title varchar(300),
    duration integer check (duration > 0),
    album_id integer references album (id)
);

create table if not exists list_collections
(
    id serial primary key,
    collection_title varchar(300),
    release_year integer check (release_year > 0)
);

create table if not exists collection
(
    id serial primary key,
    collection_id integer references collection (id),
    track_id integer references track (id)
);