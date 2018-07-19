/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 10.0
Source Host           : localhost:5151
Source Database       : smart_sso

Target Server Type    : Xugu
Target Server Version : 10.0
File Encoding         : 65001

Date: 2017-06-22 09:05:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for  SYS_APP 
-- ----------------------------
CREATE TABLE  SYS_APP  (
   id  integer identity(1,1) NOT NULL,
   name  varchar(128) NOT NULL COMMENT '名称',
   sort  integer NOT NULL COMMENT '排序',
   createTime  datetime NOT NULL COMMENT '创建时间',
   isEnable  boolean NOT NULL COMMENT '是否启用',
   code  varchar(16) NOT NULL COMMENT '编码',
  PRIMARY KEY ( id )
) COMMENT '应用表';

-- ----------------------------
-- Records of SYS_APP
-- ----------------------------
INSERT INTO  SYS_APP  VALUES ('1', '单点登录权限管理系统', '20', '2015-06-02 11:31:44', true, 'smart-sso-server');
INSERT INTO  SYS_APP  VALUES ('81', 'Demo管理系统', '15', '2015-11-08 17:16:39', true, 'smart-sso-demo');

-- ----------------------------
-- Table structure for  SYS_PERMISSION 
-- ----------------------------
CREATE TABLE  SYS_PERMISSION  (
   id  integer identity(1,1) NOT NULL,
   appId  integer NOT NULL COMMENT '应用ID',
   parentId  integer DEFAULT NULL COMMENT '父ID',
   name  varchar(50) NOT NULL COMMENT '名称',
   url  varchar(255) NOT NULL COMMENT '权限URL',
   sort  integer NOT NULL COMMENT '排序',
   isMenu  boolean NOT NULL COMMENT '是否菜单',
   isEnable  boolean NOT NULL COMMENT '是否启用',
   icon  varchar(100) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY ( id ),
  CONSTRAINT  FK_SYS_PERM_REFERENCE_SYS_APP  FOREIGN KEY ( appId ) REFERENCES  SYS_APP  ( id )
) COMMENT '权限表';

