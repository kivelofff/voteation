DROP TABLE IF EXISTS vote;
DROP TABLE IF EXISTS dish;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE GLOBAL_SEQ START WITH 100000;

CREATE TABLE restaurant
(
    id          BIGINT DEFAULT GLOBAL_SEQ.nextval PRIMARY KEY,
    name        VARCHAR(255)            NOT NULL,
    address     VARCHAR(255)            NOT NULL,
    CONSTRAINT restaurant_unique_address_idx UNIQUE (address)
);

CREATE TABLE users
(
    id          BIGINT DEFAULT GLOBAL_SEQ.nextval PRIMARY KEY,
    name        VARCHAR(255)            NOT NULL,
    email       VARCHAR(255)            NOT NULL,
    password    VARCHAR(255)            NOT NULL,
    CONSTRAINT user_unique_email_idx UNIQUE (email),
);

CREATE TABLE user_roles
(
    user_id BIGINT NOT NULL,
    role    VARCHAR(255),
    CONSTRAINT user_unique_roles_idx UNIQUE (user_id, role),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE dish
(
  id            BIGINT DEFAULT GLOBAL_SEQ.nextval PRIMARY KEY,
  name          VARCHAR(255)            NOT NULL,
  price         REAL                    NOT NULL,
  restaurant_id BIGINT                  NOT NULL,
  day           DATE                    NOT NULL,
  CONSTRAINT dish_unique_restaurant_name_day_idx UNIQUE (restaurant_id, name, day),
  FOREIGN KEY (restaurant_id) REFERENCES restaurant (id) ON DELETE CASCADE
);

CREATE TABLE vote
(
  id            BIGINT DEFAULT GLOBAL_SEQ.nextval PRIMARY KEY,
  day           DATE                    NOT NULL,
  user_id       BIGINT                  NOT NULL,
  restaurant_id BIGINT                  NOT NULL,
  CONSTRAINT vote_unique_user_day_idx UNIQUE (user_id, day),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (restaurant_id) REFERENCES restaurant (id) ON DELETE CASCADE
);



