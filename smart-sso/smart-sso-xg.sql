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
   id  varchar(32) NOT NULL,
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
INSERT INTO  SYS_APP  VALUES ('770a6972bee34196921bee24e3d45642', '单点登录权限管理系统', '20', '2015-06-02 11:31:44', true, 'smart-sso-server');
INSERT INTO  SYS_APP  VALUES ('f1c1cb0329cb4d9b91313a5df8469e2d', 'Demo管理系统', '15', '2015-11-08 17:16:39', true, 'smart-sso-demo');

-- ----------------------------
-- Table structure for  SYS_PERMISSION 
-- ----------------------------
CREATE TABLE  SYS_PERMISSION  (
   id  varchar(32) NOT NULL,
   appId  varchar(32) DEFAULT NULL COMMENT '应用ID',
   parentId  varchar(32) DEFAULT NULL COMMENT '父ID',
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
INSERT INTO  SYS_PERMISSION  VALUES ('aac41f81758b4cf0b7860b141039c155', '770a6972bee34196921bee24e3d45642', null, '应用', '/admin/app', '39', true, true, 'fa-plus-circle blue');
INSERT INTO  SYS_PERMISSION  VALUES ('90b9dac05cb14883adc2996cc4ea64f0', '770a6972bee34196921bee24e3d45642', null, '用户', '/admin/user', '79', true, true, 'fa-user');
INSERT INTO  SYS_PERMISSION  VALUES ('380b7aadd03140a29059f35bf4bf058a', '770a6972bee34196921bee24e3d45642', null, '角色', '/admin/role', '59', true, true, 'fa-users');
INSERT INTO  SYS_PERMISSION  VALUES ('f87f9036fc3f4bc1b879f42e24462978', '770a6972bee34196921bee24e3d45642', null, '权限', '/admin/permission', '29', true, true, 'fa-key');
INSERT INTO  SYS_PERMISSION  VALUES ('ebf02dadc2bb441c96eaaa7380ebc78c', '770a6972bee34196921bee24e3d45642', 'aac41f81758b4cf0b7860b141039c155', '应用新增', '/admin/app/edit', '4', false, true, 'fa-plus-circle blue');
INSERT INTO  SYS_PERMISSION  VALUES ('fb6f9a13302b41ad8f4be4d3b4b834bc', '770a6972bee34196921bee24e3d45642', 'aac41f81758b4cf0b7860b141039c155', '应用禁用', '/admin/app/enable', '3', false, true, 'fa-lock orange');
INSERT INTO  SYS_PERMISSION  VALUES ('3cad878a1a8c44608714c72ea9dd5c0b', '770a6972bee34196921bee24e3d45642', 'aac41f81758b4cf0b7860b141039c155', '应用启用', '/admin/app/enable', '2', false, true, 'fa-unlock green');
INSERT INTO  SYS_PERMISSION  VALUES ('f1b7fdbb0ae74d24947eeacfa930f708', '770a6972bee34196921bee24e3d45642', 'aac41f81758b4cf0b7860b141039c155', '应用删除', '/admin/app/delete', '1', false, true, 'fa-trash-o red');
INSERT INTO  SYS_PERMISSION  VALUES ('3ab8e14c53644645a5313c03ef49e545', '770a6972bee34196921bee24e3d45642', '90b9dac05cb14883adc2996cc4ea64f0', '用户新增', '/admin/user/edit', '6', false, true, 'fa-plus-circle blue');
INSERT INTO  SYS_PERMISSION  VALUES ('50705f64a4c3438fa5567cea6fd793df', '770a6972bee34196921bee24e3d45642', '90b9dac05cb14883adc2996cc4ea64f0', '用户禁用', '/admin/user/enable', '5', false, true, 'fa-lock orange');
INSERT INTO  SYS_PERMISSION  VALUES ('d227354289a54902a0430a2a98271799', '770a6972bee34196921bee24e3d45642', '90b9dac05cb14883adc2996cc4ea64f0', '用户启用', '/admin/user/enable', '4', false, true, 'fa-unlock green');
INSERT INTO  SYS_PERMISSION  VALUES ('d73d19f6324f4678ac52170aad7cede6', '770a6972bee34196921bee24e3d45642', '90b9dac05cb14883adc2996cc4ea64f0', '用户删除', '/admin/user/delete', '3', false, true, 'fa-trash-o red');
INSERT INTO  SYS_PERMISSION  VALUES ('47f1a39ab7be4646a350ac9d12e4edc6', '770a6972bee34196921bee24e3d45642', '90b9dac05cb14883adc2996cc4ea64f0', '重置密码', '/admin/user/resetPassword', '2', false, true, 'fa-key grey');
INSERT INTO  SYS_PERMISSION  VALUES ('70f5393073c24ff6adf7411c7c3e1b8d', '770a6972bee34196921bee24e3d45642', '380b7aadd03140a29059f35bf4bf058a', '角色新增', '/admin/role/edit', '5', false, true, 'fa-plus-circle blue');
INSERT INTO  SYS_PERMISSION  VALUES ('026990ed3b014288bec400eafcec52a3', '770a6972bee34196921bee24e3d45642', '380b7aadd03140a29059f35bf4bf058a', '角色禁用', '/admin/role/enable', '4', false, true, 'fa-lock orange');
INSERT INTO  SYS_PERMISSION  VALUES ('82ca217e40d745978905177ee5066dd9', '770a6972bee34196921bee24e3d45642', '380b7aadd03140a29059f35bf4bf058a', '角色启用', '/admin/role/enable', '3', false, true, 'fa-unlock green');
INSERT INTO  SYS_PERMISSION  VALUES ('225eb3e556184f28a59dd3e2e3afec1b', '770a6972bee34196921bee24e3d45642', '380b7aadd03140a29059f35bf4bf058a', '角色删除', '/admin/role/delete', '2', false, true, 'fa-trash-o red');
INSERT INTO  SYS_PERMISSION  VALUES ('8a88efe1bb11473b85b995281062f60f', '770a6972bee34196921bee24e3d45642', '380b7aadd03140a29059f35bf4bf058a', '角色授权', '/admin/role/allocate', '1', false, true, 'fa-cog grey');
INSERT INTO  SYS_PERMISSION  VALUES ('f9fd274fb713479884282d8e5b179e74', '770a6972bee34196921bee24e3d45642', 'aac41f81758b4cf0b7860b141039c155', '应用列表', '/admin/app/list', '5', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('936c11e51b8444d194fc358f656ef023', '770a6972bee34196921bee24e3d45642', '90b9dac05cb14883adc2996cc4ea64f0', '用户列表', '/admin/user/list', '7', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('e764eaa171cc4a9d80da556051b1dcc8', '770a6972bee34196921bee24e3d45642', '380b7aadd03140a29059f35bf4bf058a', '角色列表', '/admin/role/list', '6', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('585fbc8f1793402e8091620658cb161b', '770a6972bee34196921bee24e3d45642', 'f87f9036fc3f4bc1b879f42e24462978', '权限树列表', '/admin/permission/nodes', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('e7aa3b42b01f4b25ad2f7bcaad19eb5a', '770a6972bee34196921bee24e3d45642', 'aac41f81758b4cf0b7860b141039c155', '应用保存', '/admin/app/save', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('de30ae1d5d534b6da88f9c1a7192319d', '770a6972bee34196921bee24e3d45642', '90b9dac05cb14883adc2996cc4ea64f0', '用户保存', '/admin/user/save', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('560b57ae42f6482d817d58d8e471883d', '770a6972bee34196921bee24e3d45642', '380b7aadd03140a29059f35bf4bf058a', '角色保存', '/admin/role/save', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('34daaec1ff4e4e22849f4b3afc694316', '770a6972bee34196921bee24e3d45642', 'f87f9036fc3f4bc1b879f42e24462978', '权限保存', '/admin/permission/save', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('f35ace1ba72f4d80b702c33a39c03e6a', '770a6972bee34196921bee24e3d45642', 'f87f9036fc3f4bc1b879f42e24462978', '权限删除', '/admin/permission/delete', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('ef7cebd46fbf43d9974b18385b5053ab', 'f1c1cb0329cb4d9b91313a5df8469e2d', null, '菜单1', '/admin/men1', '100', true, true, 'fa-user');
INSERT INTO  SYS_PERMISSION  VALUES ('7d7a4ae2079f4f2bbee7a50629aaa94d', 'f1c1cb0329cb4d9b91313a5df8469e2d', 'ef7cebd46fbf43d9974b18385b5053ab', '菜单1新增', '/admin/menu1/edit', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('495544e280f44e86971e5e28d7f5e103', 'f1c1cb0329cb4d9b91313a5df8469e2d', 'ef7cebd46fbf43d9974b18385b5053ab', '菜单1删除', '/admin/menu1/delete', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('044994dfe33d4f4599ddf980ccf5db9b', '770a6972bee34196921bee24e3d45642', null, '导航栏', '/admin/admin/menu', '99', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('b50cc3ce36c642759ac64e32de0e5d8e', '770a6972bee34196921bee24e3d45642', null, '个人中心', '/admin/profile', '89', true, true, 'fa fa-desktop');
INSERT INTO  SYS_PERMISSION  VALUES ('ea5365d508d747b5a0756838ffafa89c', '770a6972bee34196921bee24e3d45642', '044994dfe33d4f4599ddf980ccf5db9b', '修改密码', '/admin/profile/savePassword', '1', false, true, '');
INSERT INTO  SYS_PERMISSION  VALUES ('582ac654355041c19120adbfece64569', 'f1c1cb0329cb4d9b91313a5df8469e2d', null, '菜单2', '/admin/menu2', '90', true, true, '');

-- ----------------------------
-- Table structure for  SYS_RE_ROLE_PERMISSION 
-- ----------------------------
CREATE TABLE  SYS_RE_ROLE_PERMISSION  (
   id  varchar(32) NOT NULL,
   roleId  varchar(32) NOT NULL COMMENT '角色ID',
   permissionId  varchar(32) NOT NULL COMMENT '权限ID',
   appId  varchar(32) NOT NULL,
  PRIMARY KEY ( id ),
  CONSTRAINT  FK_SYS_RE_R_REFERENCE_SYS_PERM  FOREIGN KEY ( permissionId ) REFERENCES  SYS_PERMISSION  ( id ),
  CONSTRAINT  FK_SYS_RE_R_REFERENCE_SYS_ROLE  FOREIGN KEY ( roleId ) REFERENCES  SYS_ROLE  ( id )
) COMMENT '角色权限表';

-- ----------------------------
-- Records of SYS_RE_ROLE_PERMISSION
-- ----------------------------
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('67a5266f3a9b4beb8d67ea924f70455c', '9e1cdd09ba9e452589b587bc26134261', '044994dfe33d4f4599ddf980ccf5db9b', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('fde0afa2d25647df8c4f67e24a412595', '9e1cdd09ba9e452589b587bc26134261', 'b50cc3ce36c642759ac64e32de0e5d8e', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('045589bfefac4089911064abd431d0c9', '9e1cdd09ba9e452589b587bc26134261', 'ea5365d508d747b5a0756838ffafa89c', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('48b6f7a03cda47858fedf33c885e442f', '9e1cdd09ba9e452589b587bc26134261', '90b9dac05cb14883adc2996cc4ea64f0', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('8f40d8c609f04d16b6bda656706b0b73', '9e1cdd09ba9e452589b587bc26134261', '936c11e51b8444d194fc358f656ef023', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('489b3df7379945a8a8b609dbe7f6c757', '9e1cdd09ba9e452589b587bc26134261', '3ab8e14c53644645a5313c03ef49e545', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('76938717200e4981bf3b38e790f60a92', '9e1cdd09ba9e452589b587bc26134261', '50705f64a4c3438fa5567cea6fd793df', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('6f34e39590de4fcdaf3335fe7ae3a273', '9e1cdd09ba9e452589b587bc26134261', 'd227354289a54902a0430a2a98271799', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('e4cbb07ad5e943d8a42cf6e3523dd8b3', '9e1cdd09ba9e452589b587bc26134261', 'd73d19f6324f4678ac52170aad7cede6', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('c6b5b2313eec491faa42a9f229d63d80', '9e1cdd09ba9e452589b587bc26134261', '47f1a39ab7be4646a350ac9d12e4edc6', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('8de14b9d93e24a19aedbacdbe328ea74', '9e1cdd09ba9e452589b587bc26134261', 'de30ae1d5d534b6da88f9c1a7192319d', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('0c3dae9c9b294856bb727b35c5bab149', '9e1cdd09ba9e452589b587bc26134261', 'aac41f81758b4cf0b7860b141039c155', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('45a3a1626bbd40a698eb7a9d0f448acd', '9e1cdd09ba9e452589b587bc26134261', 'f9fd274fb713479884282d8e5b179e74', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('9543fe62b61d4bcfae3a1e5aad388b5f', '9e1cdd09ba9e452589b587bc26134261', 'ebf02dadc2bb441c96eaaa7380ebc78c', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('c657141f07af41c88cdfe30fe862b462', '9e1cdd09ba9e452589b587bc26134261', 'fb6f9a13302b41ad8f4be4d3b4b834bc', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('0658988508ec46d0a97b5f223a1c6d7f', '9e1cdd09ba9e452589b587bc26134261', '3cad878a1a8c44608714c72ea9dd5c0b', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('5c1172f530a14023bacc6c238bcc126a', '9e1cdd09ba9e452589b587bc26134261', 'f1b7fdbb0ae74d24947eeacfa930f708', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('fab19377854c45bf9653d1ce89b1a074', '9e1cdd09ba9e452589b587bc26134261', 'e7aa3b42b01f4b25ad2f7bcaad19eb5a', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('fa98a70e31d240189128d979955a0467', '9e1cdd09ba9e452589b587bc26134261', '380b7aadd03140a29059f35bf4bf058a', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('e79ddb28e1ec4088b8a919b5f4789504', '9e1cdd09ba9e452589b587bc26134261', 'e764eaa171cc4a9d80da556051b1dcc8', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('daad9ef3ce5b4871a473977970abc57a', '9e1cdd09ba9e452589b587bc26134261', '70f5393073c24ff6adf7411c7c3e1b8d', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('ad4df61fe50c430ea7ddbfa51719ee37', '9e1cdd09ba9e452589b587bc26134261', '026990ed3b014288bec400eafcec52a3', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('d6eae4bc3f844eba89abbbe1dc76b1e2', '9e1cdd09ba9e452589b587bc26134261', '82ca217e40d745978905177ee5066dd9', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('1961b4a537af43fca75a45ca4ad6a758', '9e1cdd09ba9e452589b587bc26134261', '225eb3e556184f28a59dd3e2e3afec1b', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('835e22cfc30c4f949ea08a83199718a7', '9e1cdd09ba9e452589b587bc26134261', '8a88efe1bb11473b85b995281062f60f', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('66e14955ccd1491387ec78160d2c63d0', '9e1cdd09ba9e452589b587bc26134261', '560b57ae42f6482d817d58d8e471883d', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('ed8853fcff024061adb8ee089f9578b5', '9e1cdd09ba9e452589b587bc26134261', 'f87f9036fc3f4bc1b879f42e24462978', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('2fdee1202d7d4c25b79e5777e001f0f1', '9e1cdd09ba9e452589b587bc26134261', '585fbc8f1793402e8091620658cb161b', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('7025bd149f3d461c9c0be5e8d4730041', '9e1cdd09ba9e452589b587bc26134261', '34daaec1ff4e4e22849f4b3afc694316', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('e10556bf18d24c4fb37e0c42fcaccbf4', '9e1cdd09ba9e452589b587bc26134261', 'f35ace1ba72f4d80b702c33a39c03e6a', '770a6972bee34196921bee24e3d45642');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('f39ca3ae1cef4472a19ffda1e47f0f84', '9e1cdd09ba9e452589b587bc26134261', 'ef7cebd46fbf43d9974b18385b5053ab', 'f1c1cb0329cb4d9b91313a5df8469e2d');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('e2a803f371fd49f3b3ec7e4f682ac4a1', '9e1cdd09ba9e452589b587bc26134261', '7d7a4ae2079f4f2bbee7a50629aaa94d', 'f1c1cb0329cb4d9b91313a5df8469e2d');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('4339fc3dada64f8bae71dd599d54c67c', '9e1cdd09ba9e452589b587bc26134261', '495544e280f44e86971e5e28d7f5e103', 'f1c1cb0329cb4d9b91313a5df8469e2d');
INSERT INTO  SYS_RE_ROLE_PERMISSION  VALUES ('942f442c99ad4f6cbdbd46b97d3cf438', '9e1cdd09ba9e452589b587bc26134261', '582ac654355041c19120adbfece64569', 'f1c1cb0329cb4d9b91313a5df8469e2d');

-- ----------------------------
-- Table structure for  SYS_RE_USER_ROLE 
-- ----------------------------
CREATE TABLE  SYS_RE_USER_ROLE  (
   id  varchar(32) NOT NULL,
   userId  varchar(32) NOT NULL COMMENT '用户ID ',
   roleId  varchar(32) NOT NULL COMMENT '角色ID',
  PRIMARY KEY ( id ),
  CONSTRAINT  FK_SYS_RE_U_REFERENCE_SYS_ROLE  FOREIGN KEY ( roleId ) REFERENCES  SYS_ROLE  ( id ),
  CONSTRAINT  FK_SYS_RE_U_REFERENCE_SYS_USER  FOREIGN KEY ( userId ) REFERENCES  SYS_USER  ( id )
) COMMENT '用户角色表';

-- ----------------------------
-- Records of SYS_RE_USER_ROLE
-- ----------------------------
INSERT INTO  SYS_RE_USER_ROLE  VALUES ('6c60e54601fc45e89766df8351c99523', 'e0d2ede602194d95a1eb8dd17618bb85', '9e1cdd09ba9e452589b587bc26134261');

-- ----------------------------
-- Table structure for  SYS_ROLE 
-- ----------------------------
CREATE TABLE  SYS_ROLE  (
   id  varchar(32) NOT NULL,
   name  varchar(50) NOT NULL COMMENT '名称',
   sort  integer NOT NULL COMMENT '排序',
   description  varchar(200) DEFAULT NULL COMMENT '描述',
   isEnable  boolean NOT NULL COMMENT '是否启用',
  PRIMARY KEY ( id )
) COMMENT '角色表';

-- ----------------------------
-- Records of SYS_ROLE
-- ----------------------------
INSERT INTO  SYS_ROLE  VALUES ('9e1cdd09ba9e452589b587bc26134261', '系统管理员', '999', '系统管理员', true);

-- ----------------------------
-- Table structure for  SYS_USER 
-- ----------------------------
CREATE TABLE  SYS_USER  (
   id  varchar(32) NOT NULL,
   account  varchar(50) NOT NULL COMMENT '登录名',
   password  varchar(100) NOT NULL COMMENT '密码(加密)',
   lastLoginIp  varchar(20) DEFAULT NULL COMMENT '最后登录IP',
   lastLoginTime  datetime DEFAULT NULL COMMENT '最后登录时间',
   loginCount  integer NOT NULL COMMENT '登录总次数',
   createTime  datetime NOT NULL COMMENT '创建时间',
   isEnable  boolean NOT NULL COMMENT '是否启用',
  PRIMARY KEY ( id )
) COMMENT '用户表';

-- ----------------------------
-- Records of SYS_USER
-- ----------------------------
INSERT INTO  SYS_USER  VALUES ('e0d2ede602194d95a1eb8dd17618bb85', 'admin', '26524bdf4ea266f131566a89e8f4972c', '127.0.0.1', '2018-04-09 16:20:23', '213', '2015-06-02 11:31:56', true);

-- ----------------------------
-- Table structure for  SYS_KEYSTONE 
-- ----------------------------
create table SYS_KEYSTONE(
   id  varchar(32) NOT NULL,
   ssoId  varchar(32) NOT NULL,
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
INSERT INTO  SYS_KEYSTONE(id,ssoId,userId,userName,projectId) values('6759471db57c4a73b92fde0943637193','e0d2ede602194d95a1eb8dd17618bb85','38ce532d3e7a408aa93e6fcde35bead5','admin','b15ffb56f5964fffb53a63c9fe99e0b0');
