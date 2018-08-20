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
-- Records of project
-- ----------------------------
INSERT INTO  project  VALUES ('7df5552a7c99429bb948a8cf29291183', '单点登录权限管理系统', '20', '2015-06-02 11:31:44', true, 'smart-sso-server');
INSERT INTO  project  VALUES ('cb05bec5d77f4f5e8d5aea9a1977f5ce', '虚谷云计算', '17', '2018-08-14 17:05:28', true, 'Lager');

-- ----------------------------
-- Table structure for  SYS_PERMISSION 
-- ----------------------------
CREATE TABLE  `sys_permission`  (
   id  varchar(64) NOT NULL,
   appId  varchar(64) DEFAULT NULL COMMENT '应用ID',
   parentId  varchar(64) DEFAULT NULL COMMENT '父ID',
   name  varchar(50) NOT NULL COMMENT '名称',
   url  varchar(255) NOT NULL COMMENT '权限URL',
   sort  integer NOT NULL COMMENT '排序',
   isMenu  boolean NOT NULL COMMENT '是否菜单',
   isEnable  boolean NOT NULL COMMENT '是否启用',
   icon  varchar(100) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY ( id ),
  CONSTRAINT  FK_SYS_PERM_REFERENCE_SYS_APP  FOREIGN KEY ( appId ) REFERENCES  project  ( id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT= '权限表';

-- ----------------------------
-- Records of SYS_PERMISSION
-- ----------------------------
INSERT INTO  `sys_permission`  VALUES ('aac41f81758b4cf0b7860b141039c155', '7df5552a7c99429bb948a8cf29291183', null, '应用', '/admin/app', '39', true, true, 'fa-plus-circle blue');
INSERT INTO  `sys_permission`  VALUES ('90b9dac05cb14883adc2996cc4ea64f0', '7df5552a7c99429bb948a8cf29291183', null, '用户', '/admin/user', '79', true, true, 'fa-user');
INSERT INTO  `sys_permission`  VALUES ('380b7aadd03140a29059f35bf4bf058a', '7df5552a7c99429bb948a8cf29291183', null, '角色', '/admin/role', '59', true, true, 'fa-users');
INSERT INTO  `sys_permission`  VALUES ('f87f9036fc3f4bc1b879f42e24462978', '7df5552a7c99429bb948a8cf29291183', null, '权限', '/admin/permission', '29', true, true, 'fa-key');
INSERT INTO  `sys_permission`  VALUES ('ebf02dadc2bb441c96eaaa7380ebc78c', '7df5552a7c99429bb948a8cf29291183', 'aac41f81758b4cf0b7860b141039c155', '应用新增', '/admin/app/edit', '4', false, true, 'fa-plus-circle blue');
INSERT INTO  `sys_permission`  VALUES ('fb6f9a13302b41ad8f4be4d3b4b834bc', '7df5552a7c99429bb948a8cf29291183', 'aac41f81758b4cf0b7860b141039c155', '应用禁用', '/admin/app/enable', '3', false, true, 'fa-lock orange');
INSERT INTO  `sys_permission`  VALUES ('3cad878a1a8c44608714c72ea9dd5c0b', '7df5552a7c99429bb948a8cf29291183', 'aac41f81758b4cf0b7860b141039c155', '应用启用', '/admin/app/enable', '2', false, true, 'fa-unlock green');
INSERT INTO  `sys_permission`  VALUES ('f1b7fdbb0ae74d24947eeacfa930f708', '7df5552a7c99429bb948a8cf29291183', 'aac41f81758b4cf0b7860b141039c155', '应用删除', '/admin/app/delete', '1', false, true, 'fa-trash-o red');
INSERT INTO  `sys_permission`  VALUES ('3ab8e14c53644645a5313c03ef49e545', '7df5552a7c99429bb948a8cf29291183', '90b9dac05cb14883adc2996cc4ea64f0', '用户新增', '/admin/user/edit', '6', false, true, 'fa-plus-circle blue');
INSERT INTO  `sys_permission`  VALUES ('50705f64a4c3438fa5567cea6fd793df', '7df5552a7c99429bb948a8cf29291183', '90b9dac05cb14883adc2996cc4ea64f0', '用户禁用', '/admin/user/enable', '5', false, true, 'fa-lock orange');
INSERT INTO  `sys_permission`  VALUES ('d227354289a54902a0430a2a98271799', '7df5552a7c99429bb948a8cf29291183', '90b9dac05cb14883adc2996cc4ea64f0', '用户启用', '/admin/user/enable', '4', false, true, 'fa-unlock green');
INSERT INTO  `sys_permission`  VALUES ('d73d19f6324f4678ac52170aad7cede6', '7df5552a7c99429bb948a8cf29291183', '90b9dac05cb14883adc2996cc4ea64f0', '用户删除', '/admin/user/delete', '3', false, true, 'fa-trash-o red');
INSERT INTO  `sys_permission`  VALUES ('47f1a39ab7be4646a350ac9d12e4edc6', '7df5552a7c99429bb948a8cf29291183', '90b9dac05cb14883adc2996cc4ea64f0', '重置密码', '/admin/user/resetPassword', '2', false, true, 'fa-key grey');
INSERT INTO  `sys_permission`  VALUES ('70f5393073c24ff6adf7411c7c3e1b8d', '7df5552a7c99429bb948a8cf29291183', '380b7aadd03140a29059f35bf4bf058a', '角色新增', '/admin/role/edit', '5', false, true, 'fa-plus-circle blue');
INSERT INTO  `sys_permission`  VALUES ('026990ed3b014288bec400eafcec52a3', '7df5552a7c99429bb948a8cf29291183', '380b7aadd03140a29059f35bf4bf058a', '角色禁用', '/admin/role/enable', '4', false, true, 'fa-lock orange');
INSERT INTO  `sys_permission`  VALUES ('82ca217e40d745978905177ee5066dd9', '7df5552a7c99429bb948a8cf29291183', '380b7aadd03140a29059f35bf4bf058a', '角色启用', '/admin/role/enable', '3', false, true, 'fa-unlock green');
INSERT INTO  `sys_permission`  VALUES ('225eb3e556184f28a59dd3e2e3afec1b', '7df5552a7c99429bb948a8cf29291183', '380b7aadd03140a29059f35bf4bf058a', '角色删除', '/admin/role/delete', '2', false, true, 'fa-trash-o red');
INSERT INTO  `sys_permission`  VALUES ('8a88efe1bb11473b85b995281062f60f', '7df5552a7c99429bb948a8cf29291183', '380b7aadd03140a29059f35bf4bf058a', '角色授权', '/admin/role/allocate', '1', false, true, 'fa-cog grey');
INSERT INTO  `sys_permission`  VALUES ('f9fd274fb713479884282d8e5b179e74', '7df5552a7c99429bb948a8cf29291183', 'aac41f81758b4cf0b7860b141039c155', '应用列表', '/admin/app/list', '5', false, true, '');
INSERT INTO  `sys_permission`  VALUES ('936c11e51b8444d194fc358f656ef023', '7df5552a7c99429bb948a8cf29291183', '90b9dac05cb14883adc2996cc4ea64f0', '用户列表', '/admin/user/list', '7', false, true, '');
INSERT INTO  `sys_permission`  VALUES ('e764eaa171cc4a9d80da556051b1dcc8', '7df5552a7c99429bb948a8cf29291183', '380b7aadd03140a29059f35bf4bf058a', '角色列表', '/admin/role/list', '6', false, true, '');
INSERT INTO  `sys_permission`  VALUES ('585fbc8f1793402e8091620658cb161b', '7df5552a7c99429bb948a8cf29291183', 'f87f9036fc3f4bc1b879f42e24462978', '权限树列表', '/admin/permission/nodes', '1', false, true, '');
INSERT INTO  `sys_permission`  VALUES ('e7aa3b42b01f4b25ad2f7bcaad19eb5a', '7df5552a7c99429bb948a8cf29291183', 'aac41f81758b4cf0b7860b141039c155', '应用保存', '/admin/app/save', '1', false, true, '');
INSERT INTO  `sys_permission`  VALUES ('de30ae1d5d534b6da88f9c1a7192319d', '7df5552a7c99429bb948a8cf29291183', '90b9dac05cb14883adc2996cc4ea64f0', '用户保存', '/admin/user/save', '1', false, true, '');
INSERT INTO  `sys_permission`  VALUES ('560b57ae42f6482d817d58d8e471883d', '7df5552a7c99429bb948a8cf29291183', '380b7aadd03140a29059f35bf4bf058a', '角色保存', '/admin/role/save', '1', false, true, '');
INSERT INTO  `sys_permission`  VALUES ('34daaec1ff4e4e22849f4b3afc694316', '7df5552a7c99429bb948a8cf29291183', 'f87f9036fc3f4bc1b879f42e24462978', '权限保存', '/admin/permission/save', '1', false, true, '');
INSERT INTO  `sys_permission`  VALUES ('f35ace1ba72f4d80b702c33a39c03e6a', '7df5552a7c99429bb948a8cf29291183', 'f87f9036fc3f4bc1b879f42e24462978', '权限删除', '/admin/permission/delete', '1', false, true, '');
INSERT INTO  `sys_permission`  VALUES ('044994dfe33d4f4599ddf980ccf5db9b', '7df5552a7c99429bb948a8cf29291183', null, '导航栏', '/admin/admin/menu', '99', false, true, '');
INSERT INTO  `sys_permission`  VALUES ('b50cc3ce36c642759ac64e32de0e5d8e', '7df5552a7c99429bb948a8cf29291183', null, '个人中心', '/admin/profile', '89', true, true, 'fa fa-desktop');
INSERT INTO  `sys_permission`  VALUES ('ea5365d508d747b5a0756838ffafa89c', '7df5552a7c99429bb948a8cf29291183', '044994dfe33d4f4599ddf980ccf5db9b', '修改密码', '/admin/profile/savePassword', '1', false, true, '');
insert into `sys_permission` values('00482c332473477fa99065ef32d10910','cb05bec5d77f4f5e8d5aea9a1977f5ce','6b5a92662c4047e183402dc560242226','项目更新','/manage/projects/update','8','0','0','');
insert into `sys_permission` values('00abc275406444f0a4ad939a843885a8','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','券快照','/dashboard/project/volemeSnapshots','1','0','0','');
insert into `sys_permission` values('0186a19111364ca59588e0168933a6c3','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','验证工程组角色','/manage/roles/checkProjectGroupRole','2','0','0','');
insert into `sys_permission` values('01dfdaf53e864dbca571fa7c51b2c0c8','cb05bec5d77f4f5e8d5aea9a1977f5ce','','存储','/volume','89','0','0','');
insert into `sys_permission` values('077ce67654394509a223b17661cf7963','cb05bec5d77f4f5e8d5aea9a1977f5ce','6b5a92662c4047e183402dc560242226','用户组列表','/user/listUserGroups','1','0','0','');
insert into `sys_permission` values('081420bb616c4a6bb3c7d24ad8105266','cb05bec5d77f4f5e8d5aea9a1977f5ce','b1a86a0785174f879a12817a316a8f22','解除浮动IP','/networks/floatingIps/disconnecting','1','0','0','');
insert into `sys_permission` values('09105ac3ba8d4c66a28319c53996689e','cb05bec5d77f4f5e8d5aea9a1977f5ce','db4fe3146b45430da0eb1a9ba42892d8','获取nova配额','/dashboard/api/nova/tenantLimits','2','0','0','');
insert into `sys_permission` values('0c17732cad0b48c3a48272df3de52510','cb05bec5d77f4f5e8d5aea9a1977f5ce','db4fe3146b45430da0eb1a9ba42892d8','获取cinder配额','/dashboard/api/cinder/tenantLimits','3','0','0','');
insert into `sys_permission` values('0c8e4a16c11849ba9626ea1fd3c0c9ff','cb05bec5d77f4f5e8d5aea9a1977f5ce','19885f7e6a3a40c38f25a9b79b84f508','网络子网','/networks/subnets','1','0','0','');
insert into `sys_permission` values('124c9978a78a44008ccf10779b02abc1','cb05bec5d77f4f5e8d5aea9a1977f5ce','989f5b57da5a4db98d52a947542ee5b8','端口详情','/network/portDetail','2','0','0','');
insert into `sys_permission` values('1316ef6f91984889a2f54ab807999fd7','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','组详情','/dashboard/project/group-detail','1','0','0','');
insert into `sys_permission` values('14046ffd3abf45318b11609ea6183694','cb05bec5d77f4f5e8d5aea9a1977f5ce','680b555835474c56be8359aa9770d766','组创建','/manage/groups/create','9','0','0','');
insert into `sys_permission` values('15377d45f54248be92eed0bde29e9284','cb05bec5d77f4f5e8d5aea9a1977f5ce','8c015c91208947eca96f75078eec5a58','用户删除','/user/delete','5','0','0','');
insert into `sys_permission` values('1641ee72d895428eba1125d590893881','cb05bec5d77f4f5e8d5aea9a1977f5ce','6b5a92662c4047e183402dc560242226','项目角色列表','/manage/projects/role-assign','1','0','0','');
insert into `sys_permission` values('185f93a30b34461f8cd45ae656ccde66','cb05bec5d77f4f5e8d5aea9a1977f5ce','9c17b3901d1f4bfab7986fb63e34ca07','券类型','/volumes/types','8','0','0','');
insert into `sys_permission` values('18c37d2f250247f4b8cd91c5f16eeb15','cb05bec5d77f4f5e8d5aea9a1977f5ce','680b555835474c56be8359aa9770d766','组删除','/manage/groups/delete','7','0','0','');
insert into `sys_permission` values('19885f7e6a3a40c38f25a9b79b84f508','cb05bec5d77f4f5e8d5aea9a1977f5ce','989f5b57da5a4db98d52a947542ee5b8','网络','/network/network','8','0','0','');
insert into `sys_permission` values('1ae0164b5654430bbdc5cc89ad31af07','cb05bec5d77f4f5e8d5aea9a1977f5ce','6b5a92662c4047e183402dc560242226','项目删除','/manage/projects/delete','7','0','0','');
insert into `sys_permission` values('1bb6dd22e75144419b5b28a0680fde68','cb05bec5d77f4f5e8d5aea9a1977f5ce','6b5a92662c4047e183402dc560242226','项目查询(ID)','/manage/projects/search-id','5','0','0','');
insert into `sys_permission` values('1e5ce28aa65b4dd9ae836b053aa454a8','cb05bec5d77f4f5e8d5aea9a1977f5ce','9c17b3901d1f4bfab7986fb63e34ca07','券操作','/volumes','9','0','0','');
insert into `sys_permission` values('1e77119e400543fe839b441e7906d33f','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','移除域角色','/manage/roles/revokeDomainUserRole','4','0','0','');
insert into `sys_permission` values('1f462d5920a44a2fa105457300ad29bf','cb05bec5d77f4f5e8d5aea9a1977f5ce','01dfdaf53e864dbca571fa7c51b2c0c8','快照','/volume/snapshot','1','0','0','');
insert into `sys_permission` values('20071b6f369a49c28a4cda8bbd6951f1','cb05bec5d77f4f5e8d5aea9a1977f5ce','3ef71bfcd05b4922bc6a6d2fb8a5d596','密钥对操作','/key_pairs','2','0','0','');
insert into `sys_permission` values('20e9997f8b6c462dbd08b3e6eeb181a6','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','给工程赋权角色','/manage/roles/grantProjectUserRole','9','0','0','');
insert into `sys_permission` values('261c199ee03e492b9844b9d6325c0d3c','cb05bec5d77f4f5e8d5aea9a1977f5ce','3ef71bfcd05b4922bc6a6d2fb8a5d596','导入密钥对','/key_pairs/import','1','0','0','');
insert into `sys_permission` values('2a02d9ec2a784341b7215d59e5bca94f','cb05bec5d77f4f5e8d5aea9a1977f5ce','989f5b57da5a4db98d52a947542ee5b8','浮动IP','/network/floatingip','1','0','0','');
insert into `sys_permission` values('2a9cf66d579147749bae47fcef7c8fcf','cb05bec5d77f4f5e8d5aea9a1977f5ce','bc2e09aaf3eb43afadafec0bed46a04f','镜像','/compute/images','3','0','0','');
insert into `sys_permission` values('2cfe7fe3f0c545f691cdf3d834b678ae','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','移除工程角色','/manage/roles/revokeProjectUserRole','7','0','0','');
insert into `sys_permission` values('324b9e4f9ca44381a95b93e9b13f57d0','cb05bec5d77f4f5e8d5aea9a1977f5ce','9c17b3901d1f4bfab7986fb63e34ca07','券快照','/volumes/snapshots','7','0','0','');
insert into `sys_permission` values('345f4df654274de9a1f9be7f5fc8b6f7','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','券','/dashboard/project/volumes','1','0','0','');
insert into `sys_permission` values('3c51291173044688acd9fbb25bd78cac','cb05bec5d77f4f5e8d5aea9a1977f5ce','8c015c91208947eca96f75078eec5a58','用户域角色列表','/user/listRoleForUserDomain','2','0','0','');
insert into `sys_permission` values('3d03377f5f6c4c30ab1c1ba295d85ded','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','组','/dashboard/project/groups','1','0','0','');
insert into `sys_permission` values('3d44e81a0c294967ba3ff4ac0dca4e9a','cb05bec5d77f4f5e8d5aea9a1977f5ce','fb4fd231e3ac4be9b215e28963989aec','项目详情','/identity/project_detail','7','0','0','');
insert into `sys_permission` values('3ebbb513ed284f3390c0933ed489edca','cb05bec5d77f4f5e8d5aea9a1977f5ce','989f5b57da5a4db98d52a947542ee5b8','安全组规则','/network/securityGroupRule','3','0','0','');
insert into `sys_permission` values('3ef71bfcd05b4922bc6a6d2fb8a5d596','cb05bec5d77f4f5e8d5aea9a1977f5ce','bc2e09aaf3eb43afadafec0bed46a04f','密钥对','/compute/keys','1','0','0','');
insert into `sys_permission` values('407009e8fa124185afe0b7072865ae89','cb05bec5d77f4f5e8d5aea9a1977f5ce','6f61a118c98c4889a523212027a43bd3','网络路由网关','/networks/routers/gateway','1','0','0','');
insert into `sys_permission` values('41843fbac1f64f1180685b57696727e3','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','给域赋权角色','/manage/roles/grantDomainUserRole','6','0','0','');
insert into `sys_permission` values('42865db9ed38401185a8a62cca0f222a','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','安全组','/dashboard/project/securityGroups','1','0','0','');
insert into `sys_permission` values('42e6c1e3d81445a38995f4d98fae8c08','cb05bec5d77f4f5e8d5aea9a1977f5ce','6b5a92662c4047e183402dc560242226','项目查询(Name)','/manage/projects/search-name','4','0','0','');
insert into `sys_permission` values('48c704b4c5c047d6860345cef768970c','cb05bec5d77f4f5e8d5aea9a1977f5ce','fb4fd231e3ac4be9b215e28963989aec','组详情','/identity/group_detail','3','0','0','');
insert into `sys_permission` values('4a71ab8172454806872743710b5f284e','cb05bec5d77f4f5e8d5aea9a1977f5ce','6b5a92662c4047e183402dc560242226','项目列表','/manage/projects','6','0','0','');
insert into `sys_permission` values('4afc285c0ea0495bbbce1d0f4b937581','cb05bec5d77f4f5e8d5aea9a1977f5ce','b1836fc20f4a43a19aad97d233068b30','系统属性','/sysattributes','1','0','0','');
insert into `sys_permission` values('4f13f23fba83401588257d6aef9419c2','cb05bec5d77f4f5e8d5aea9a1977f5ce','680b555835474c56be8359aa9770d766','组成员验证','/manage/groups/checkUser','2','0','0','');
insert into `sys_permission` values('55beca28091b4097b9c8f717691b5712','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','浮动IP','/dashboard/project/floatingips','1','0','0','');
insert into `sys_permission` values('62f64db5fa8c4d0aba2ad1dc8204bcee','cb05bec5d77f4f5e8d5aea9a1977f5ce','6cde07bddf044e669dcb949e702478d9','可用域','/instances/zones','1','0','0','');
insert into `sys_permission` values('661d17792a8e4f3696a3ef2f9815c5a7','cb05bec5d77f4f5e8d5aea9a1977f5ce','9c17b3901d1f4bfab7986fb63e34ca07','券转让创建','/volumes/transference','3','0','0','');
insert into `sys_permission` values('6716edf1bdd6440b8b24d12f3ed57044','cb05bec5d77f4f5e8d5aea9a1977f5ce','680b555835474c56be8359aa9770d766','组成员','/manage/groups/listUser','4','0','0','');
insert into `sys_permission` values('676d06b8a6304a98b276bda422ba1260','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','路由','/dashboard/project/routers','1','0','0','');
insert into `sys_permission` values('680b555835474c56be8359aa9770d766','cb05bec5d77f4f5e8d5aea9a1977f5ce','fb4fd231e3ac4be9b215e28963989aec','组','/identity/groups','4','0','0','');
insert into `sys_permission` values('6a234711625a40af92fb22d0a3df51e5','cb05bec5d77f4f5e8d5aea9a1977f5ce','680b555835474c56be8359aa9770d766','组更新','/manage/groups/update','8','0','0','');
insert into `sys_permission` values('6b1b1c38ea1f41898c899c7e7b6b3fcb','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','概况','/dashboard/project/overview','1','0','0','');
insert into `sys_permission` values('6b5a92662c4047e183402dc560242226','cb05bec5d77f4f5e8d5aea9a1977f5ce','fb4fd231e3ac4be9b215e28963989aec','项目','/identity/projects','8','0','0','');
insert into `sys_permission` values('6bf947d577d54bb08581463a7cb65824','cb05bec5d77f4f5e8d5aea9a1977f5ce','b1a86a0785174f879a12817a316a8f22','关联浮动IP','/networks/floatingIps/connecting','1','0','0','');
insert into `sys_permission` values('6cde07bddf044e669dcb949e702478d9','cb05bec5d77f4f5e8d5aea9a1977f5ce','bc2e09aaf3eb43afadafec0bed46a04f','实例','/compute/instances','6','0','0','');
insert into `sys_permission` values('6dfeabcb7e324f5d8da716407a8f30fe','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','角色查询(Name)','/manage/roles/search-name','10','0','0','');
insert into `sys_permission` values('6ed825d3a35c40b38511c5abd3931c3f','cb05bec5d77f4f5e8d5aea9a1977f5ce','8c015c91208947eca96f75078eec5a58','用户查询(Name)','/user/search-name','3','0','0','');
insert into `sys_permission` values('6f61a118c98c4889a523212027a43bd3','cb05bec5d77f4f5e8d5aea9a1977f5ce','19885f7e6a3a40c38f25a9b79b84f508','网络路由','/networks/routers','1','0','0','');
insert into `sys_permission` values('6fd4f337fc574f60bd4fd6532097d4f2','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','给工程赋权组角色','/manage/roles/grantProjectGroupRole','3','0','0','');
insert into `sys_permission` values('711347bcf87642f4a2f839673013f0db','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','密钥对','/dashboard/project/key_pairs','1','0','0','');
insert into `sys_permission` values('74b9576f8078444697f83c377749ebf6','cb05bec5d77f4f5e8d5aea9a1977f5ce','6cde07bddf044e669dcb949e702478d9','实例详情','/instances/details','3','0','0','');
insert into `sys_permission` values('74e179c744aa47b09eb2fc28a31f38ab','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','工程','/dashboard/project/projects','1','0','0','');
insert into `sys_permission` values('75e99bc292824275bfe68fae10370b54','cb05bec5d77f4f5e8d5aea9a1977f5ce','6b5a92662c4047e183402dc560242226','项目查询(Status)','/manage/projects/search-status','3','0','0','');
insert into `sys_permission` values('78b053065d2c4fa9a67f7c35f07476eb','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','角色查询(ID)','/manage/roles/search-id','11','0','0','');
insert into `sys_permission` values('7c4cffc451ca40a3a53fc786f8428615','cb05bec5d77f4f5e8d5aea9a1977f5ce','fb4fd231e3ac4be9b215e28963989aec','用户详情','/identity/user_detail','5','0','0','');
insert into `sys_permission` values('7c66a9065d8c430caf59cd21ed1c8925','cb05bec5d77f4f5e8d5aea9a1977f5ce','2a9cf66d579147749bae47fcef7c8fcf','镜像操作','/images','4','0','0','');
insert into `sys_permission` values('7d12aad1030c4dfc993af869ca0b635c','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','镜像','/dashboard/project/images','1','0','0','');
insert into `sys_permission` values('7d9bc9be746d4a4d896ad81454b4b415','cb05bec5d77f4f5e8d5aea9a1977f5ce','b1c3107a608b4c169584d580c3856b2d','网络路由接口删除','/networks/routers/interface/detachmant','1','0','0','');
insert into `sys_permission` values('80b67440e4214edeb17c8557420ecc9e','cb05bec5d77f4f5e8d5aea9a1977f5ce','680b555835474c56be8359aa9770d766','组成员添加','/manage/groups/addUser','3','0','0','');
insert into `sys_permission` values('81905027d97142f0afcb02ccbb346435','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','验证工程角色','/manage/roles/checkProjectUserRole','8','0','0','');
insert into `sys_permission` values('822748a8134d4adf8d08e873320db9c7','cb05bec5d77f4f5e8d5aea9a1977f5ce','9c17b3901d1f4bfab7986fb63e34ca07','券转让取消','/volumes/delete','1','0','0','');
insert into `sys_permission` values('8355722cad4d485bbc9320b25c2ea5a9','cb05bec5d77f4f5e8d5aea9a1977f5ce','d595dd72a2c54e03a6eb1ce369aad3d6','实例模板详细信息','/instances/flavors/details','1','0','0','');
insert into `sys_permission` values('83c3a984319f436bbb8e276a81473649','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','端口详情','/dashboard/project/portDetail','1','0','0','');
insert into `sys_permission` values('844437c8f800487ab43b5d21b09a6137','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','角色更新','/manage/roles/update','13','0','0','');
insert into `sys_permission` values('86a4c9069eb24dcf9c927eb51a70852c','cb05bec5d77f4f5e8d5aea9a1977f5ce','9c17b3901d1f4bfab7986fb63e34ca07','从实例分离券','/volumes/detachment','4','0','0','');
insert into `sys_permission` values('86b0898cf30a47e0a6aefef49d9452a6','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','角色删除','/manage/roles/delete','12','0','0','');
insert into `sys_permission` values('87800e90eba343f9bf539d632d9adcb6','cb05bec5d77f4f5e8d5aea9a1977f5ce','','Page页面','/dashboard/project','86','0','0','');
insert into `sys_permission` values('8c015c91208947eca96f75078eec5a58','cb05bec5d77f4f5e8d5aea9a1977f5ce','fb4fd231e3ac4be9b215e28963989aec','用户','/identity/users','6','0','0','');
insert into `sys_permission` values('930da72d48f34b29a8cb3d505b8c4e61','cb05bec5d77f4f5e8d5aea9a1977f5ce','6cde07bddf044e669dcb949e702478d9','实例操作','/instances','4','0','0','');
insert into `sys_permission` values('940a90f0c74942168eed7800a76b7fce','cb05bec5d77f4f5e8d5aea9a1977f5ce','680b555835474c56be8359aa9770d766','组成员移除','/manage/groups/removeUser','1','0','0','');
insert into `sys_permission` values('942eeda183c8409586d9bfaeeda1aee3','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','实例模板','/dashboard/project/instanceModal','1','0','0','');
insert into `sys_permission` values('944b8999b4074a23a15dd35bda413270','cb05bec5d77f4f5e8d5aea9a1977f5ce','9c17b3901d1f4bfab7986fb63e34ca07','连接券到实例','/volumes/attachment','5','0','0','');
insert into `sys_permission` values('989f5b57da5a4db98d52a947542ee5b8','cb05bec5d77f4f5e8d5aea9a1977f5ce','','网络','/network','88','0','0','');
insert into `sys_permission` values('98b2aa9dac7349d6a6b7406ba48095f5','cb05bec5d77f4f5e8d5aea9a1977f5ce','6b5a92662c4047e183402dc560242226','项目创建','/manage/projects/create','9','0','0','');
insert into `sys_permission` values('9ad31d69f83b48b8a44f0a0b9d2377a7','cb05bec5d77f4f5e8d5aea9a1977f5ce','bc2e09aaf3eb43afadafec0bed46a04f','概况','/compute/overview','7','0','0','');
insert into `sys_permission` values('9c17b3901d1f4bfab7986fb63e34ca07','cb05bec5d77f4f5e8d5aea9a1977f5ce','01dfdaf53e864dbca571fa7c51b2c0c8','卷','/volume/volume','2','0','0','');
insert into `sys_permission` values('9c4c560b4020494bae2b9d74ae0905c9','cb05bec5d77f4f5e8d5aea9a1977f5ce','19885f7e6a3a40c38f25a9b79b84f508','网络操作','/networks','1','0','0','');
insert into `sys_permission` values('9dab4462fbb843f2923325da0c43d76b','cb05bec5d77f4f5e8d5aea9a1977f5ce','b1a86a0785174f879a12817a316a8f22','网络浮动IP池','/networks/floatingIps/IpPools','1','0','0','');
insert into `sys_permission` values('9e024893c60441b4868074a89df50af3','cb05bec5d77f4f5e8d5aea9a1977f5ce','989f5b57da5a4db98d52a947542ee5b8','路由','/network/router','6','0','0','');
insert into `sys_permission` values('a1563036552343b99ed32ac9c512a35c','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','移除工程组角色','/manage/roles/revokeProjectGroupRole','1','0','0','');
insert into `sys_permission` values('a4cdb73477f54c9d8f7794b250c3aa37','cb05bec5d77f4f5e8d5aea9a1977f5ce','680b555835474c56be8359aa9770d766','组列表','/manage/groups','10','0','0','');
insert into `sys_permission` values('a4fb74c8bf3e4e77a3fd30459d926116','cb05bec5d77f4f5e8d5aea9a1977f5ce','19885f7e6a3a40c38f25a9b79b84f508','网络端口','/networks/ports','1','0','0','');
insert into `sys_permission` values('a55d3e960db84706987ff45df3f2a9d6','cb05bec5d77f4f5e8d5aea9a1977f5ce','b1c3107a608b4c169584d580c3856b2d','网络路由接口增加','/networks/routers/interface/attachment','1','0','0','');
insert into `sys_permission` values('a8e5ab5479ec4e90a4d37969ce797e4c','cb05bec5d77f4f5e8d5aea9a1977f5ce','989f5b57da5a4db98d52a947542ee5b8','路由详情','/network/routerDetail','5','0','0','');
insert into `sys_permission` values('a9bea9e03d1e41fc9e20ace801e4adf7','cb05bec5d77f4f5e8d5aea9a1977f5ce','bc2e09aaf3eb43afadafec0bed46a04f','镜像详情','/compute/image_detail','2','0','0','');
insert into `sys_permission` values('aa48f85a4e52411dbb844308b1094fea','cb05bec5d77f4f5e8d5aea9a1977f5ce','bc2e09aaf3eb43afadafec0bed46a04f','实例模板','/compute/instanceModal','5','0','0','');
insert into `sys_permission` values('b0c31eab334d4912b58396850bb7de42','cb05bec5d77f4f5e8d5aea9a1977f5ce','8c015c91208947eca96f75078eec5a58','用户工程角色列表','/user/listRoleForUserProject','1','0','0','');
insert into `sys_permission` values('b1836fc20f4a43a19aad97d233068b30','cb05bec5d77f4f5e8d5aea9a1977f5ce','','导航栏-root','/lager','99','0','0','');
insert into `sys_permission` values('b1a86a0785174f879a12817a316a8f22','cb05bec5d77f4f5e8d5aea9a1977f5ce','19885f7e6a3a40c38f25a9b79b84f508','网络浮动IP','/networks/floatingIps','1','0','0','');
insert into `sys_permission` values('b1c3107a608b4c169584d580c3856b2d','cb05bec5d77f4f5e8d5aea9a1977f5ce','6f61a118c98c4889a523212027a43bd3','网络路由接口','/networks/routers/interface','1','0','0','');
insert into `sys_permission` values('b4c79e46c1f24245a88cc6a6d5f1ee53','cb05bec5d77f4f5e8d5aea9a1977f5ce','8c015c91208947eca96f75078eec5a58','用户更新','/user/update','6','0','0','');
insert into `sys_permission` values('b56333efe40e481dbd8e62dac7fc30a4','cb05bec5d77f4f5e8d5aea9a1977f5ce','9c17b3901d1f4bfab7986fb63e34ca07','券扩展','/volumes/extension','6','0','0','');
insert into `sys_permission` values('b9ef5d3a0f484391a577ff9b6831e68e','cb05bec5d77f4f5e8d5aea9a1977f5ce','8c015c91208947eca96f75078eec5a58','用户列表','/user','8','0','0','');
insert into `sys_permission` values('bad593eee2ae4e0fbde437ea8095802c','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','角色创建','/manage/roles/create','14','0','0','');
insert into `sys_permission` values('bc2e09aaf3eb43afadafec0bed46a04f','cb05bec5d77f4f5e8d5aea9a1977f5ce','','计算','/compute','90','0','0','');
insert into `sys_permission` values('bc5b1b1c2ab849e896a30645f785f198','cb05bec5d77f4f5e8d5aea9a1977f5ce','bc2e09aaf3eb43afadafec0bed46a04f','实例详情','/compute/instance_detail','4','0','0','');
insert into `sys_permission` values('bf0b0356772c4d819763d80925f59293','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','用户','/dashboard/project/users','1','0','0','');
insert into `sys_permission` values('bf3528e58573445caf97d743c06297c6','cb05bec5d77f4f5e8d5aea9a1977f5ce','6b5a92662c4047e183402dc560242226','项目成员','/manage/projects/members','2','0','0','');
insert into `sys_permission` values('c1a6e14b51bc498890206be31729c528','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','用户详情','/dashboard/project/user-detail','1','0','0','');
insert into `sys_permission` values('c37f0fb7a93a4c9ca26a8cc237765537','cb05bec5d77f4f5e8d5aea9a1977f5ce','db4fe3146b45430da0eb1a9ba42892d8','获取实例使用情况','/dashboard/api/instance/usage','1','0','0','');
insert into `sys_permission` values('c85093ce6f4d456f9f653ad10408ce2a','cb05bec5d77f4f5e8d5aea9a1977f5ce','b1836fc20f4a43a19aad97d233068b30','首页','/lager/index','1','0','0','');
insert into `sys_permission` values('cde50860874742049ce3e0d854767913','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','验证域角色','/manage/roles/checkDomainUserRole','5','0','0','');
insert into `sys_permission` values('cf3f4b55ae794c59a8f2a72f88f7e7ca','cb05bec5d77f4f5e8d5aea9a1977f5ce','2a9cf66d579147749bae47fcef7c8fcf','镜像详情','/images/details','3','0','0','');
insert into `sys_permission` values('d36f9e2bd00d47faba4af73dfe3ac6a6','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','网络','/dashboard/project/networks','1','0','0','');
insert into `sys_permission` values('d46d8a0a6f164c549c4760461600fe3b','cb05bec5d77f4f5e8d5aea9a1977f5ce','fa4f4862c8274374ae7cc7674d91b20e','角色列表','/manage/roles','15','0','0','');
insert into `sys_permission` values('d595dd72a2c54e03a6eb1ce369aad3d6','cb05bec5d77f4f5e8d5aea9a1977f5ce','6cde07bddf044e669dcb949e702478d9','实例模板简略信息','/instances/flavors','2','0','0','');
insert into `sys_permission` values('d9467633296e46ddaa0f0130cfe4cf1c','cb05bec5d77f4f5e8d5aea9a1977f5ce','680b555835474c56be8359aa9770d766','组查询(Name)','/manage/groups/search-name','5','0','0','');
insert into `sys_permission` values('d9e4c84c02ff4b1b936c217c4536d1a3','cb05bec5d77f4f5e8d5aea9a1977f5ce','b1a86a0785174f879a12817a316a8f22','IP连接到项目','/networks/floatingIps/attachment','1','0','0','');
insert into `sys_permission` values('db4fe3146b45430da0eb1a9ba42892d8','cb05bec5d77f4f5e8d5aea9a1977f5ce','9ad31d69f83b48b8a44f0a0b9d2377a7','配额','/dashboard/api','1','0','0','');
insert into `sys_permission` values('db67ad4fa174427c92d8bb406992ff11','cb05bec5d77f4f5e8d5aea9a1977f5ce','19885f7e6a3a40c38f25a9b79b84f508','网络安全组','/networks/securityGroups','1','0','0','');
insert into `sys_permission` values('dc1da5ffad78438384221307c3e994f9','cb05bec5d77f4f5e8d5aea9a1977f5ce','fb4fd231e3ac4be9b215e28963989aec','角色详情','/identity/role_detail','1','0','0','');
insert into `sys_permission` values('ddc1cefb3d814daf8daea4c7e42dbc7c','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','实例','/dashboard/project/instances','1','0','0','');
insert into `sys_permission` values('e985f9784e254eebbd1b623d053f9946','cb05bec5d77f4f5e8d5aea9a1977f5ce','8c015c91208947eca96f75078eec5a58','用户查询(ID)','/user/search-id','4','0','0','');
insert into `sys_permission` values('ee43b84408d54e8fbc00934b0c3c4067','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','工程详情','/dashboard/project/project-detail','1','0','0','');
insert into `sys_permission` values('ef45e00ca8f64d8a80af1b80a8eae740','cb05bec5d77f4f5e8d5aea9a1977f5ce','989f5b57da5a4db98d52a947542ee5b8','安全组','/network/securityGroup','4','0','0','');
insert into `sys_permission` values('f37ca399acd045f3be8b87779738fac5','cb05bec5d77f4f5e8d5aea9a1977f5ce','680b555835474c56be8359aa9770d766','组查询(ID)','/manage/groups/search-id','6','0','0','');
insert into `sys_permission` values('f640b6ec63674740a37a6ab759148089','cb05bec5d77f4f5e8d5aea9a1977f5ce','19885f7e6a3a40c38f25a9b79b84f508','网络安全组规则','/networks/securityGroupRules','1','0','0','');
insert into `sys_permission` values('f8b07a5778e44c198456f990424a0e0d','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','角色','/dashboard/project/roles','1','0','0','');
insert into `sys_permission` values('f933e380ff6a4e878e999ba9de07d8a5','cb05bec5d77f4f5e8d5aea9a1977f5ce','989f5b57da5a4db98d52a947542ee5b8','网络详情','/network/networkDetail','7','0','0','');
insert into `sys_permission` values('fa4f4862c8274374ae7cc7674d91b20e','cb05bec5d77f4f5e8d5aea9a1977f5ce','fb4fd231e3ac4be9b215e28963989aec','角色','/identity/roles','2','0','0','');
insert into `sys_permission` values('faed46028c0d443e8a5006223681febb','cb05bec5d77f4f5e8d5aea9a1977f5ce','87800e90eba343f9bf539d632d9adcb6','角色详情','/dashboard/project/role-detail','1','0','0','');
insert into `sys_permission` values('fb4fd231e3ac4be9b215e28963989aec','cb05bec5d77f4f5e8d5aea9a1977f5ce','','身份管理','/identity','87','0','0','');
insert into `sys_permission` values('fd5cdb0f01a74ce08f685c759a24da9c','cb05bec5d77f4f5e8d5aea9a1977f5ce','9c17b3901d1f4bfab7986fb63e34ca07','券转让接收','/volumes/acception','2','0','0','');
insert into `sys_permission` values('ff74f1cc9d4a4d65848ad43e4296d7db','cb05bec5d77f4f5e8d5aea9a1977f5ce','8c015c91208947eca96f75078eec5a58','用户创建','/user/create','7','0','0','');

-- ----------------------------
-- Table structure for  SYS_RE_ROLE_PERMISSION 
-- ----------------------------
CREATE TABLE  `sys_re_role_permission`  (
   id  varchar(64) NOT NULL,
   roleId  varchar(64) NOT NULL COMMENT '角色ID',
   permissionId  varchar(32) NOT NULL COMMENT '权限ID',
   appId  varchar(64) NOT NULL,
  PRIMARY KEY ( id ),
  CONSTRAINT  FK_SYS_RE_R_REFERENCE_SYS_PERM  FOREIGN KEY ( permissionId ) REFERENCES  sys_permission  ( id ),
  CONSTRAINT  FK_SYS_RE_R_REFERENCE_SYS_ROLE  FOREIGN KEY ( roleId ) REFERENCES  role  ( id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT= '角色权限表';

-- ----------------------------
-- Records of SYS_RE_ROLE_PERMISSION
-- ----------------------------
INSERT INTO  `sys_re_role_permission`  VALUES ('67a5266f3a9b4beb8d67ea924f70455c', 'c44d712811bf4f6cacd0ec4e623d5862', '044994dfe33d4f4599ddf980ccf5db9b', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('fde0afa2d25647df8c4f67e24a412595', 'c44d712811bf4f6cacd0ec4e623d5862', 'b50cc3ce36c642759ac64e32de0e5d8e', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('045589bfefac4089911064abd431d0c9', 'c44d712811bf4f6cacd0ec4e623d5862', 'ea5365d508d747b5a0756838ffafa89c', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('48b6f7a03cda47858fedf33c885e442f', 'c44d712811bf4f6cacd0ec4e623d5862', '90b9dac05cb14883adc2996cc4ea64f0', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('8f40d8c609f04d16b6bda656706b0b73', 'c44d712811bf4f6cacd0ec4e623d5862', '936c11e51b8444d194fc358f656ef023', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('489b3df7379945a8a8b609dbe7f6c757', 'c44d712811bf4f6cacd0ec4e623d5862', '3ab8e14c53644645a5313c03ef49e545', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('76938717200e4981bf3b38e790f60a92', 'c44d712811bf4f6cacd0ec4e623d5862', '50705f64a4c3438fa5567cea6fd793df', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('6f34e39590de4fcdaf3335fe7ae3a273', 'c44d712811bf4f6cacd0ec4e623d5862', 'd227354289a54902a0430a2a98271799', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('e4cbb07ad5e943d8a42cf6e3523dd8b3', 'c44d712811bf4f6cacd0ec4e623d5862', 'd73d19f6324f4678ac52170aad7cede6', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('c6b5b2313eec491faa42a9f229d63d80', 'c44d712811bf4f6cacd0ec4e623d5862', '47f1a39ab7be4646a350ac9d12e4edc6', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('8de14b9d93e24a19aedbacdbe328ea74', 'c44d712811bf4f6cacd0ec4e623d5862', 'de30ae1d5d534b6da88f9c1a7192319d', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('0c3dae9c9b294856bb727b35c5bab149', 'c44d712811bf4f6cacd0ec4e623d5862', 'aac41f81758b4cf0b7860b141039c155', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('45a3a1626bbd40a698eb7a9d0f448acd', 'c44d712811bf4f6cacd0ec4e623d5862', 'f9fd274fb713479884282d8e5b179e74', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('9543fe62b61d4bcfae3a1e5aad388b5f', 'c44d712811bf4f6cacd0ec4e623d5862', 'ebf02dadc2bb441c96eaaa7380ebc78c', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('c657141f07af41c88cdfe30fe862b462', 'c44d712811bf4f6cacd0ec4e623d5862', 'fb6f9a13302b41ad8f4be4d3b4b834bc', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('0658988508ec46d0a97b5f223a1c6d7f', 'c44d712811bf4f6cacd0ec4e623d5862', '3cad878a1a8c44608714c72ea9dd5c0b', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('5c1172f530a14023bacc6c238bcc126a', 'c44d712811bf4f6cacd0ec4e623d5862', 'f1b7fdbb0ae74d24947eeacfa930f708', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('fab19377854c45bf9653d1ce89b1a074', 'c44d712811bf4f6cacd0ec4e623d5862', 'e7aa3b42b01f4b25ad2f7bcaad19eb5a', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('fa98a70e31d240189128d979955a0467', 'c44d712811bf4f6cacd0ec4e623d5862', '380b7aadd03140a29059f35bf4bf058a', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('e79ddb28e1ec4088b8a919b5f4789504', 'c44d712811bf4f6cacd0ec4e623d5862', 'e764eaa171cc4a9d80da556051b1dcc8', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('daad9ef3ce5b4871a473977970abc57a', 'c44d712811bf4f6cacd0ec4e623d5862', '70f5393073c24ff6adf7411c7c3e1b8d', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('ad4df61fe50c430ea7ddbfa51719ee37', 'c44d712811bf4f6cacd0ec4e623d5862', '026990ed3b014288bec400eafcec52a3', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('d6eae4bc3f844eba89abbbe1dc76b1e2', 'c44d712811bf4f6cacd0ec4e623d5862', '82ca217e40d745978905177ee5066dd9', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('1961b4a537af43fca75a45ca4ad6a758', 'c44d712811bf4f6cacd0ec4e623d5862', '225eb3e556184f28a59dd3e2e3afec1b', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('835e22cfc30c4f949ea08a83199718a7', 'c44d712811bf4f6cacd0ec4e623d5862', '8a88efe1bb11473b85b995281062f60f', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('66e14955ccd1491387ec78160d2c63d0', 'c44d712811bf4f6cacd0ec4e623d5862', '560b57ae42f6482d817d58d8e471883d', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('ed8853fcff024061adb8ee089f9578b5', 'c44d712811bf4f6cacd0ec4e623d5862', 'f87f9036fc3f4bc1b879f42e24462978', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('2fdee1202d7d4c25b79e5777e001f0f1', 'c44d712811bf4f6cacd0ec4e623d5862', '585fbc8f1793402e8091620658cb161b', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('7025bd149f3d461c9c0be5e8d4730041', 'c44d712811bf4f6cacd0ec4e623d5862', '34daaec1ff4e4e22849f4b3afc694316', '7df5552a7c99429bb948a8cf29291183');
INSERT INTO  `sys_re_role_permission`  VALUES ('e10556bf18d24c4fb37e0c42fcaccbf4', 'c44d712811bf4f6cacd0ec4e623d5862', 'f35ace1ba72f4d80b702c33a39c03e6a', '7df5552a7c99429bb948a8cf29291183');
insert into `sys_re_role_permission` values('0018366ee5294c0cb480668d33aa397a','9c073cede3b54eada0cbd45e6e566b85','42e6c1e3d81445a38995f4d98fae8c08','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('00b03924b06b4067b61e230885d4820f','9c073cede3b54eada0cbd45e6e566b85','7d12aad1030c4dfc993af869ca0b635c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('013919978314444a8ee6fb014509edba','9c073cede3b54eada0cbd45e6e566b85','676d06b8a6304a98b276bda422ba1260','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('0249256fea2f4ee88653a8205b3753fa','e5112263c6c54bf283a7d413819c4eec','8c015c91208947eca96f75078eec5a58','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('02b5d483795d4237bfce794c4e153f48','9c073cede3b54eada0cbd45e6e566b85','bc2e09aaf3eb43afadafec0bed46a04f','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('02bfe5527dcb4d0ab3785069cf9e900f','e5112263c6c54bf283a7d413819c4eec','00abc275406444f0a4ad939a843885a8','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('04420f9960c9427b967a471d5c4b7f53','9c073cede3b54eada0cbd45e6e566b85','faed46028c0d443e8a5006223681febb','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('046bf9a551ff4e18ad36409e7c3df26f','9c073cede3b54eada0cbd45e6e566b85','75e99bc292824275bfe68fae10370b54','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('06611a902cf6443cb87d2820acc43fe3','e5112263c6c54bf283a7d413819c4eec','6dfeabcb7e324f5d8da716407a8f30fe','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('07079c55e45b48bf9132480aa04b670e','e5112263c6c54bf283a7d413819c4eec','78b053065d2c4fa9a67f7c35f07476eb','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('08b178af25e949e8812662bd22dae299','e5112263c6c54bf283a7d413819c4eec','a9bea9e03d1e41fc9e20ace801e4adf7','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('0954944c366f42cfaae519e6e8f93186','9c073cede3b54eada0cbd45e6e566b85','ef45e00ca8f64d8a80af1b80a8eae740','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('099baf65d98145689ced9cb69727b032','9c073cede3b54eada0cbd45e6e566b85','940a90f0c74942168eed7800a76b7fce','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('0afc489761e642f19f4522f7d6e914c3','9c073cede3b54eada0cbd45e6e566b85','6f61a118c98c4889a523212027a43bd3','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('0d86cf4728ce437fa937c43941f770c4','9c073cede3b54eada0cbd45e6e566b85','bf0b0356772c4d819763d80925f59293','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('0e12600ce0904d4d8662d11728cadb3f','9c073cede3b54eada0cbd45e6e566b85','83c3a984319f436bbb8e276a81473649','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('0e29938f5f384eabbbb0583bbe1d0948','e5112263c6c54bf283a7d413819c4eec','c37f0fb7a93a4c9ca26a8cc237765537','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('11369a9687bc4a62873f4f78c12cda37','e5112263c6c54bf283a7d413819c4eec','077ce67654394509a223b17661cf7963','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('14a1df830ec347eea913e2b6a812eb16','9c073cede3b54eada0cbd45e6e566b85','9dab4462fbb843f2923325da0c43d76b','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('1582cd763b6a48d1b474d6b4ab3e8d3a','9c073cede3b54eada0cbd45e6e566b85','680b555835474c56be8359aa9770d766','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('1672bc5cfbb149f8a312e65622ed45c0','9c073cede3b54eada0cbd45e6e566b85','db67ad4fa174427c92d8bb406992ff11','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('171437b3a9b0482c91df4bf312bd6447','9c073cede3b54eada0cbd45e6e566b85','b1c3107a608b4c169584d580c3856b2d','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('17633ac5629a481a868ad455f7fa1634','e5112263c6c54bf283a7d413819c4eec','6cde07bddf044e669dcb949e702478d9','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('18bec5f3edea4b8ea138e6cb482b2999','e5112263c6c54bf283a7d413819c4eec','db4fe3146b45430da0eb1a9ba42892d8','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('18ef8db32ee2432d8a417bd3d0b95d03','9c073cede3b54eada0cbd45e6e566b85','930da72d48f34b29a8cb3d505b8c4e61','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('1a2846280e834ec3a66ddf4ede35c5c2','9c073cede3b54eada0cbd45e6e566b85','f37ca399acd045f3be8b87779738fac5','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('1a6efc7bf3e8422995503397a93afc8a','9c073cede3b54eada0cbd45e6e566b85','844437c8f800487ab43b5d21b09a6137','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('1a7a0bfc325944db8871e273cb2d62ff','e5112263c6c54bf283a7d413819c4eec','ee43b84408d54e8fbc00934b0c3c4067','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('1aa5db95df9a453bb3d52f61b1acc635','9c073cede3b54eada0cbd45e6e566b85','6b5a92662c4047e183402dc560242226','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('1b5010433dd64813af25d1041cb72af9','e5112263c6c54bf283a7d413819c4eec','942eeda183c8409586d9bfaeeda1aee3','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('1bc751488567414db39a65862f1e515c','9c073cede3b54eada0cbd45e6e566b85','09105ac3ba8d4c66a28319c53996689e','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('1e96d2ee876846b694ffdd9dbaba830d','9c073cede3b54eada0cbd45e6e566b85','62f64db5fa8c4d0aba2ad1dc8204bcee','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('1fa3805b05bc4dfeb537292c7dfee7cb','9c073cede3b54eada0cbd45e6e566b85','6b1b1c38ea1f41898c899c7e7b6b3fcb','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('235df79a885d46c2945ce883de21f81c','e5112263c6c54bf283a7d413819c4eec','7d12aad1030c4dfc993af869ca0b635c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('27e7946ac6904db4b94cac223a9643fb','e5112263c6c54bf283a7d413819c4eec','83c3a984319f436bbb8e276a81473649','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('27fbb3938db5468d95c2eb92b80a4939','9c073cede3b54eada0cbd45e6e566b85','3c51291173044688acd9fbb25bd78cac','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('2847a75ac34345a1afca93579ca40b67','9c073cede3b54eada0cbd45e6e566b85','98b2aa9dac7349d6a6b7406ba48095f5','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('29ca3f8ce5944ad3b14153655256ad15','e5112263c6c54bf283a7d413819c4eec','1bb6dd22e75144419b5b28a0680fde68','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('2a0a8155b066400dbc8489f4d71b2f90','9c073cede3b54eada0cbd45e6e566b85','9ad31d69f83b48b8a44f0a0b9d2377a7','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('2a46020a57c74334b9496354a01e5702','9c073cede3b54eada0cbd45e6e566b85','1316ef6f91984889a2f54ab807999fd7','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('2a9e0701138a40e4a2a37f7695ff39c8','e5112263c6c54bf283a7d413819c4eec','676d06b8a6304a98b276bda422ba1260','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('2b35c6cc132c4407a298313cdbcbd8fc','e5112263c6c54bf283a7d413819c4eec','87800e90eba343f9bf539d632d9adcb6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('2d2debcfc7834de68763f882bb6ad15c','9c073cede3b54eada0cbd45e6e566b85','8c015c91208947eca96f75078eec5a58','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('2d68ede6ff34455e84210d82706d217f','9c073cede3b54eada0cbd45e6e566b85','a4cdb73477f54c9d8f7794b250c3aa37','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('2ddfcd585975467fb421b4de45b8c712','e5112263c6c54bf283a7d413819c4eec','fb4fd231e3ac4be9b215e28963989aec','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('309b02d3f16e467f86d493ac0e2b54d9','9c073cede3b54eada0cbd45e6e566b85','d9467633296e46ddaa0f0130cfe4cf1c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('312f58b6ce7b4e388f8a7dcc2a26217e','e5112263c6c54bf283a7d413819c4eec','f37ca399acd045f3be8b87779738fac5','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('31bced984b53423d8213a32c30b5ad58','e5112263c6c54bf283a7d413819c4eec','d595dd72a2c54e03a6eb1ce369aad3d6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('32ffde4aa6dc4549ae20b4c3da10e2e6','9c073cede3b54eada0cbd45e6e566b85','1e77119e400543fe839b441e7906d33f','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('347420bc8c2043598d7660106fb507c3','9c073cede3b54eada0cbd45e6e566b85','a8e5ab5479ec4e90a4d37969ce797e4c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('34ba6a60e7044b39bc23b0a6ede98b23','e5112263c6c54bf283a7d413819c4eec','345f4df654274de9a1f9be7f5fc8b6f7','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('3512fea42eb942248e2daabd8331abc9','9c073cede3b54eada0cbd45e6e566b85','1ae0164b5654430bbdc5cc89ad31af07','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('36368cf2686e4386814b9cb4629e11ad','9c073cede3b54eada0cbd45e6e566b85','185f93a30b34461f8cd45ae656ccde66','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('3780382408c6458b81e149e5f78823b7','9c073cede3b54eada0cbd45e6e566b85','0c8e4a16c11849ba9626ea1fd3c0c9ff','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('38a96bab259b44a3998fa97e8de50684','e5112263c6c54bf283a7d413819c4eec','e985f9784e254eebbd1b623d053f9946','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('3928e9947e584281bb5d82fa4f7f8745','e5112263c6c54bf283a7d413819c4eec','6b1b1c38ea1f41898c899c7e7b6b3fcb','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('397f51e44ba040bcb77bfa56eaf29472','e5112263c6c54bf283a7d413819c4eec','55beca28091b4097b9c8f717691b5712','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('3e0180a29d1d46a9bf7cff946579b057','9c073cede3b54eada0cbd45e6e566b85','3ef71bfcd05b4922bc6a6d2fb8a5d596','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('3f34c9a2ddaa461eb5be6dd30c396782','9c073cede3b54eada0cbd45e6e566b85','b0c31eab334d4912b58396850bb7de42','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('3f6fe30b59bb4cd19d184da9f83d0d59','9c073cede3b54eada0cbd45e6e566b85','1641ee72d895428eba1125d590893881','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('3fb9e57c946645b5a3d1cd66d2f20bf3','9c073cede3b54eada0cbd45e6e566b85','944b8999b4074a23a15dd35bda413270','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('4123df4e763148eebb1e332fc2049d32','9c073cede3b54eada0cbd45e6e566b85','407009e8fa124185afe0b7072865ae89','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('41e86fc4055b4519a4b8b67907e7f013','9c073cede3b54eada0cbd45e6e566b85','00482c332473477fa99065ef32d10910','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('42b417b2167545ef890547cc2d3ad77b','9c073cede3b54eada0cbd45e6e566b85','15377d45f54248be92eed0bde29e9284','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('43524f5d75bf47eca05ae9766d5d6207','e5112263c6c54bf283a7d413819c4eec','bc2e09aaf3eb43afadafec0bed46a04f','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('440325600be745ffb19733f56ca34866','9c073cede3b54eada0cbd45e6e566b85','0186a19111364ca59588e0168933a6c3','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('45140113633b4c2cb561f6ea565eeee8','9c073cede3b54eada0cbd45e6e566b85','081420bb616c4a6bb3c7d24ad8105266','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('48ad742549274e708ce11a6bd032b6ec','9c073cede3b54eada0cbd45e6e566b85','ee43b84408d54e8fbc00934b0c3c4067','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('49b55a981ce641699ba4c789817f1a13','e5112263c6c54bf283a7d413819c4eec','c85093ce6f4d456f9f653ad10408ce2a','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('4c2306d384ba4e1fa338ed151d37e7f2','9c073cede3b54eada0cbd45e6e566b85','3d03377f5f6c4c30ab1c1ba295d85ded','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('4c48125ad608476485ca0f4493610fff','9c073cede3b54eada0cbd45e6e566b85','6fd4f337fc574f60bd4fd6532097d4f2','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('4dc838bdca844bce9a9d99fdd519697c','9c073cede3b54eada0cbd45e6e566b85','124c9978a78a44008ccf10779b02abc1','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('5224a90158ac43c59a6b58cb1d8f6dd5','9c073cede3b54eada0cbd45e6e566b85','dc1da5ffad78438384221307c3e994f9','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('52e93abd65aa42db917ae66fe2a51cb6','e5112263c6c54bf283a7d413819c4eec','74b9576f8078444697f83c377749ebf6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('533d6d1b17ce4f45abc7634add524dbc','9c073cede3b54eada0cbd45e6e566b85','7c66a9065d8c430caf59cd21ed1c8925','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('5340d50e14634e1fa3f104cbae08e14b','e5112263c6c54bf283a7d413819c4eec','bc5b1b1c2ab849e896a30645f785f198','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('54ce3f9a3a1e49e3893070be1ef98307','e5112263c6c54bf283a7d413819c4eec','6b5a92662c4047e183402dc560242226','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('55aaf5b56ef14dbfb6aa5b2b958f93b3','9c073cede3b54eada0cbd45e6e566b85','7d9bc9be746d4a4d896ad81454b4b415','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('596f182dfa654298b4efc868afb2c6ef','9c073cede3b54eada0cbd45e6e566b85','87800e90eba343f9bf539d632d9adcb6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('5c253a7ac29644ac9e1f3d3165229bd7','9c073cede3b54eada0cbd45e6e566b85','a9bea9e03d1e41fc9e20ace801e4adf7','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('5d733f5984fa4f748608cf0da73a8a06','9c073cede3b54eada0cbd45e6e566b85','b56333efe40e481dbd8e62dac7fc30a4','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('5e4f612ddfa74e7b8ca7f87fb6692908','e5112263c6c54bf283a7d413819c4eec','711347bcf87642f4a2f839673013f0db','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('5fa8306cf1ee418dae2a02463bb8fe82','9c073cede3b54eada0cbd45e6e566b85','7c4cffc451ca40a3a53fc786f8428615','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('60fe201036264c5f951f9bf1cf0d8f28','9c073cede3b54eada0cbd45e6e566b85','4afc285c0ea0495bbbce1d0f4b937581','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('632e3197ad334fcb86ff246091dbf23b','e5112263c6c54bf283a7d413819c4eec','8355722cad4d485bbc9320b25c2ea5a9','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('6461b23038944f79b9b2d6edefe2d8d8','9c073cede3b54eada0cbd45e6e566b85','48c704b4c5c047d6860345cef768970c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('66d3e231edf84ebfa2e10b1dd33c12ac','9c073cede3b54eada0cbd45e6e566b85','fb4fd231e3ac4be9b215e28963989aec','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('6950a1bb219d41c0bd5cbd8b8c29c997','e5112263c6c54bf283a7d413819c4eec','fa4f4862c8274374ae7cc7674d91b20e','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('6ab8de5e17604fbca4f079819d803a92','9c073cede3b54eada0cbd45e6e566b85','c37f0fb7a93a4c9ca26a8cc237765537','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('6b68a03c76e9401fa401832fe9b27e94','9c073cede3b54eada0cbd45e6e566b85','ff74f1cc9d4a4d65848ad43e4296d7db','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('6c1ce0c6a0dc4e2f8bd8087050c4eed9','9c073cede3b54eada0cbd45e6e566b85','18c37d2f250247f4b8cd91c5f16eeb15','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('6d32f28fa5664089b55451a385dda1c2','e5112263c6c54bf283a7d413819c4eec','9ad31d69f83b48b8a44f0a0b9d2377a7','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('6f173062412c40b99dbfdf5e819f20db','9c073cede3b54eada0cbd45e6e566b85','1bb6dd22e75144419b5b28a0680fde68','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('6f1e51d74b7b4f58970e13d8006c9898','9c073cede3b54eada0cbd45e6e566b85','989f5b57da5a4db98d52a947542ee5b8','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('6fbe7e82523d4b00a3584b6c54a4e4b9','9c073cede3b54eada0cbd45e6e566b85','6ed825d3a35c40b38511c5abd3931c3f','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('71e59afb3a8547019a8aac1f7d50c6f6','9c073cede3b54eada0cbd45e6e566b85','8355722cad4d485bbc9320b25c2ea5a9','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('72eb628374dd47b49b213c2122824541','9c073cede3b54eada0cbd45e6e566b85','3ebbb513ed284f3390c0933ed489edca','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('7618ffa74e274c96a0ec8ba5abe0798f','9c073cede3b54eada0cbd45e6e566b85','19885f7e6a3a40c38f25a9b79b84f508','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('76833771b1344437a5581e437799a5d0','e5112263c6c54bf283a7d413819c4eec','b1836fc20f4a43a19aad97d233068b30','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('7766c9decf954a14b1292232f1c5f231','e5112263c6c54bf283a7d413819c4eec','3d03377f5f6c4c30ab1c1ba295d85ded','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('77b1b871fa5843aca76ae40f8ce49d5b','9c073cede3b54eada0cbd45e6e566b85','6716edf1bdd6440b8b24d12f3ed57044','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('78140fe614c447f98397763097e78e09','9c073cede3b54eada0cbd45e6e566b85','86a4c9069eb24dcf9c927eb51a70852c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('79b2fe27845f4692ae3be14cd1ecaed4','9c073cede3b54eada0cbd45e6e566b85','6cde07bddf044e669dcb949e702478d9','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('79b87caab3b1464380d3b9ff6c548128','e5112263c6c54bf283a7d413819c4eec','680b555835474c56be8359aa9770d766','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('7c7a5e8c3c534be08fdc94358936f705','e5112263c6c54bf283a7d413819c4eec','ddc1cefb3d814daf8daea4c7e42dbc7c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('7ce27ad80143416d884c38086cb30101','9c073cede3b54eada0cbd45e6e566b85','55beca28091b4097b9c8f717691b5712','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('7cee768816b646d89ecb1b63899a6ed1','9c073cede3b54eada0cbd45e6e566b85','a1563036552343b99ed32ac9c512a35c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('7f0446435e0c4d06b3e1a5ac23f2b586','9c073cede3b54eada0cbd45e6e566b85','b1836fc20f4a43a19aad97d233068b30','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('8243f7b974254015ae56ce0cdf20c4c5','9c073cede3b54eada0cbd45e6e566b85','20e9997f8b6c462dbd08b3e6eeb181a6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('85663e0114cb4efb85fa70dfc7e346b8','e5112263c6c54bf283a7d413819c4eec','42865db9ed38401185a8a62cca0f222a','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('86443b6c44cf4f2eb984c8838d90cf09','9c073cede3b54eada0cbd45e6e566b85','aa48f85a4e52411dbb844308b1094fea','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('88f4d36d38e646aab531de166f455aca','9c073cede3b54eada0cbd45e6e566b85','d46d8a0a6f164c549c4760461600fe3b','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('89370652b1274178a060f73e22dadb4b','9c073cede3b54eada0cbd45e6e566b85','db4fe3146b45430da0eb1a9ba42892d8','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('8a27bfcd4f664deba0e1912b268f5087','9c073cede3b54eada0cbd45e6e566b85','d595dd72a2c54e03a6eb1ce369aad3d6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('8a6b73b8e5264938a86f8e4780fa7285','e5112263c6c54bf283a7d413819c4eec','d9467633296e46ddaa0f0130cfe4cf1c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('8be8ca30130c4d48b77415ac2e3765d5','9c073cede3b54eada0cbd45e6e566b85','bc5b1b1c2ab849e896a30645f785f198','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('8ce201627351402ea5f87f8ffa37b001','9c073cede3b54eada0cbd45e6e566b85','9c4c560b4020494bae2b9d74ae0905c9','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('8ce77e67528849fd9934ad78580a0772','9c073cede3b54eada0cbd45e6e566b85','1e5ce28aa65b4dd9ae836b053aa454a8','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('90be73702d0a45648183b15fb3200ae9','9c073cede3b54eada0cbd45e6e566b85','a4fb74c8bf3e4e77a3fd30459d926116','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('928fcf9ffbf34f12a5d49481c4146464','9c073cede3b54eada0cbd45e6e566b85','bf3528e58573445caf97d743c06297c6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('94a2ee853db9482b9975d8e769e394cb','e5112263c6c54bf283a7d413819c4eec','f8b07a5778e44c198456f990424a0e0d','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('952f8183ceb445a0829ce4d4e8d335b0','e5112263c6c54bf283a7d413819c4eec','4a71ab8172454806872743710b5f284e','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('95e56dec249d4074a43b29e86636d6c3','9c073cede3b54eada0cbd45e6e566b85','345f4df654274de9a1f9be7f5fc8b6f7','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('96417d1a61914a898d78b50a26c0b465','e5112263c6c54bf283a7d413819c4eec','4afc285c0ea0495bbbce1d0f4b937581','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('9d49f4e0dfa5434183ff2eaff87b0d75','9c073cede3b54eada0cbd45e6e566b85','1f462d5920a44a2fa105457300ad29bf','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('9f4400d62fd346e6aed0090e2002c965','9c073cede3b54eada0cbd45e6e566b85','2a9cf66d579147749bae47fcef7c8fcf','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('9fa08ade6fd64df5a19d533b5f3ba053','9c073cede3b54eada0cbd45e6e566b85','bad593eee2ae4e0fbde437ea8095802c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('9fe8f115114b455cb8832feba65b6d5e','9c073cede3b54eada0cbd45e6e566b85','077ce67654394509a223b17661cf7963','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a0d0beb1e587458ea690f4b18fdd8a5e','e5112263c6c54bf283a7d413819c4eec','75e99bc292824275bfe68fae10370b54','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a31fa67c98454bb49685baf6126c3847','e5112263c6c54bf283a7d413819c4eec','d36f9e2bd00d47faba4af73dfe3ac6a6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a3ac24a6c0ee4b36b1c18d941833682c','9c073cede3b54eada0cbd45e6e566b85','d9e4c84c02ff4b1b936c217c4536d1a3','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a4c2593fea93487d8a4aa0fc09cf034e','9c073cede3b54eada0cbd45e6e566b85','9c17b3901d1f4bfab7986fb63e34ca07','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a547355d307848c4b67d61171ed2a2a3','e5112263c6c54bf283a7d413819c4eec','74e179c744aa47b09eb2fc28a31f38ab','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a637288a148a4019b97378e8937382f9','9c073cede3b54eada0cbd45e6e566b85','74b9576f8078444697f83c377749ebf6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a6c5e9871e8b4afcbe02a9715bd06642','9c073cede3b54eada0cbd45e6e566b85','b9ef5d3a0f484391a577ff9b6831e68e','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a7c51abc77964df8b0150cbb4de31cbe','9c073cede3b54eada0cbd45e6e566b85','cde50860874742049ce3e0d854767913','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a7f3e4298fd44c4b9bc52d3fa8f78002','9c073cede3b54eada0cbd45e6e566b85','2a02d9ec2a784341b7215d59e5bca94f','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a8509516ecdb44fbbf20d782e404d614','9c073cede3b54eada0cbd45e6e566b85','cf3f4b55ae794c59a8f2a72f88f7e7ca','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a8df579c10ee424e9209fa4ac5601452','e5112263c6c54bf283a7d413819c4eec','42e6c1e3d81445a38995f4d98fae8c08','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a92cfb9266b64c4a9ae5352e11f96710','9c073cede3b54eada0cbd45e6e566b85','f8b07a5778e44c198456f990424a0e0d','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('a9633873b72e4dcdb206e51b03a3eaa3','9c073cede3b54eada0cbd45e6e566b85','c85093ce6f4d456f9f653ad10408ce2a','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('adcdb81e6f604134af370ac0590758bc','e5112263c6c54bf283a7d413819c4eec','cf3f4b55ae794c59a8f2a72f88f7e7ca','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('ae6632d032f3474c8e09c012df9f8a24','9c073cede3b54eada0cbd45e6e566b85','942eeda183c8409586d9bfaeeda1aee3','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('b11b3a253a444a55a716dbca12520bf9','9c073cede3b54eada0cbd45e6e566b85','fa4f4862c8274374ae7cc7674d91b20e','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('b57ef3b605bb4cb7bc18c2e676d82f97','9c073cede3b54eada0cbd45e6e566b85','661d17792a8e4f3696a3ef2f9815c5a7','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('b746bd7fcc3c47ec87d200a9e123841b','9c073cede3b54eada0cbd45e6e566b85','4a71ab8172454806872743710b5f284e','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('b8f9a2743a8d4bffa3443c3b74f29acd','9c073cede3b54eada0cbd45e6e566b85','ddc1cefb3d814daf8daea4c7e42dbc7c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('b958b74542ec4af6b07a7df4fedf5906','e5112263c6c54bf283a7d413819c4eec','2a9cf66d579147749bae47fcef7c8fcf','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('b9db1dd2de4e417fa5342884124d6323','e5112263c6c54bf283a7d413819c4eec','faed46028c0d443e8a5006223681febb','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('bbaf21d479f241468387ded34e400793','e5112263c6c54bf283a7d413819c4eec','a4cdb73477f54c9d8f7794b250c3aa37','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('be6e4faf552a49808725f66df2ecaf6c','9c073cede3b54eada0cbd45e6e566b85','6bf947d577d54bb08581463a7cb65824','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('beeaf43ac5f54665942a96eb07ac8ff7','9c073cede3b54eada0cbd45e6e566b85','0c17732cad0b48c3a48272df3de52510','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('c0a8b67f667f46d3b1ab6342cd5b3073','e5112263c6c54bf283a7d413819c4eec','c1a6e14b51bc498890206be31729c528','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('c3acfd832cf74127bd28042a0bed3671','9c073cede3b54eada0cbd45e6e566b85','711347bcf87642f4a2f839673013f0db','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('c48c56b7b489491bb077438623dc4bff','9c073cede3b54eada0cbd45e6e566b85','261c199ee03e492b9844b9d6325c0d3c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('c4d4e420d545418d8df351728b8aa656','9c073cede3b54eada0cbd45e6e566b85','01dfdaf53e864dbca571fa7c51b2c0c8','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('c575fb4e1d5a401cbb2ef1ad1a60786b','9c073cede3b54eada0cbd45e6e566b85','74e179c744aa47b09eb2fc28a31f38ab','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('c9beae3fe9c34c9bb08f7a8cefebd1d4','9c073cede3b54eada0cbd45e6e566b85','00abc275406444f0a4ad939a843885a8','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('cabc9d5b8f564a35be0e4b5739b5433b','9c073cede3b54eada0cbd45e6e566b85','a55d3e960db84706987ff45df3f2a9d6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('cb582b2dd68440af9b2feea2d4b7f754','9c073cede3b54eada0cbd45e6e566b85','20071b6f369a49c28a4cda8bbd6951f1','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('cc1278f72c8047b693bd919b425daf48','9c073cede3b54eada0cbd45e6e566b85','14046ffd3abf45318b11609ea6183694','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('ccada79adba342a5882bf87dc30ba0b3','9c073cede3b54eada0cbd45e6e566b85','42865db9ed38401185a8a62cca0f222a','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('cf9aafb534f74f4d912858ed9bd1d5e6','9c073cede3b54eada0cbd45e6e566b85','e985f9784e254eebbd1b623d053f9946','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('d1c0faeb2e4a42d887ed762ccd3eb5e7','e5112263c6c54bf283a7d413819c4eec','1641ee72d895428eba1125d590893881','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('d69143a530c74e909eaa5c6e33808638','9c073cede3b54eada0cbd45e6e566b85','b1a86a0785174f879a12817a316a8f22','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('db48a27eac2349b68848050f0e602659','9c073cede3b54eada0cbd45e6e566b85','fd5cdb0f01a74ce08f685c759a24da9c','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('dc63767ea0614efd9c53072d22dd51a0','e5112263c6c54bf283a7d413819c4eec','1316ef6f91984889a2f54ab807999fd7','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('df89b3a7dacf4d4a97e9a67be90a07eb','9c073cede3b54eada0cbd45e6e566b85','324b9e4f9ca44381a95b93e9b13f57d0','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('e085bf898eb94fc0aa0a45842ea37bdd','9c073cede3b54eada0cbd45e6e566b85','f640b6ec63674740a37a6ab759148089','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('e64372a6abb447aa87cf05cff788aa0d','9c073cede3b54eada0cbd45e6e566b85','6dfeabcb7e324f5d8da716407a8f30fe','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('e8e80fdaf1e843e4ba4bfc71a0f4fa74','9c073cede3b54eada0cbd45e6e566b85','4f13f23fba83401588257d6aef9419c2','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('ec2252b3b6904879937ece1af39d0b94','9c073cede3b54eada0cbd45e6e566b85','41843fbac1f64f1180685b57696727e3','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('ede7eab21faf42f6abc343a41ddffb73','e5112263c6c54bf283a7d413819c4eec','b9ef5d3a0f484391a577ff9b6831e68e','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('ee7db6c87a92463aa3c93a70ccc9477c','e5112263c6c54bf283a7d413819c4eec','6ed825d3a35c40b38511c5abd3931c3f','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('f12108e88d134145987df5e16388c46f','9c073cede3b54eada0cbd45e6e566b85','b4c79e46c1f24245a88cc6a6d5f1ee53','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('f13af8dc6cf542c7a28e1be2ecbb756f','9c073cede3b54eada0cbd45e6e566b85','3d44e81a0c294967ba3ff4ac0dca4e9a','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('f5aa05bca87143f198bcf7a25809cafd','9c073cede3b54eada0cbd45e6e566b85','2cfe7fe3f0c545f691cdf3d834b678ae','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('f5efc76bc81148859e182747c2a8a829','9c073cede3b54eada0cbd45e6e566b85','78b053065d2c4fa9a67f7c35f07476eb','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('f626b699bc08445eba1af13a5d6baa5a','9c073cede3b54eada0cbd45e6e566b85','f933e380ff6a4e878e999ba9de07d8a5','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('f69e8eb176a44fbfbe993fb8aefa0730','e5112263c6c54bf283a7d413819c4eec','d46d8a0a6f164c549c4760461600fe3b','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('f6df1c6c3821457c97a073140d53825c','9c073cede3b54eada0cbd45e6e566b85','6a234711625a40af92fb22d0a3df51e5','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('f8b2a2644a134ac59832ceeecd8a3404','9c073cede3b54eada0cbd45e6e566b85','86b0898cf30a47e0a6aefef49d9452a6','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('faa57158c84c466b844709b640897bfd','9c073cede3b54eada0cbd45e6e566b85','822748a8134d4adf8d08e873320db9c7','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('fae1ea2d071547a1bf8253dd918c22fc','9c073cede3b54eada0cbd45e6e566b85','9e024893c60441b4868074a89df50af3','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('fc78a318acfd4a74823fbd81f9fb7fc6','e5112263c6c54bf283a7d413819c4eec','bf0b0356772c4d819763d80925f59293','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('fdfa33764ebf4a90917832342a600586','9c073cede3b54eada0cbd45e6e566b85','80b67440e4214edeb17c8557420ecc9e','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('febb553aa28843a8a6423a6c2b0ecda4','9c073cede3b54eada0cbd45e6e566b85','c1a6e14b51bc498890206be31729c528','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('ff8b76ba5e5c47aab0a7413899fc7e00','9c073cede3b54eada0cbd45e6e566b85','81905027d97142f0afcb02ccbb346435','cb05bec5d77f4f5e8d5aea9a1977f5ce');
insert into `sys_re_role_permission` values('ffba4e7863084874801cd72b86ff178e','9c073cede3b54eada0cbd45e6e566b85','d36f9e2bd00d47faba4af73dfe3ac6a6','cb05bec5d77f4f5e8d5aea9a1977f5ce');


// 角色信息
insert into `role` values('9c073cede3b54eada0cbd45e6e566b85','虚谷云计算管理员','{\"description\":null,\"sort\":\"1\",\"isEnable\":\"true\"}','<<null>>');
insert into `role` values('e5112263c6c54bf283a7d413819c4eec','Lager系统用户','{\"description\":\"虚谷云计算普通用户\\n权限：浏览\",\"sort\":\"1\",\"isEnable\":\"true\"}','<<null>>');


// 项目成员
insert into `assignment` values('UserProject','38ce532d3e7a408aa93e6fcde35bead5','7df5552a7c99429bb948a8cf29291183','c44d712811bf4f6cacd0ec4e623d5862','0');
insert into `assignment` values('UserProject','92d7230d70344140ba071fa79ff69cbc','cb05bec5d77f4f5e8d5aea9a1977f5ce','9c073cede3b54eada0cbd45e6e566b85','0');
insert into `assignment` values('UserProject','9f0e6b280218463a829c82d5e1f7f060','cb05bec5d77f4f5e8d5aea9a1977f5ce','e5112263c6c54bf283a7d413819c4eec','0');
