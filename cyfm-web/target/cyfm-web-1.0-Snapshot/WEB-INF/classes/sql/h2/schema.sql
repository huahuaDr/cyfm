DROP TABLE IF EXISTS cy_sys_user_role;

DROP TABLE IF EXISTS cy_sys_role;

DROP TABLE IF EXISTS cy_sys_user;

DROP TABLE IF EXISTS cy_sys_user_detail;

DROP TABLE IF EXISTS cy_sys_team;

DROP TABLE IF EXISTS cy_sys_resource;

DROP TABLE IF EXISTS cy_sys_user_online;

DROP TABLE IF EXISTS cy_sys_permission;

DROP TABLE IF EXISTS cy_sys_role_resource_permission;

DROP TABLE IF EXISTS cy_sys_authorize;

DROP TABLE IF EXISTS cy_maintain_task_definition;

DROP TABLE IF EXISTS cy_datasource_manage;

DROP TABLE IF EXISTS cy_maintain_notification_data;

DROP TABLE IF EXISTS cy_maintain_notification_template;

DROP TABLE IF EXISTS fs_files;

DROP TABLE IF EXISTS properties;

DROP TABLE IF EXISTS bus_join_system;

DROP TABLE IF EXISTS bus_remote_api;

CREATE TABLE cy_sys_role (
  id          BIGINT GENERATED BY DEFAULT AS IDENTITY,
  name        VARCHAR(255) NOT NULL UNIQUE,
  value       VARCHAR(255) NOT NULL UNIQUE,
  permissions TEXT,
  description TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE cy_sys_user (
  id          BIGINT GENERATED BY DEFAULT AS IDENTITY,
  username    VARCHAR(255) NOT NULL UNIQUE,
  name        VARCHAR(64),
  password    VARCHAR(255),
  salt        VARCHAR(64),
  email       VARCHAR(128),
  tel         VARCHAR(20) UNIQUE,
  status      VARCHAR(32),
  team_ID     BIGINT,
  create_DATE DATETIME,
  deleted     INT    DEFAULT 0,
  PRIMARY KEY (id)
);

create table cy_sys_user_detail
(
  id         BIGINT GENERATED BY DEFAULT AS IDENTITY,
  real_Name  varchar(255)  null,
  gender     varchar(2)    null,
  birth_date date          null,
  province   varchar(255)  null,
  city       varchar(255)  null,
  address    varchar(3000) null,
  zip_code   varchar(10)   null,
  user_id    bigint        null,
  PRIMARY KEY (id)
);

CREATE TABLE cy_sys_user_role (
  user_id BIGINT NOT NULL,
  role_id BIGINT NOT NULL,
  PRIMARY KEY (user_id, role_id)
);

CREATE TABLE cy_sys_team (
  id        BIGINT GENERATED BY DEFAULT AS IDENTITY,
  name      VARCHAR(255) NOT NULL UNIQUE,
  master_id BIGINT,
  PRIMARY KEY (id)
);


CREATE TABLE cy_sys_resource
(
  id            BIGINT GENERATED BY DEFAULT AS IDENTITY,
  name          VARCHAR(255),
  icon          VARCHAR(255),
  _identity     VARCHAR(255),
  parent_id     BIGINT,
  parent_ids    VARCHAR(255),
  url           VARCHAR(255),
  weight        INT,
  is_show       BIT,
  resource_type INT,
  PRIMARY KEY (id)
);

CREATE TABLE cy_sys_user_online
(
  id               VARCHAR(255),
  host             VARCHAR(255),
  last_access_time DATETIME,
  online_session   LONGTEXT,
  start_timestamp  DATETIME,
  status           VARCHAR(255),
  system_host      VARCHAR(255),
  timeout          BIGINT,
  user_agent       VARCHAR(255),
  user_id          BIGINT,
  username         VARCHAR(255),
  PRIMARY KEY (id)
);


CREATE TABLE cy_sys_permission
(
  id          BIGINT(20) GENERATED BY DEFAULT AS IDENTITY,
  name        VARCHAR(100) NOT NULL UNIQUE,
  value       VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE cy_sys_role_resource_permission (
  id             BIGINT GENERATED BY DEFAULT AS IDENTITY,
  role_id        BIGINT,
  resource_id    BIGINT,
  permission_ids VARCHAR(500),
  PRIMARY KEY (id)
);
ALTER TABLE cy_sys_role_resource_permission
  ADD CONSTRAINT unique_sys_role_resource_permission UNIQUE (role_id, resource_id);

CREATE TABLE cy_sys_authorize
(
  id        BIGINT GENERATED BY DEFAULT AS IDENTITY,
  user_id   BIGINT      NOT NULL,
  target_id BIGINT      NOT NULL,
  auth_type VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

create table cy_maintain_task_definition
(
  id          BIGINT GENERATED BY DEFAULT AS IDENTITY,
  name        varchar(300)  null,
  cron        varchar(300)  null,
  bean_class  varchar(300)  null,
  bean_name   varchar(300)  null,
  method_Name varchar(300)  null,
  is_start    tinyint(1)    null,
  description varchar(4000) null,
  PRIMARY KEY (id)
);

CREATE TABLE cy_datasource_manage
(
  id          BIGINT GENERATED BY DEFAULT AS IDENTITY,
  DS_NAME     VARCHAR(200) NOT NULL,
  DS_TYPE     VARCHAR(200) NOT NULL,
  DB_NAME     VARCHAR(200) NOT NULL,
  DB_TYPE     VARCHAR(200) NOT NULL,
  DB_HOST     VARCHAR(200) NOT NULL,
  DB_PORT     VARCHAR(200) NOT NULL,
  DB_USERNAME VARCHAR(200) NOT NULL,
  DB_PASSWORD VARCHAR(200) NOT NULL,
  PRIMARY KEY (id)
);

create table cy_maintain_notification_data
(
  id           BIGINT GENERATED BY DEFAULT AS IDENTITY,
  USER_ID      BIGINT,
  SYSTEM       VARCHAR(50),
  TITLE        VARCHAR(600),
  CONTENT      VARCHAR(2000),
  PUBLISH_DATE DATETIME,
  IS_READ      BIGINT,
  PRIMARY KEY (id)
);

create table cy_maintain_notification_template
(
  id       BIGINT GENERATED BY DEFAULT AS IDENTITY,
  NAME     VARCHAR(200),
  SYSTEM   VARCHAR(50),
  TITLE    VARCHAR(600),
  TEMPLATE VARCHAR(2000),
  DELETED  bigint,
  PRIMARY KEY (id)
);

create table fs_files
(
  id              BIGINT GENERATED BY DEFAULT AS IDENTITY,
  real_name       varchar(300)  null,
  logic_name      varchar(300)  null,
  location        varchar(4000) null,
  file_size       bigint,
  type_content    varchar(300)  null,
  file_suffix     varchar(10)   null,
  identity        varchar(255)  null,
  second_identity varchar(255)  null,
  tag             varchar(255)  null,
  upload_time     datetime,
  uploader        varchar(255),
  state           varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE PROPERTIES
(
  id          BIGINT GENERATED BY DEFAULT AS IDENTITY,
  `KEY`       VARCHAR(50)  NULL,
  `VALUE`     VARCHAR(500) NULL,
  APPLICATION VARCHAR(50)  NULL,
  PROFILE     VARCHAR(50)  NULL,
  LABEL       VARCHAR(50)  NULL,
  PRIMARY KEY (id)
);


CREATE TABLE BUS_JOIN_SYSTEM
(
  id                BIGINT       GENERATED BY DEFAULT AS IDENTITY,
  sys_name          VARCHAR(300),
  sys_address       VARCHAR(100),
  sys_base_path     VARCHAR(100),
  login_api_path    VARCHAR(4000),
  auth_username_key VARCHAR(100) default 'username',
  auth_password_key VARCHAR(100) default 'password',
  auth_other_params TEXT,
  auth_username     VARCHAR(200),
  auth_password     VARCHAR(200),
  requst_method     VARCHAR(200),
  PRIMARY KEY (id)
);

CREATE TABLE BUS_REMOTE_API
(
  id              BIGINT GENERATED BY DEFAULT AS IDENTITY,
  join_system_id  BIGINT,
  remote_api_name VARCHAR(300),
  remote_api_path VARCHAR(4000),
  request_method  VARCHAR(100),
  param_model     TEXT,
  remark          VARCHAR(3000),
  PRIMARY KEY (id)
);

