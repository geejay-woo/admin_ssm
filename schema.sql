prompt PL/SQL Developer import file
prompt Created on 2020年7月18日 by ASUS
set feedback off
set define off
prompt Creating MEMBER...
create table MEMBER
(
  id       VARCHAR2(32) default SYS_GUID() not null,
  name     VARCHAR2(20),
  nickname VARCHAR2(20),
  phonenum VARCHAR2(20),
  email    VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEMBER
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PRODUCT...
create table PRODUCT
(
  id            VARCHAR2(32) default SYS_GUID() not null,
  productnum    VARCHAR2(50) not null,
  productname   VARCHAR2(50),
  cityname      VARCHAR2(50),
  departuretime TIMESTAMP(6),
  productprice  NUMBER,
  productdesc   VARCHAR2(500),
  productstatus INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add constraint PRODUCT unique (ID, PRODUCTNUM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ORDERS...
create table ORDERS
(
  id          VARCHAR2(32) default SYS_GUID() not null,
  ordernum    VARCHAR2(20) not null,
  ordertime   TIMESTAMP(6),
  peoplecount INTEGER,
  orderdesc   VARCHAR2(500),
  paytype     INTEGER,
  orderstatus INTEGER,
  productid   VARCHAR2(32),
  memberid    VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add unique (ORDERNUM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add foreign key (PRODUCTID)
  references PRODUCT (ID);
alter table ORDERS
  add foreign key (MEMBERID)
  references MEMBER (ID);

prompt Creating TRAVELLER...
create table TRAVELLER
(
  id              VARCHAR2(32) default SYS_GUID() not null,
  name            VARCHAR2(20),
  sex             VARCHAR2(20),
  phonenum        VARCHAR2(20),
  credentialstype INTEGER,
  credentialsnum  VARCHAR2(50),
  travellertype   INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRAVELLER
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ORDER_TRAVELLER...
create table ORDER_TRAVELLER
(
  orderid     VARCHAR2(32) not null,
  travellerid VARCHAR2(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDER_TRAVELLER
  add primary key (ORDERID, TRAVELLERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDER_TRAVELLER
  add foreign key (ORDERID)
  references ORDERS (ID);
alter table ORDER_TRAVELLER
  add foreign key (TRAVELLERID)
  references TRAVELLER (ID);

prompt Creating PERMISSION...
create table PERMISSION
(
  id             VARCHAR2(32) default SYS_GUID() not null,
  permissionname VARCHAR2(50),
  url            VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PERMISSION
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLE...
create table ROLE
(
  id       VARCHAR2(32) default SYS_GUID() not null,
  rolename VARCHAR2(50),
  roledesc VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLE_PERMISSION...
create table ROLE_PERMISSION
(
  permissionid VARCHAR2(32) not null,
  roleid       VARCHAR2(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE_PERMISSION
  add primary key (PERMISSIONID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE_PERMISSION
  add foreign key (PERMISSIONID)
  references PERMISSION (ID);
alter table ROLE_PERMISSION
  add foreign key (ROLEID)
  references ROLE (ID);

prompt Creating SYSLOG...
create table SYSLOG
(
  id            VARCHAR2(32) default SYS_GUID() not null,
  visittime     TIMESTAMP(6),
  username      VARCHAR2(50),
  ip            VARCHAR2(30),
  url           VARCHAR2(50),
  executiontime INTEGER,
  method        VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SYSLOG
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS...
create table USERS
(
  id       VARCHAR2(32) default SYS_GUID() not null,
  email    VARCHAR2(50) not null,
  username VARCHAR2(50),
  password VARCHAR2(60),
  phonenum VARCHAR2(20),
  status   INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add unique (EMAIL)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS_ROLE...
create table USERS_ROLE
(
  userid VARCHAR2(32) not null,
  roleid VARCHAR2(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS_ROLE
  add primary key (USERID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS_ROLE
  add foreign key (USERID)
  references USERS (ID);
alter table USERS_ROLE
  add foreign key (ROLEID)
  references ROLE (ID);

prompt Disabling triggers for MEMBER...
alter table MEMBER disable all triggers;
prompt Disabling triggers for PRODUCT...
alter table PRODUCT disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for TRAVELLER...
alter table TRAVELLER disable all triggers;
prompt Disabling triggers for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER disable all triggers;
prompt Disabling triggers for PERMISSION...
alter table PERMISSION disable all triggers;
prompt Disabling triggers for ROLE...
alter table ROLE disable all triggers;
prompt Disabling triggers for ROLE_PERMISSION...
alter table ROLE_PERMISSION disable all triggers;
prompt Disabling triggers for SYSLOG...
alter table SYSLOG disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for USERS_ROLE...
alter table USERS_ROLE disable all triggers;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint SYS_C0011109;
alter table ORDERS disable constraint SYS_C0011110;
prompt Disabling foreign key constraints for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER disable constraint SYS_C0011112;
alter table ORDER_TRAVELLER disable constraint SYS_C0011113;
prompt Disabling foreign key constraints for ROLE_PERMISSION...
alter table ROLE_PERMISSION disable constraint SYS_C0011129;
alter table ROLE_PERMISSION disable constraint SYS_C0011130;
prompt Disabling foreign key constraints for USERS_ROLE...
alter table USERS_ROLE disable constraint SYS_C0011126;
alter table USERS_ROLE disable constraint SYS_C0011127;
prompt Deleting USERS_ROLE...
delete from USERS_ROLE;
commit;
prompt Deleting USERS...
delete from USERS;
commit;
prompt Deleting SYSLOG...
delete from SYSLOG;
commit;
prompt Deleting ROLE_PERMISSION...
delete from ROLE_PERMISSION;
commit;
prompt Deleting ROLE...
delete from ROLE;
commit;
prompt Deleting PERMISSION...
delete from PERMISSION;
commit;
prompt Deleting ORDER_TRAVELLER...
delete from ORDER_TRAVELLER;
commit;
prompt Deleting TRAVELLER...
delete from TRAVELLER;
commit;
prompt Deleting ORDERS...
delete from ORDERS;
commit;
prompt Deleting PRODUCT...
delete from PRODUCT;
commit;
prompt Deleting MEMBER...
delete from MEMBER;
commit;
prompt Loading MEMBER...
insert into MEMBER (id, name, nickname, phonenum, email)
values ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');
commit;
prompt 1 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', to_timestamp('10-10-2018 10:10:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1200, '不错的旅行', 1);
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', to_timestamp('25-04-2018 14:30:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1800, '魔都我来了', 0);
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', to_timestamp('10-10-2018 10:10:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1200, '不错的旅行', 1);
commit;
prompt 3 records loaded
prompt Loading ORDERS...
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('0E7231DC797C486290E8713CA3C6ECCC', '12345', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('5DC6A48DD4E94592AE904930EA866AFA', '54321', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('2FF351C4AC744E2092DCF08CFD314420', '67890', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('E4DD4C45EED84870ABA83574A801083E', '11111', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('55F9AF582D5A4DB28FB4EC3199385762', '33333', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('3081770BC3984EF092D9E99760FDABDE', '55555', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
commit;
prompt 9 records loaded
prompt Loading TRAVELLER...
insert into TRAVELLER (id, name, sex, phonenum, credentialstype, credentialsnum, travellertype)
values ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
insert into TRAVELLER (id, name, sex, phonenum, credentialstype, credentialsnum, travellertype)
values ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);
commit;
prompt 2 records loaded
prompt Loading ORDER_TRAVELLER...
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');
commit;
prompt 9 records loaded
prompt Loading PERMISSION...
insert into PERMISSION (id, permissionname, url)
values ('BE10CEB04C69404F9F3A159BBB6F4DC1', 'user findAll', '/user/findAll.do');
insert into PERMISSION (id, permissionname, url)
values ('923E5537888644719F6BC317974A8A6C', 'user findById', '/user/findById.do');
commit;
prompt 2 records loaded
prompt Loading ROLE...
insert into ROLE (id, rolename, roledesc)
values ('1111', 'admin', 'vip');
insert into ROLE (id, rolename, roledesc)
values ('2222', 'user', 'ordinal');
commit;
prompt 2 records loaded
prompt Loading ROLE_PERMISSION...
insert into ROLE_PERMISSION (permissionid, roleid)
values ('923E5537888644719F6BC317974A8A6C', '2222');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('BE10CEB04C69404F9F3A159BBB6F4DC1', '1111');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('BE10CEB04C69404F9F3A159BBB6F4DC1', '2222');
commit;
prompt 3 records loaded
prompt Loading SYSLOG...
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('97411A6587A54846B971E0D957361DC1', to_timestamp('18-07-2020 16:02:05.511000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名] cn.cqupt.controller.RoleController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('BEB9DE02CC184BD6B08C1AA7C4CB6441', to_timestamp('18-07-2020 16:02:09.145000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'tom', '0:0:0:0:0:0:0:1', '/role/findById.do', 11, '[类名] cn.cqupt.controller.RoleController[方法名] findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('1E6DE1DBC1CA436B96F17C14597F05CA', to_timestamp('18-07-2020 16:02:37.278000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名] cn.cqupt.controller.UserController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('50D984781451423891C29D2A8D2E6C39', to_timestamp('18-07-2020 16:02:39.879000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/user/findById.do', 21, '[类名] cn.cqupt.controller.UserController[方法名] findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('B974C184F2EE4250B4E9D3466C74E273', to_timestamp('18-07-2020 16:02:51.507000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', 'sysLogfindAll.do', 115, '[类名] cn.cqupt.controller.SysLogController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('58C6FF6C86954347AACD01CD1F3BE56C', to_timestamp('18-07-2020 16:03:14.455000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', 'sysLogfindAll.do', 7, '[类名] cn.cqupt.controller.SysLogController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('AF91A8A2C5354EB786A5D5C8BE059EDB', to_timestamp('18-07-2020 16:03:29.464000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/product/findAll.do', 44, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('145EAD6E720C48A7A9F4D213D8389F1E', to_timestamp('18-07-2020 16:03:35.922000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('06837E78DA1242DA9593BAA31DF8EDD1', to_timestamp('18-07-2020 16:03:40.915000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('3452E3B9B97445858CCE7709E3BB5CD5', to_timestamp('18-07-2020 16:03:46.821000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('638439C89B154D90B0670C21ACB4E86D', to_timestamp('18-07-2020 16:04:06.777000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.cqupt.controller.UserController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('861F963DAA0240F0B327008B14750071', to_timestamp('18-07-2020 16:04:08.804000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/user/findById.do', 5, '[类名] cn.cqupt.controller.UserController[方法名] findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('4F8FBA360B524A3A92022E7664535F44', to_timestamp('18-07-2020 16:24:51.462000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 13, '[类名] cn.cqupt.controller.OrdersController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F5D05996AD3549B2A0C41F5C057A7F9C', to_timestamp('18-07-2020 16:24:54.495000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 15, '[类名] cn.cqupt.controller.OrdersController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('3B72C0374183461F8B4CC424B0D2525D', to_timestamp('18-07-2020 16:25:01.307000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名] cn.cqupt.controller.OrdersController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('C0E0C7325E854344AA2FE31E61F03398', to_timestamp('18-07-2020 16:25:03.114000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名] cn.cqupt.controller.OrdersController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('47CDA639E75241D9B846895938D802DD', to_timestamp('18-07-2020 16:01:56.054000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 87, '[类名] cn.cqupt.controller.PermissionController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('9FA9843DBEDA432B99175C837053365C', to_timestamp('18-07-2020 16:02:01.804000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'tom', '0:0:0:0:0:0:0:1', '/permission/findById.do', 3, '[类名] cn.cqupt.controller.PermissionController[方法名] findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('A461FA5456B148BCBF6F019AE1616429', to_timestamp('18-07-2020 16:02:14.693000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名] cn.cqupt.controller.RoleController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('B51D0A208BF0481AB1DCCD08E0B2C8D7', to_timestamp('18-07-2020 16:02:29.887000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.cqupt.controller.UserController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('6AC98180D869407C8314920EE352D012', to_timestamp('18-07-2020 16:02:32.496000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/user/findById.do', 22, '[类名] cn.cqupt.controller.UserController[方法名] findById');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('AB5FE4E0BF354BA9A6654EE0465DB2B3', to_timestamp('18-07-2020 16:03:53.760000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/product/findAll.do', 3, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D20F7F2B21A84F7AAEDFC07D737DE73E', to_timestamp('18-07-2020 16:08:09.586000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 26, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('0F0A111E4E354C7BBFB8EC907C3DC1A0', to_timestamp('18-07-2020 16:09:10.184000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('C789D7AA8151428998306AD5A7829DEC', to_timestamp('18-07-2020 16:10:59.215000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/user/findAll.do', 60, '[类名] cn.cqupt.controller.UserController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('950FE5CBF79847758FF06A8940F83C73', to_timestamp('18-07-2020 16:11:26.809000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('125D5086F00B486486A7B35D12DCCA72', to_timestamp('18-07-2020 16:13:08.575000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('09A1CF0EFD8045CA9033FD75CD9E5AE8', to_timestamp('18-07-2020 16:13:14.268000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('7451CC88D7FE47BCBC3CF06CDD74EBED', to_timestamp('18-07-2020 16:08:17.025000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名] cn.cqupt.controller.ProductController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('CEDD0113DD154E4A96C9AFE2FC0EA743', to_timestamp('18-07-2020 16:24:44.680000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 175, '[类名] cn.cqupt.controller.OrdersController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('9F03DFF250CD4B778CD36C97509D12C8', to_timestamp('18-07-2020 16:24:49.887000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 35, '[类名] cn.cqupt.controller.OrdersController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D652FC4B50D146A3903A57300B0690C9', to_timestamp('18-07-2020 16:24:57.069000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 14, '[类名] cn.cqupt.controller.OrdersController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('1633D16DC9D048FDA5DFAB96F7289CB2', to_timestamp('18-07-2020 16:24:59.712000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 35, '[类名] cn.cqupt.controller.OrdersController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('A4C53BC14BA54FB482ADEE78C5D0992B', to_timestamp('18-07-2020 16:25:02.311000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 16, '[类名] cn.cqupt.controller.OrdersController[方法名] findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('825034AE2DCF4716812F52A0021ABDB9', to_timestamp('18-07-2020 16:25:03.905000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'jay', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名] cn.cqupt.controller.OrdersController[方法名] findAll');
commit;
prompt 35 records loaded
prompt Loading USERS...
insert into USERS (id, email, username, password, phonenum, status)
values ('tom', 'tom@cqupt.cn', 'tom', '$2a$10$LDaVFsk2QDK.oOVEnTstUu339kRj5jscDt6iGdt9.bmOj6.QnCX8S', '13333333333', 1);
insert into USERS (id, email, username, password, phonenum, status)
values ('jay', 'jay@cqupt.cn', 'jay', '$2a$10$yXHCb.h.2aX5Yb/bVe8F/.08cTHR39bXh0ajKr7mdV69opWinzihe', '13333333333', 1);
commit;
prompt 2 records loaded
prompt Loading USERS_ROLE...
insert into USERS_ROLE (userid, roleid)
values ('jay', '1111');
insert into USERS_ROLE (userid, roleid)
values ('jay', '2222');
insert into USERS_ROLE (userid, roleid)
values ('tom', '2222');
commit;
prompt 3 records loaded
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint SYS_C0011109;
alter table ORDERS enable constraint SYS_C0011110;
prompt Enabling foreign key constraints for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER enable constraint SYS_C0011112;
alter table ORDER_TRAVELLER enable constraint SYS_C0011113;
prompt Enabling foreign key constraints for ROLE_PERMISSION...
alter table ROLE_PERMISSION enable constraint SYS_C0011129;
alter table ROLE_PERMISSION enable constraint SYS_C0011130;
prompt Enabling foreign key constraints for USERS_ROLE...
alter table USERS_ROLE enable constraint SYS_C0011126;
alter table USERS_ROLE enable constraint SYS_C0011127;
prompt Enabling triggers for MEMBER...
alter table MEMBER enable all triggers;
prompt Enabling triggers for PRODUCT...
alter table PRODUCT enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for TRAVELLER...
alter table TRAVELLER enable all triggers;
prompt Enabling triggers for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER enable all triggers;
prompt Enabling triggers for PERMISSION...
alter table PERMISSION enable all triggers;
prompt Enabling triggers for ROLE...
alter table ROLE enable all triggers;
prompt Enabling triggers for ROLE_PERMISSION...
alter table ROLE_PERMISSION enable all triggers;
prompt Enabling triggers for SYSLOG...
alter table SYSLOG enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for USERS_ROLE...
alter table USERS_ROLE enable all triggers;
set feedback on
set define on
prompt Done.