-- ----------------------------
-- Records of SYS_PERMISSION
-- ----------------------------
INSERT INTO  SYS_PERMISSION  VALUES ('2', '1', null, '应用', '/admin/app', '39', true, true, 'fa-plus-circle blue');
INSERT INTO  SYS_PERMISSION  VALUES ('3', '1', null, '用户', '/admin/user', '79', true, true, 'fa-user');
INSERT INTO  SYS_PERMISSION  VALUES ('4', '1', null, '角色', '/admin/role', '59', true, true, 'fa-users');
INSERT INTO  SYS_PERMISSION  VALUES ('5', '1', null, '权限', '/admin/permission', '29', true, true, 'fa-key');
INSERT INTO  SYS_PERMISSION  VALUES ('6', '1', '2', '应用新增', '/admin/app/edit', '4', false, true, 'fa-plus-circle blue');
INSERT INTO  SYS_PERMISSION  VALUES ('7', '1', '2', '应用禁用', '/admin/app/enable', '3', false, true, 'fa-lock orange');
INSERT INTO  SYS_PERMISSION  VALUES ('8', '1', '2', '应用启用', '/admin/app/enable', '2', false, true, 'fa-unlock green');
INSERT INTO  SYS_PERMISSION  VALUES ('9', '1', '2', '应用删除', '/admin/app/delete', '1', false, true, 'fa-trash-o red');
INSERT INTO  SYS_PERMISSION  VALUES ('10', '1', '3', '用户新增', '/admin/user/edit', '6', false, true, 'fa-plus-circle blue');
INSERT INTO  SYS_PERMISSION  VALUES ('11', '1', '3', '用户禁用', '/admin/user/enable', '5', false, true, 'fa-lock orange');
INSERT INTO  SYS_PERMISSION  VALUES ('12', '1', '3', '用户启用', '/admin/user/enable', '4', false, true, 'fa-unlock green');
INSERT INTO  SYS_PERMISSION  VALUES ('13', '1', '3', '用户删除', '/admin/user/delete', '3', false, true, 'fa-trash-o red');
INSERT INTO  SYS_PERMISSION  VALUES ('14', '1', '3', '重置密码', '/admin/user/resetPassword', '2', false, true, 'fa-key grey');
INSERT INTO  SYS_PERMISSION  VALUES ('16', '1', '4', '角色新增', '/admin/role/edit', '5', false, true, 'fa-plus-circle blue');
INSERT INTO  SYS_PERMISSION  VALUES ('17', '1', '4', '角色禁用', '/admin/role/enable', '4', false, true, 'fa-lock orange');
INSERT INTO  SYS_PERMISSION  VALUES ('18', '1', '4', '角色启用', '/admin/role/enable', '3', false, true, 'fa-unlock green');
INSERT INTO  SYS_PERMISSION  VALUES ('19', '1', '4', '角色删除', '/admin/role/delete', '2', false, true, 'fa-trash-o red');
INSERT INTO  SYS_PERMISSION  VALUES ('20', '1', '4', '角色授权', '/admin/role/allocate', '1', false, true, 'fa-cog grey');
INSERT INTO  SYS_PERMISSION  VALUES ('22', '1', '2', '应用列表', '/admin/app/list', '5', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('23', '1', '3', '用户列表', '/admin/user/list', '7', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('24', '1', '4', '角色列表', '/admin/role/list', '6', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('25', '1', '5', '权限树列表', '/admin/permission/nodes', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('26', '1', '2', '应用保存', '/admin/app/save', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('27', '1', '3', '用户保存', '/admin/user/save', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('28', '1', '4', '角色保存', '/admin/role/save', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('29', '1', '5', '权限保存', '/admin/permission/save', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('30', '1', '5', '权限删除', '/admin/permission/delete', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('33', '81', null, '菜单1', '/admin/men1', '100', true, true, 'fa-user');
INSERT INTO  SYS_PERMISSION  VALUES ('35', '81', '33', '菜单1新增', '/admin/menu1/edit', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('36', '81', '33', '菜单1删除', '/admin/menu1/delete', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('39', '1', null, '导航栏', '/admin/admin/menu', '99', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('41', '1', null, '个人中心', '/admin/profile', '89', true, true, 'fa fa-desktop');
INSERT INTO  SYS_PERMISSION  VALUES ('42', '1', '41', '修改密码', '/admin/profile/savePassword', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('59', '81', null, '菜单2', '/admin/menu2', '90', true, true, '');

-- ----------------------------
-- Table structure for  SYS_RE_ROLE_PERMISSION 
-- ----------------------------
CREATE TABLE  SYS_RE_ROLE_PERMISSION  (
   id  integer identity(1,1) NOT NULL,
   roleId  integer NOT NULL COMMENT '角色ID',
   permissionId  integer NOT NULL COMMENT '权限ID',
   appId  integer NOT NULL,
  PRIMARY KEY ( id ),
  CONSTRAINT  FK_SYS_RE_R_REFERENCE_SYS_PERM  FOREIGN KEY ( permissionId ) REFERENCES  SYS_PERMISSION  ( id ),
  CONSTRAINT  FK_SYS_RE_R_REFERENCE_SYS_ROLE  FOREIGN KEY ( roleId ) REFERENCES  SYS_ROLE  ( id )
) COMMENT '角色权限表';

-- ----------------------------
-- Records of SYS_RE_ROLE_PERMISSION
-- ----------------------------
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('291', '1', '39', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('292', '1', '41', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('293', '1', '42', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('294', '1', '3', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('295', '1', '23', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('296', '1', '10', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('297', '1', '11', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('298', '1', '12', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('299', '1', '13', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('300', '1', '14', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('302', '1', '27', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('303', '1', '2', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('304', '1', '22', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('305', '1', '6', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('306', '1', '7', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('307', '1', '8', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('308', '1', '9', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('309', '1', '26', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('310', '1', '4', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('311', '1', '24', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('312', '1', '16', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('313', '1', '17', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('314', '1', '18', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('315', '1', '19', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('316', '1', '20', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('317', '1', '28', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('318', '1', '5', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('319', '1', '25', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('320', '1', '29', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('321', '1', '30', '1');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('345', '1', '33', '81');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('346', '1', '35', '81');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('347', '1', '36', '81');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('348', '1', '59', '81');

-- ----------------------------
-- Table structure for  SYS_RE_USER_ROLE 
-- ----------------------------
CREATE TABLE  SYS_RE_USER_ROLE  (
   id  integer identity(1,1) NOT NULL,
   userId  integer NOT NULL COMMENT '用户ID ',
   roleId  integer NOT NULL COMMENT '角色ID',
  PRIMARY KEY ( id ),
  CONSTRAINT  FK_SYS_RE_U_REFERENCE_SYS_ROLE  FOREIGN KEY ( roleId ) REFERENCES  SYS_ROLE  ( id ),
  CONSTRAINT  FK_SYS_RE_U_REFERENCE_SYS_USER  FOREIGN KEY ( userId ) REFERENCES  SYS_USER  ( id )
) COMMENT '用户角色表';

-- ----------------------------
-- Records of SYS_RE_USER_ROLE
-- ----------------------------
INSERT INTO  SYS_RE_USER_ROLE  VALUES ('16', '2', '1');

-- ----------------------------
-- Table structure for  SYS_ROLE 
-- ----------------------------
CREATE TABLE  SYS_ROLE  (
   id  integer identity(1,1) NOT NULL,
   name  varchar(50) NOT NULL COMMENT '名称',
   sort  integer NOT NULL COMMENT '排序',
   description  varchar(200) DEFAULT NULL COMMENT '描述',
   isEnable  boolean NOT NULL COMMENT '是否启用',
  PRIMARY KEY ( id )
) COMMENT '角色表';

-- ----------------------------
-- Records of SYS_ROLE
-- ----------------------------
INSERT INTO  SYS_ROLE  VALUES ('1', '系统管理员', '999', '系统管理员', true);

-- ----------------------------
-- Table structure for  SYS_USER 
-- ----------------------------
CREATE TABLE  SYS_USER  (
   id  integer identity(1,1) NOT NULL,
   account  varchar(50) NOT NULL COMMENT '登录名',
   password  varchar(100) NOT NULL COMMENT '密码(加密)',
   lastLoginIp  varchar(20) DEFAULT NULL COMMENT '最后登录IP',
   lastLoginTime  datetime DEFAULT NULL COMMENT '最后登录时间',
   loginCount  integer NOT NULL COMMENT '登录总次数',
   createTime  datetime NOT NULL COMMENT '创建时间',
   isEnable  boolean NOT NULL COMMENT '是否启用'
  PRIMARY KEY ( id )
) COMMENT '用户表';

-- ----------------------------
-- Records of SYS_USER
-- ----------------------------
INSERT INTO  SYS_USER  VALUES ('2', 'admin', '26524bdf4ea266f131566a89e8f4972c', '127.0.0.1', '2018-04-09 16:20:23', '213', '2015-06-02 11:31:56', true, '38ce532d3e7a408aa93e6fcde35bead5');

-- ----------------------------
-- Table structure for  SYS_KEYSTONE 
-- ----------------------------
create table SYS_KEYSTONE(
   id  integer identity(1,1) NOT NULL,
   ssoId  integer NOT NULL,
   userId varchar(255) NOT NULL,
   userName varchar(255) NOT NULL,
   userToken blob,
   projectId varchar(255) NOT NULL,
   CONSTRAINT PK_USERID primary key(id),
   CONSTRAINT FK_SYS_RE_U_REFERENCE_SYS_USER  FOREIGN KEY ( ssoId ) REFERENCES  SYS_USER  ( id )
) COMMENT 'keystone对应关系';
create unique index idx_keystone on SYS_KEYSTONE(userid,userName);
-- ----------------------------
-- Records of SYS_KEYSTONE
-- ----------------------------
INSERT INTO  SYS_KEYSTONE(ssoId,userId,userName,projectId) values('2','38ce532d3e7a408aa93e6fcde35bead5','admin','b15ffb56f5964fffb53a63c9fe99e0b0');
