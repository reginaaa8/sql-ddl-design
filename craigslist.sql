DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    preferred_region INTEGER REFERENCES regions(id)
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY, 
    title TEXT NOT NULL, 
    content TEXT NOT NULL,
    location TEXT NOT NULL,
    user_id INTEGER REFERENCES users(id),
    region_id INTEGER REFERENCES regions(id),
    category_id INTEGER REFERENCES categories(id)
);

INSERT INTO regions (name)
VALUES
('San Francisco'), 
('Atlanta'), 
('Seattle'),
('Minneapolis'), 
('Chicago');

INSERT INTO categories (name)
VALUES
('For Sale'),
('Free'),
('Meetups');

INSERT INTO users (username, password, preferred_region)
VALUES
('rsteffen', 'password123', 1), 
('bellaaaa', 'bark123', 3),
('buddy_boy', 'woof123', 2);

INSERT INTO posts (title, content, location, user_id, region_id, category_id)
VALUES ('Hello', 'This is my first post', 'Midwest', 1, 4, 3), 
('Free Couch', 'Pickup only', 'Southwest', 2, 1, 2),
('Dining Table in Good Condition', '$100 or best offer. Pickup only.', 'Corcoran', 3, 4, 1);