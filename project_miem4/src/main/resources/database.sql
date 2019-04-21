-- Table: users
CREATE TABLE users (
                     id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
                     username VARCHAR(255) NOT NULL,
                     password VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB;

-- Table: roles
CREATE TABLE roles (
                     id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
                     name VARCHAR(100) NOT NULL
)
  ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
                          user_id INT NOT NULL,
                          role_id INT NOT NULL,

                          FOREIGN KEY (user_id) REFERENCES users (id),
                          FOREIGN KEY (role_id) REFERENCES roles (id),

                          UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;




CREATE TABLE queries(
                      id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      text VARCHAR(10000) NOT NULL)

  ENGINE = InnoDB;


CREATE TABLE diagramtype(
                          id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          text VARCHAR(10000) NOT NULL)

  ENGINE = InnoDB;

CREATE TABLE diagrams (
                        id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        queries_id INT NOT NULL ,
                        type_id INT NOT NULL ,
                        FOREIGN KEY (queries_id) REFERENCES queries (id),
                        FOREIGN KEY (type_id) REFERENCES diagramtype (id),
                        legendX VARCHAR(250) NOT NULL,
                        legendY  VARCHAR(250) NOT NULL,
                        color VARCHAR(250) NOT NULL,
                        name VARCHAR(250) NOT NULL
)
  ENGINE = InnoDB;


CREATE TABLE tables (
                      id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      queries_id INT NOT NULL ,
                      FOREIGN KEY (queries_id) REFERENCES queries (id),
                      border  VARCHAR(250) NOT NULL,
                      color VARCHAR(250) NOT NULL,
                      name VARCHAR(250) NOT NULL
)
  ENGINE = InnoDB;

create view v_source as
  select id, 'table' type
  from tables
  union all
  select id, 'diagram' type
  from diagrams ;


CREATE TABLE reports(
                      id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(255) NOT NULL,
                      create_date date,
                      create_user_id INT NOT NULL ,
                      FOREIGN KEY (create_user_id) REFERENCES users (id),
                      url VARCHAR(255) NOT NULL
)

  ENGINE = InnoDB;

CREATE TABLE reportlogs(
                         report_id       INT          NOT NULL,
                         user_id       INT          NOT NULL,
                         update_date datetime,
                         FOREIGN KEY (user_id) REFERENCES users (id),
                         FOREIGN KEY (report_id) REFERENCES reports (id),
                         event VARCHAR(255) NOT NULL
)

  ENGINE = InnoDB;

CREATE TABLE report2source(
                            report_id       INT          NOT NULL,
                            source_id       INT          NOT NULL,
                            FOREIGN KEY (report_id) REFERENCES reports (id),
                            x int not null,
                            y int not null
)

  ENGINE = InnoDB;


-- Insert data



INSERT INTO users VALUES (1, 'user', '1234');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);



