DELETE
FROM vote;
DELETE
FROM dish;
DELETE
FROM RESTAURANT;
DELETE
FROM USER_ROLES;
DELETE
FROM USERS;

ALTER SEQUENCE GLOBAL_SEQ RESTART WITH 100000;

INSERT INTO users(name, email, password)
VALUES ('Admin', 'admin@mail.ru', '{noop}admin'), //100001
       ('User', 'user@mail.ru', '{noop}user'), //100002
       ('User_1', 'user_1@mail.ru', '{noop}password}'); //100003

INSERT INTO USER_ROLES(ROLE, USER_ID)
VALUES ('ADMIN', 100001),
       ('USER', 100001),
       ('USER', 100001);

INSERT INTO restaurant(name, address)
values ('Burgerking', 'main street, 1'), //100004
       ('KFC', 'second street, 2'), //100005
       ('Mcdonalds', 'park street, 3'); //100006

INSERT INTO dish(name, price, restaurant_id, day)
VALUES ('Hamburger', 1.5, 100004, CURRENT_DATE),
       ('French fries', 1, 100004, CURRENT_DATE),
       ('Cola', 1, 100004, CURRENT_DATE),

       ('Chicken', 2.1, 100005, CURRENT_DATE),
       ('Salad', 1.6, 100005, CURRENT_DATE),
       ('Coffee', 1.1, 100005, CURRENT_DATE),

       ('Cheeseburger', 1.6, 100006, CURRENT_DATE),
       ('Potato wedges', 1.1, 100006, CURRENT_DATE),
       ('Fanta', 1.1, 100006, CURRENT_DATE);

INSERT INTO vote(day, user_id, RESTAURANT_ID)
VALUES (CURRENT_DATE, 100002, 100004),
       (CURRENT_DATE, 100003, 100006);
