/*
Navicat MySQL Data Transfer

Source Server         : 192.168.102.200
Source Server Version : 50621
Source Host           : 192.168.102.200:3307
Source Database       : weixin_worker

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-01-04 06:18:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES ('1', 'admin', 'Admin', '075eaec83636846f51c152f29b98a2fd', 's4f3', '/assets/img/avatar.png', 'admin@fastadmin.net', '0', '1514681321', '1492186163', '1514681321', '7a9e8ffd-f39f-4e4c-8c1f-9e4db230b265', 'normal');
INSERT INTO `fa_admin` VALUES ('2', 'admin2', 'admin2', '9a28ce07ce875fbd14172a9ca5357d3c', '2dHDmj', '/assets/img/avatar.png', 'admin2@fastadmin.net', '0', '1505450906', '1492186163', '1505450906', 'df45fdd5-26f4-45ca-83b3-47e4491a315a', 'normal');
INSERT INTO `fa_admin` VALUES ('3', 'admin3', 'admin3', '1c11f945dfcd808a130a8c2a8753fe62', 'WOKJEn', '/assets/img/avatar.png', 'admin3@fastadmin.net', '0', '1501980868', '1492186201', '1501982377', '', 'normal');
INSERT INTO `fa_admin` VALUES ('4', 'admin22', 'admin22', '1c1a0aa0c3c56a8c1a908aab94519648', 'Aybcn5', '/assets/img/avatar.png', 'admin22@fastadmin.net', '0', '0', '1492186240', '1492186240', '', 'normal');
INSERT INTO `fa_admin` VALUES ('5', 'admin32', 'admin32', 'ade94d5d7a7033afa7d84ac3066d0a02', 'FvYK0u', '/assets/img/avatar.png', 'admin32@fastadmin.net', '0', '0', '1492186263', '1492186263', '', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1554 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES ('1317', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"6eb3ebd21b43bb0bf3db52d7a09c6445\",\"username\":\"admin\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514337073');
INSERT INTO `fa_admin_log` VALUES ('1318', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"7fa060ea0981c1749c7f8268e28ce797\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514340529');
INSERT INTO `fa_admin_log` VALUES ('1319', '1', 'admin', '/index.php/admin/index/login.html', '登录', '{\"__token__\":\"482c9e12ebec0accdd9730311daff258\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514344394');
INSERT INTO `fa_admin_log` VALUES ('1320', '0', 'Unknown', '/admin/index/login', '', '{\"__token__\":\"e55fc9d362cc8d1f13f87ab31428f5be\",\"username\":\"admin\",\"captcha\":\"ltjt\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514344569');
INSERT INTO `fa_admin_log` VALUES ('1321', '1', 'admin', '/admin/index/login', '登录', '{\"__token__\":\"9c4733e6a45917ba702f3b4039cdecf8\",\"username\":\"admin\",\"captcha\":\"ftth\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514344577');
INSERT INTO `fa_admin_log` VALUES ('1322', '1', 'admin', '/admin/index/login', '登录', '{\"__token__\":\"d20ab57135e1c3fc2823221b94d177f4\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514346380');
INSERT INTO `fa_admin_log` VALUES ('1323', '1', 'admin', '/admin/addon/refresh', '插件管理 刷新', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514346386');
INSERT INTO `fa_admin_log` VALUES ('1324', '1', 'admin', '/admin/addon/refresh', '插件管理 刷新', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514346390');
INSERT INTO `fa_admin_log` VALUES ('1325', '1', 'admin', '/admin/addon/refresh', '插件管理 刷新', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514346391');
INSERT INTO `fa_admin_log` VALUES ('1326', '1', 'admin', '/admin/addon/refresh', '插件管理 刷新', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514346393');
INSERT INTO `fa_admin_log` VALUES ('1327', '0', 'Unknown', '/admin/index/login?url=%2Fadmin%2Fdashboard%3Fref%3Daddtabs', '', '{\"url\":\"\\/admin\\/dashboard?ref=addtabs\",\"__token__\":\"116f672e0d477b9c6a24ae04e02a7f75\",\"username\":\"admin\",\"captcha\":\"mgrv\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514353196');
INSERT INTO `fa_admin_log` VALUES ('1328', '1', 'admin', '/admin/index/login?url=%2Fadmin%2Fdashboard%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/dashboard?ref=addtabs\",\"__token__\":\"edfb0496a416c86d0451f6fd7f58785b\",\"username\":\"admin\",\"captcha\":\"qpkj\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514353207');
INSERT INTO `fa_admin_log` VALUES ('1329', '1', 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"user\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514353237');
INSERT INTO `fa_admin_log` VALUES ('1330', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"user\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514353598');
INSERT INTO `fa_admin_log` VALUES ('1331', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"user\",\"action\":\"enable\",\"force\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514353610');
INSERT INTO `fa_admin_log` VALUES ('1332', '1', 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"ucenter\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514353825');
INSERT INTO `fa_admin_log` VALUES ('1333', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"84177c7b263dab1b23fc39a02763f0b2\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"score\":\"0\",\"prevtime\":\"2017-04-10 19:00:15\",\"loginfailure\":\"0\",\"logintime\":\"2017-04-10 19:00:38\",\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-06 14:50:18\",\"status\":\"normal\",\"salt\":\"C2YAkv\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514353893');
INSERT INTO `fa_admin_log` VALUES ('1334', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"780d7155a1c28f1f13e37e0291f77049\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"score\":\"0\",\"prevtime\":\"2017-04-10 19:00:15\",\"loginfailure\":\"0\",\"logintime\":\"2017-04-10 19:00:38\",\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-06 14:50:18\",\"status\":\"normal\",\"salt\":\"3eBMNG\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514353911');
INSERT INTO `fa_admin_log` VALUES ('1335', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"2177db861ddeb822fe767112a9c56ced\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"score\":\"0\",\"prevtime\":\"2017-04-10 19:00:15\",\"loginfailure\":\"0\",\"logintime\":\"2017-04-10 19:00:38\",\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-06 14:50:18\",\"status\":\"normal\",\"salt\":\"5QCafn\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354007');
INSERT INTO `fa_admin_log` VALUES ('1336', '1', 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"page\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354112');
INSERT INTO `fa_admin_log` VALUES ('1337', '1', 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"alisms\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354133');
INSERT INTO `fa_admin_log` VALUES ('1338', '1', 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"crontab\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354136');
INSERT INTO `fa_admin_log` VALUES ('1339', '1', 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"qrcode\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354141');
INSERT INTO `fa_admin_log` VALUES ('1340', '1', 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354147');
INSERT INTO `fa_admin_log` VALUES ('1341', '1', 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"third\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354197');
INSERT INTO `fa_admin_log` VALUES ('1342', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"895c60890c52b22380d408234547be48\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"score\":\"0\",\"prevtime\":\"2017-04-10 19:00:15\",\"loginfailure\":\"0\",\"logintime\":\"2017-04-10 19:00:38\",\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-06 14:50:18\",\"status\":\"normal\",\"salt\":\"0BNfQM\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354297');
INSERT INTO `fa_admin_log` VALUES ('1343', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"231bec7b5ebe80a03396d9d98ae3ee5d\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"score\":\"0\",\"prevtime\":\"2017-04-10 19:00:15\",\"loginfailure\":\"0\",\"logintime\":\"2017-04-10 19:00:38\",\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-06 14:50:18\",\"status\":\"normal\",\"salt\":\"zBsrRF\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354535');
INSERT INTO `fa_admin_log` VALUES ('1344', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"ba90580672fe5e08d6f81bce6297f36c\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"score\":\"0\",\"prevtime\":\"2017-04-10 19:00:15\",\"loginfailure\":\"0\",\"logintime\":\"2017-04-10 19:00:38\",\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-06 14:50:18\",\"status\":\"normal\",\"salt\":\"RhJQM2\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354600');
INSERT INTO `fa_admin_log` VALUES ('1345', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"395253646dc8a9bd6a658d560bc487fe\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"score\":\"0\",\"prevtime\":\"2017-04-10 19:00:15\",\"loginfailure\":\"0\",\"logintime\":\"2017-04-10 19:00:38\",\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-06 14:50:18\",\"status\":\"normal\",\"salt\":\"Jv6Wte\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354618');
INSERT INTO `fa_admin_log` VALUES ('1346', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"63d80507dc7a79b13c72c1cdeca264d0\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":1492185600,\"score\":\"0\",\"prevtime\":1491822015,\"loginfailure\":\"0\",\"logintime\":\"2017-04-10 19:00:38\",\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":1491461418,\"status\":\"normal\",\"salt\":\"HOjD8r\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354647');
INSERT INTO `fa_admin_log` VALUES ('1347', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"e60727ca37e9201b45afe0039863492d\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"score\":\"0\",\"prevtime\":1491822015,\"loginfailure\":\"0\",\"logintime\":\"2017-04-10 19:00:38\",\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":1491461418,\"status\":\"normal\",\"salt\":\"RP94Jm\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354665');
INSERT INTO `fa_admin_log` VALUES ('1348', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"1dada2fff6c3613d6bb3a2adccd82342\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"score\":\"0\",\"prevtime\":1491822015,\"loginfailure\":\"0\",\"logintime\":1491822038,\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":1491461418,\"status\":\"normal\",\"salt\":\"xgey6W\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514354683');
INSERT INTO `fa_admin_log` VALUES ('1349', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"summernote\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514355154');
INSERT INTO `fa_admin_log` VALUES ('1350', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"crontab\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514355158');
INSERT INTO `fa_admin_log` VALUES ('1351', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"crontab\",\"action\":\"enable\",\"force\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514355160');
INSERT INTO `fa_admin_log` VALUES ('1352', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"page\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514355162');
INSERT INTO `fa_admin_log` VALUES ('1353', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"page\",\"action\":\"enable\",\"force\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514355163');
INSERT INTO `fa_admin_log` VALUES ('1354', '1', 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"properties\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514355678');
INSERT INTO `fa_admin_log` VALUES ('1355', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514357061');
INSERT INTO `fa_admin_log` VALUES ('1356', '1', 'admin', '/admin/index/login?url=%2Fadmin%2F', '登录', '{\"url\":\"\\/admin\\/\",\"__token__\":\"1943610da180b9f309fc9da8ece0d176\",\"username\":\"admin\",\"captcha\":\"ghfr\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514358003');
INSERT INTO `fa_admin_log` VALUES ('1357', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"__token__\":\"1ee36fe8f6ba09c6f1d423103e8368f1\",\"username\":\"admin\",\"captcha\":\"kynh\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514358852');
INSERT INTO `fa_admin_log` VALUES ('1358', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"bff4ccd748b0183a696cb93782f1bf6a\",\"username\":\"admin\",\"captcha\":\"eoid\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514358879');
INSERT INTO `fa_admin_log` VALUES ('1359', '1', 'admin', '/admin/addon/refresh', '插件管理 刷新', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514358863');
INSERT INTO `fa_admin_log` VALUES ('1360', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"5459ae02336614ba3871239256a61b30\",\"username\":\"admin\",\"captcha\":\"ujri\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514358891');
INSERT INTO `fa_admin_log` VALUES ('1361', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"76527d5b0dba996032192945c1142efe\",\"username\":\"admin\",\"captcha\":\"wdxj\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514359029');
INSERT INTO `fa_admin_log` VALUES ('1362', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"429e46e9d7b40a9d84bf06b4b4d953be\",\"username\":\"admin\",\"captcha\":\"pxgo\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514359054');
INSERT INTO `fa_admin_log` VALUES ('1363', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"8ec2a37c1e765976d6d70de9238cc796\",\"username\":\"admin\",\"captcha\":\"pxgo\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514359066');
INSERT INTO `fa_admin_log` VALUES ('1364', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"26a350240ee9ca74461bd222e489dc07\",\"username\":\"admin\",\"captcha\":\"pxgo\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514359067');
INSERT INTO `fa_admin_log` VALUES ('1365', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"1a41be52d9f03869d9bce9b6a86d68fc\",\"username\":\"admin\",\"captcha\":\"8nzw\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514359078');
INSERT INTO `fa_admin_log` VALUES ('1366', '0', 'Unknown', '/admin/index/login?url=%2Fadmin%2Fcategory%3Fref%3Daddtabs', '', '{\"url\":\"\\/admin\\/category?ref=addtabs\",\"__token__\":\"ea538d6fc78d5ba931d4114535dbdcfc\",\"username\":\"admin\",\"captcha\":\"nhan\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514419359');
INSERT INTO `fa_admin_log` VALUES ('1367', '1', 'admin', '/admin/index/login?url=%2Fadmin%2Fcategory%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/category?ref=addtabs\",\"__token__\":\"7b789690aee9e89d59ae1c4d9d573c6e\",\"username\":\"admin\",\"captcha\":\"d3np\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514419367');
INSERT INTO `fa_admin_log` VALUES ('1368', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"__token__\":\"0d68a04c87bf6c592764735857c56e80\",\"username\":\"admin\",\"captcha\":\"32vn\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514419356');
INSERT INTO `fa_admin_log` VALUES ('1369', '1', 'admin', '/admin/index/login?url=%2Fadmin%2Fuser%3Faddtabs%3D1', '登录', '{\"url\":\"\\/admin\\/user?addtabs=1\",\"__token__\":\"039c607a126db22c7c51165ce5fad69c\",\"username\":\"admin\",\"captcha\":\"uijf\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514419436');
INSERT INTO `fa_admin_log` VALUES ('1370', '0', 'Unknown', '/admin/index/login?url=%2Fadmin%2Fgeneral%2Fprofile%3Faddtabs%3D1', '', '{\"__token__\":\"75f4bcd47c871c2f73c9631c34efd3ad\",\"username\":\"admin\",\"captcha\":\"fe62\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514419458');
INSERT INTO `fa_admin_log` VALUES ('1371', '1', 'admin', '/admin/index/login?url=%2Fadmin%2Fgeneral%2Fprofile%3Faddtabs%3D1', '登录', '{\"__token__\":\"471faef30d145a777884874978ae0b9e\",\"username\":\"admin\",\"captcha\":\"yddj\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514419466');
INSERT INTO `fa_admin_log` VALUES ('1372', '1', 'admin', '/admin/weixin_server/contact', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514423256');
INSERT INTO `fa_admin_log` VALUES ('1373', '1', 'admin', '/admin/weixin_server/contact', '', '{\"ip\":\"12123213\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514423273');
INSERT INTO `fa_admin_log` VALUES ('1374', '1', 'admin', '/admin/weixin_server/contact', '', '{\"ip\":\"12123213\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514423433');
INSERT INTO `fa_admin_log` VALUES ('1375', '0', 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"f110f5888213be2ad72753011568a215\",\"username\":\"admin123\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514428645');
INSERT INTO `fa_admin_log` VALUES ('1376', '1', 'admin', '/admin/index/login', '登录', '{\"__token__\":\"c1c4db65dd845213b27d4deb6bf88bd4\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514431259');
INSERT INTO `fa_admin_log` VALUES ('1377', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514440526');
INSERT INTO `fa_admin_log` VALUES ('1378', '1', 'admin', '/admin/auth/rule/add/ids/0?dialog=1', '权限管理 规则管理 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"WeixinApplication\\/index\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"icon\":\"fa fa-dot\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441296');
INSERT INTO `fa_admin_log` VALUES ('1379', '1', 'admin', '/admin/auth/rule/add/ids/0?dialog=1', '权限管理 规则管理 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"weixinapplication\\/index\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"icon\":\"fa fa-dot\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441306');
INSERT INTO `fa_admin_log` VALUES ('1380', '1', 'admin', '/admin/auth/rule/edit/ids/83?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"weixinapplication\\/index\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"icon\":\"fa fa-adjust\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"83\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441405');
INSERT INTO `fa_admin_log` VALUES ('1381', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441423');
INSERT INTO `fa_admin_log` VALUES ('1382', '1', 'admin', '/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,4,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,83,2,5\",\"pid\":\"1\",\"name\":\"\\u4e8c\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441430');
INSERT INTO `fa_admin_log` VALUES ('1383', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"3\",\"pid\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441433');
INSERT INTO `fa_admin_log` VALUES ('1384', '1', 'admin', '/admin/auth/group/edit/ids/3?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,4,5,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,83\",\"pid\":\"2\",\"name\":\"\\u4e09\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441435');
INSERT INTO `fa_admin_log` VALUES ('1385', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"5\",\"pid\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441438');
INSERT INTO `fa_admin_log` VALUES ('1386', '1', 'admin', '/admin/auth/group/edit/ids/5?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,83\",\"pid\":\"2\",\"name\":\"\\u4e09\\u7ea7\\u7ba1\\u7406\\u7ec42\",\"status\":\"normal\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441440');
INSERT INTO `fa_admin_log` VALUES ('1387', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"4\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441442');
INSERT INTO `fa_admin_log` VALUES ('1388', '1', 'admin', '/admin/auth/group/edit/ids/4?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65,83\",\"pid\":\"1\",\"name\":\"\\u4e8c\\u7ea7\\u7ba1\\u7406\\u7ec42\",\"status\":\"normal\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441446');
INSERT INTO `fa_admin_log` VALUES ('1389', '1', 'admin', '/admin/auth/rule/edit/ids/83?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"weixin_application\\/index\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"icon\":\"fa fa-adjust\",\"weigh\":\"100\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"83\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441536');
INSERT INTO `fa_admin_log` VALUES ('1390', '1', 'admin', '/admin/ajax/weigh', '', '{\"changeid\":\"83\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441654');
INSERT INTO `fa_admin_log` VALUES ('1391', '1', 'admin', '/admin/auth/rule/edit/ids/83?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"weixin_application\\/index\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"icon\":\"fa fa-adjust\",\"weigh\":\"32\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"83\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441706');
INSERT INTO `fa_admin_log` VALUES ('1392', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"4,66,71,5,12,1,11,10,9,3,2,77,8,7,6\",\"changeid\":\"1\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441758');
INSERT INTO `fa_admin_log` VALUES ('1393', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"4,66,71,5,1,12,11,10,9,3,2,77,8,7,6\",\"changeid\":\"1\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441766');
INSERT INTO `fa_admin_log` VALUES ('1394', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"1,4,66,71,5,12,11,10,9,3,2,77,8,7,6\",\"changeid\":\"1\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514441773');
INSERT INTO `fa_admin_log` VALUES ('1395', '1', 'admin', '/admin/category/multi/ids/7', '分类管理 批量更新', '{\"ids\":\"7\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514443422');
INSERT INTO `fa_admin_log` VALUES ('1396', '1', 'admin', '/admin/category/multi/ids/7', '分类管理 批量更新', '{\"ids\":\"7\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514443426');
INSERT INTO `fa_admin_log` VALUES ('1397', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"4\",\"field\":\"name\",\"order_by\":[[\"name\",\"ASC\"]],\"pkey_name\":\"id\",\"pkey_value\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514443924');
INSERT INTO `fa_admin_log` VALUES ('1398', '1', 'admin', '/admin/page/del/ids/1', '单页管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514443930');
INSERT INTO `fa_admin_log` VALUES ('1399', '1', 'admin', '/admin/index/login', '登录', '{\"__token__\":\"b99ca3f486d05f873552da142cce1afc\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514444907');
INSERT INTO `fa_admin_log` VALUES ('1400', '1', 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"upload\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514444949');
INSERT INTO `fa_admin_log` VALUES ('1401', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"6.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12A365 MicroMessenger/5.4.1 NetType/WIFI', '1514445211');
INSERT INTO `fa_admin_log` VALUES ('1402', '1', 'admin', '/admin/auth/rule/edit/ids/83?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"weixin_application\\/index\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"icon\":\"fa fa-adjust\",\"weigh\":\"32\",\"condition\":\"\",\"remark\":\"\\u7528\\u4e8e\\u7ba1\\u7406\\u6240\\u6709\\u5fae\\u4fe1\\u8fdb\\u7a0b\",\"status\":\"normal\"},\"ids\":\"83\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514446528');
INSERT INTO `fa_admin_log` VALUES ('1403', '1', 'admin', '/admin/weixin_application/del/ids/1', '', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514449206');
INSERT INTO `fa_admin_log` VALUES ('1404', '1', 'admin', '/admin/general/crontab/get_schedule_future', '', '{\"schedule\":\"* * * * *\",\"days\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514449593');
INSERT INTO `fa_admin_log` VALUES ('1405', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450057');
INSERT INTO `fa_admin_log` VALUES ('1406', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450069');
INSERT INTO `fa_admin_log` VALUES ('1407', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"23132\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450191');
INSERT INTO `fa_admin_log` VALUES ('1408', '1', 'admin', '/admin/user/edit/ids/4?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"blu10ph\",\"nickname\":\"blu10ph\",\"email\":\"blu10ph@qq.com\",\"mobile\":\"18769714760\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"1\",\"gender\":\"0\",\"birthday\":\"1999-01-01\",\"score\":\"0\",\"prevtime\":1514355469,\"loginfailure\":\"0\",\"logintime\":1514419391,\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":1514355469,\"status\":\"normal\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450288');
INSERT INTO `fa_admin_log` VALUES ('1409', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450308');
INSERT INTO `fa_admin_log` VALUES ('1410', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450397');
INSERT INTO `fa_admin_log` VALUES ('1411', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450409');
INSERT INTO `fa_admin_log` VALUES ('1412', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450429');
INSERT INTO `fa_admin_log` VALUES ('1413', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450454');
INSERT INTO `fa_admin_log` VALUES ('1414', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450497');
INSERT INTO `fa_admin_log` VALUES ('1415', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450510');
INSERT INTO `fa_admin_log` VALUES ('1416', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450538');
INSERT INTO `fa_admin_log` VALUES ('1417', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450550');
INSERT INTO `fa_admin_log` VALUES ('1418', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"c926bc57f6b1664563067dfb02806b12\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450584');
INSERT INTO `fa_admin_log` VALUES ('1419', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450561');
INSERT INTO `fa_admin_log` VALUES ('1420', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"1970-01-01 11:25:23\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450629');
INSERT INTO `fa_admin_log` VALUES ('1421', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"2015-05-07 11:25:23\",\"out_time\":\"2017-12-20 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450714');
INSERT INTO `fa_admin_log` VALUES ('1422', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":\"2015-05-07 11:25:23\",\"out_time\":\"2017-12-20 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450782');
INSERT INTO `fa_admin_log` VALUES ('1423', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"out_time\":\"1970-01-03 19:12:03\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450802');
INSERT INTO `fa_admin_log` VALUES ('1424', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"status\":\"2\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450813');
INSERT INTO `fa_admin_log` VALUES ('1425', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":1913123,\"out_time\":1941123,\"status\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450949');
INSERT INTO `fa_admin_log` VALUES ('1426', '1', 'admin', '/admin/weixin_application/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"ip\":\"123.123.122.0\",\"pid\":\"1\",\"bind_user\":\"12\",\"bind_time\":1502335523,\"out_time\":1941123,\"status\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514450979');
INSERT INTO `fa_admin_log` VALUES ('1427', '1', 'admin', '/admin/weixin_application/del/ids/1', '', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514451533');
INSERT INTO `fa_admin_log` VALUES ('1428', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"c032f6693cab6296c06040f9d0621825\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514505537');
INSERT INTO `fa_admin_log` VALUES ('1429', '1', 'admin', '/admin/user/edit/ids/3?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"admin123\",\"nickname\":\"admin123\",\"password\":\"796cf2668b68e33056854579bf9bf758\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-15\",\"score\":\"0\",\"prevtime\":1514360541,\"loginfailure\":\"0\",\"logintime\":1514361874,\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":1491461418,\"status\":\"normal\",\"salt\":\"ld26V5\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514506650');
INSERT INTO `fa_admin_log` VALUES ('1430', '1', 'admin', '/admin/index/login', '登录', '{\"__token__\":\"297c67df1ceee3cbd765938b97cd6e94\",\"username\":\"admin\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514507340');
INSERT INTO `fa_admin_log` VALUES ('1431', '1', 'admin', '/admin/index/login', '登录', '{\"__token__\":\"8a27d4e6420a8f8ca17c075ba49116da\",\"username\":\"admin\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514507374');
INSERT INTO `fa_admin_log` VALUES ('1432', '1', 'admin', '/admin/addon/refresh', '插件管理 刷新', '[]', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514507485');
INSERT INTO `fa_admin_log` VALUES ('1433', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"2f5a99046ff7b8b450770af892f13a98\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514507670');
INSERT INTO `fa_admin_log` VALUES ('1434', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"page\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514507708');
INSERT INTO `fa_admin_log` VALUES ('1435', '1', 'admin', '/admin/auth/rule/edit/ids/83?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"weixin_application\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"icon\":\"fa fa-adjust\",\"weigh\":\"32\",\"condition\":\"\",\"remark\":\"\\u7528\\u4e8e\\u7ba1\\u7406\\u6240\\u6709\\u5fae\\u4fe1\\u8fdb\\u7a0b\",\"status\":\"normal\"},\"ids\":\"83\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514509971');
INSERT INTO `fa_admin_log` VALUES ('1436', '1', 'admin', '/admin/auth/rule/edit/ids/83?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"weixinapplication\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"icon\":\"fa fa-adjust\",\"weigh\":\"32\",\"condition\":\"\",\"remark\":\"\\u7528\\u4e8e\\u7ba1\\u7406\\u6240\\u6709\\u5fae\\u4fe1\\u8fdb\\u7a0b\",\"status\":\"normal\"},\"ids\":\"83\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514510124');
INSERT INTO `fa_admin_log` VALUES ('1437', '1', 'admin', '/admin/auth/rule/edit/ids/83?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"weixin_application\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"icon\":\"fa fa-adjust\",\"weigh\":\"32\",\"condition\":\"\",\"remark\":\"\\u7528\\u4e8e\\u7ba1\\u7406\\u6240\\u6709\\u5fae\\u4fe1\\u8fdb\\u7a0b\",\"status\":\"normal\"},\"ids\":\"83\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514515818');
INSERT INTO `fa_admin_log` VALUES ('1438', '1', 'admin', '/admin/auth/rule/edit/ids/83?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"weixin_application\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"icon\":\"fa fa-adjust\",\"weigh\":\"32\",\"condition\":\"\",\"remark\":\"\\u7528\\u4e8e\\u7ba1\\u7406\\u6240\\u6709\\u5fae\\u4fe1\\u8fdb\\u7a0b\",\"status\":\"normal\"},\"ids\":\"83\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514515902');
INSERT INTO `fa_admin_log` VALUES ('1439', '1', 'admin', '/admin/', '', '{\"name\":\"guanzhu.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514516345');
INSERT INTO `fa_admin_log` VALUES ('1440', '1', 'admin', '/admin/user/multi/ids/6', '会员管理 批量更新', '{\"ids\":\"6\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514517880');
INSERT INTO `fa_admin_log` VALUES ('1441', '1', 'admin', '/admin/', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514517903');
INSERT INTO `fa_admin_log` VALUES ('1442', '1', 'admin', '/admin/user/multi/ids/6', '会员管理 批量更新', '{\"ids\":\"6\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514517914');
INSERT INTO `fa_admin_log` VALUES ('1443', '1', 'admin', '/admin/auth/rule/add/ids/0?dialog=1', '权限管理 规则管理 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"task\",\"title\":\"\\u624b\\u5de5\\u4efb\\u52a1\",\"icon\":\"fa fa-asterisk\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518782');
INSERT INTO `fa_admin_log` VALUES ('1444', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518866');
INSERT INTO `fa_admin_log` VALUES ('1445', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518885');
INSERT INTO `fa_admin_log` VALUES ('1446', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518898');
INSERT INTO `fa_admin_log` VALUES ('1447', '1', 'admin', '/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,4,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,83,84,2,5\",\"pid\":\"1\",\"name\":\"\\u4e8c\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518901');
INSERT INTO `fa_admin_log` VALUES ('1448', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"3\",\"pid\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518910');
INSERT INTO `fa_admin_log` VALUES ('1449', '1', 'admin', '/admin/auth/group/edit/ids/3?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,4,5,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,83,84\",\"pid\":\"2\",\"name\":\"\\u4e09\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518913');
INSERT INTO `fa_admin_log` VALUES ('1450', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"5\",\"pid\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518920');
INSERT INTO `fa_admin_log` VALUES ('1451', '1', 'admin', '/admin/auth/group/edit/ids/5?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,83,84\",\"pid\":\"2\",\"name\":\"\\u4e09\\u7ea7\\u7ba1\\u7406\\u7ec42\",\"status\":\"normal\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518923');
INSERT INTO `fa_admin_log` VALUES ('1452', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"4\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518929');
INSERT INTO `fa_admin_log` VALUES ('1453', '1', 'admin', '/admin/auth/group/edit/ids/4?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65,83,84\",\"pid\":\"1\",\"name\":\"\\u4e8c\\u7ea7\\u7ba1\\u7406\\u7ec42\",\"status\":\"normal\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518934');
INSERT INTO `fa_admin_log` VALUES ('1454', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"5\",\"pid\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514518939');
INSERT INTO `fa_admin_log` VALUES ('1455', '1', 'admin', '/admin/', '', '{\"name\":\"111.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514526764');
INSERT INTO `fa_admin_log` VALUES ('1456', '1', 'admin', '/admin/', '', '{\"name\":\"logo.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514526776');
INSERT INTO `fa_admin_log` VALUES ('1457', '1', 'admin', '/admin/', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514526800');
INSERT INTO `fa_admin_log` VALUES ('1458', '1', 'admin', '/admin/', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514526861');
INSERT INTO `fa_admin_log` VALUES ('1459', '1', 'admin', '/admin/', '', '{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20171220075814.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514526860');
INSERT INTO `fa_admin_log` VALUES ('1460', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"page\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514527536');
INSERT INTO `fa_admin_log` VALUES ('1461', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"2\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"page\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514527540');
INSERT INTO `fa_admin_log` VALUES ('1462', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"2\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"page\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514527658');
INSERT INTO `fa_admin_log` VALUES ('1463', '1', 'admin', '/admin/task/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u5c0f\\u624b\\u4e00\\u6296\\u79ef\\u5206\\u5230\\u624b\\uff01\",\"content\":\"1.\\u626b\\u7801\\u5173\\u6ce8\\uff08\\u89c1\\u56fe1\\uff09\\r\\n2.\\u5173\\u6ce8\\u540e15\\u5929\\u5185\\u4e0d\\u8981\\u53d6\\u5173\\uff0c\\u8c22\\u8c22\",\"platform\":\"\\u5fae\\u4fe1\",\"demand_count\":\"80\",\"time_limit\":\"30\",\"end_time\":\"2007-08-30 08:00:00\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514530269');
INSERT INTO `fa_admin_log` VALUES ('1464', '1', 'admin', '/admin/', '', '{\"name\":\"BX8I-fypceiq4165785.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514531214');
INSERT INTO `fa_admin_log` VALUES ('1465', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"page\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514533462');
INSERT INTO `fa_admin_log` VALUES ('1466', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"page\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514533467');
INSERT INTO `fa_admin_log` VALUES ('1467', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"page\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514533720');
INSERT INTO `fa_admin_log` VALUES ('1468', '1', 'admin', '/admin/page/add/ids/0?dialog=1', '单页管理 添加', '{\"dialog\":\"1\",\"row_category_id_text\":\"Android\\u5f00\\u53d1\",\"row\":{\"category_id\":\"4\",\"title\":\"\\u8fdb\\u7a0b\\u7ba1\\u7406\",\"keywords\":\"123\",\"flag\":\"recommend\",\"image\":\"\\/assets\\/img\\/qrcode.png\",\"content\":\"213213\",\"icon\":\"\",\"views\":\"0\",\"comments\":\"0\",\"weigh\":\"0\",\"status\":\"normal\"},\"ids\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514533729');
INSERT INTO `fa_admin_log` VALUES ('1469', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"4\",\"field\":\"name\",\"order_by\":[[\"name\",\"ASC\"]],\"pkey_name\":\"id\",\"pkey_value\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514533776');
INSERT INTO `fa_admin_log` VALUES ('1470', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"4\",\"field\":\"name\",\"order_by\":[[\"name\",\"ASC\"]],\"pkey_name\":\"id\",\"pkey_value\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514533792');
INSERT INTO `fa_admin_log` VALUES ('1471', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"4\",\"field\":\"name\",\"order_by\":[[\"name\",\"ASC\"]],\"pkey_name\":\"id\",\"pkey_value\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514534280');
INSERT INTO `fa_admin_log` VALUES ('1472', '1', 'admin', '/admin/', '', '{\"name\":\"logo.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514534518');
INSERT INTO `fa_admin_log` VALUES ('1473', '1', 'admin', '/admin/', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514534553');
INSERT INTO `fa_admin_log` VALUES ('1474', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"upload\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514534578');
INSERT INTO `fa_admin_log` VALUES ('1475', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514534612');
INSERT INTO `fa_admin_log` VALUES ('1476', '1', 'admin', '/admin/', '', '{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20171220075814.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514534593');
INSERT INTO `fa_admin_log` VALUES ('1477', '1', 'admin', '/admin/', '', '{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20171220075814.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514534648');
INSERT INTO `fa_admin_log` VALUES ('1478', '1', 'admin', '/admin/', '', '{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20171220075814.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514534659');
INSERT INTO `fa_admin_log` VALUES ('1479', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20171220075819.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514534747');
INSERT INTO `fa_admin_log` VALUES ('1480', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20171220075814.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514534767');
INSERT INTO `fa_admin_log` VALUES ('1481', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"3.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514534911');
INSERT INTO `fa_admin_log` VALUES ('1482', '1', 'admin', '/admin/', '', '{\"name\":\"2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514534990');
INSERT INTO `fa_admin_log` VALUES ('1483', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"upload\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514535011');
INSERT INTO `fa_admin_log` VALUES ('1484', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514535070');
INSERT INTO `fa_admin_log` VALUES ('1485', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514535228');
INSERT INTO `fa_admin_log` VALUES ('1486', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514535246');
INSERT INTO `fa_admin_log` VALUES ('1487', '1', 'admin', '/admin/general/attachment/del/ids/5', '常规管理 附件管理 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514535896');
INSERT INTO `fa_admin_log` VALUES ('1488', '1', 'admin', '/admin/general/attachment/del/ids/4', '常规管理 附件管理 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514535898');
INSERT INTO `fa_admin_log` VALUES ('1489', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"guanzhu.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514535940');
INSERT INTO `fa_admin_log` VALUES ('1490', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"4\",\"field\":\"name\",\"order_by\":[[\"name\",\"ASC\"]],\"pkey_name\":\"id\",\"pkey_value\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514536680');
INSERT INTO `fa_admin_log` VALUES ('1491', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514536684');
INSERT INTO `fa_admin_log` VALUES ('1492', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514536684');
INSERT INTO `fa_admin_log` VALUES ('1493', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"111.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514536685');
INSERT INTO `fa_admin_log` VALUES ('1494', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514537060');
INSERT INTO `fa_admin_log` VALUES ('1495', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514537060');
INSERT INTO `fa_admin_log` VALUES ('1496', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"logo.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514537116');
INSERT INTO `fa_admin_log` VALUES ('1497', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"222.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514537160');
INSERT INTO `fa_admin_log` VALUES ('1498', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"BX8I-fypceiq4165785.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514537160');
INSERT INTO `fa_admin_log` VALUES ('1499', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514539319');
INSERT INTO `fa_admin_log` VALUES ('1500', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514539329');
INSERT INTO `fa_admin_log` VALUES ('1501', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514539461');
INSERT INTO `fa_admin_log` VALUES ('1502', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"BX8I-fypceiq4165785.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514539481');
INSERT INTO `fa_admin_log` VALUES ('1503', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"BX8I-fypceiq4165785.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514539489');
INSERT INTO `fa_admin_log` VALUES ('1504', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"BX8I-fypceiq4165785.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514539924');
INSERT INTO `fa_admin_log` VALUES ('1505', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"4\",\"field\":\"name\",\"order_by\":[[\"name\",\"ASC\"]],\"pkey_name\":\"id\",\"pkey_value\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.97 Safari/537.36 Vivaldi/1.94.1008.40', '1514540165');
INSERT INTO `fa_admin_log` VALUES ('1506', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514541580');
INSERT INTO `fa_admin_log` VALUES ('1507', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"073aeba3875be251f82b724aa707eed8\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514591965');
INSERT INTO `fa_admin_log` VALUES ('1508', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"6d512cedac2d066299fbae664abd0358\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514595166');
INSERT INTO `fa_admin_log` VALUES ('1509', '1', 'admin', '/admin/task/add/ids/0?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u4efb\\u52a1\\u6d4b\\u8bd5\",\"commission\":\"3\",\"content\":\"<p>1\\uff1a\\u8bc6\\u522b\\u4e8c\\u7ef4\\u7801<\\/p><p>2\\uff1a\\u5173\\u6ce8<\\/p>\",\"use_link\":\"\",\"file_ids\":\"\",\"platform\":\"\\u5fae\\u4fe1\",\"demand_count\":\"50\",\"time_limit\":\"30\",\"end_time\":1527814671},\"ids\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514595488');
INSERT INTO `fa_admin_log` VALUES ('1510', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514595508');
INSERT INTO `fa_admin_log` VALUES ('1511', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514595612');
INSERT INTO `fa_admin_log` VALUES ('1512', '1', 'admin', '/admin/task/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u5c0f\\u624b\\u4e00\\u6296\\u79ef\\u5206\\u5230\\u624b\\uff01\",\"commission\":\"2\",\"content\":\"1.\\u626b\\u7801\\u5173\\u6ce8\\uff08\\u89c1\\u56fe1\\uff09\\r\\n2.\\u5173\\u6ce8\\u540e15\\u5929\\u5185\\u4e0d\\u8981\\u53d6\\u5173\\uff0c\\u8c22\\u8c22\",\"use_link\":\"\",\"file_ids\":\"\",\"platform\":\"\\u5fae\\u4fe1\",\"demand_count\":\"80\",\"time_limit\":\"30\",\"end_time\":1530926688},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514597099');
INSERT INTO `fa_admin_log` VALUES ('1513', '1', 'admin', '/admin/task/add/ids/0?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u4efb\\u52a1test\",\"commission\":\"0.3\",\"content\":\"<p>1<\\/p><p>2<\\/p>\",\"use_link\":\"\",\"file_ids\":\"\",\"platform\":\"\\u5fae\\u4fe1\",\"demand_count\":\"1000\",\"time_limit\":\"30\",\"end_time\":1522460298},\"ids\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514597910');
INSERT INTO `fa_admin_log` VALUES ('1514', '1', 'admin', '/admin/task/del/ids/3', '', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514597919');
INSERT INTO `fa_admin_log` VALUES ('1515', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"56791b849810a1c6e66c63b3d5967530\",\"username\":\"admin123\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514599945');
INSERT INTO `fa_admin_log` VALUES ('1516', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"c4b832493978aa3f0b5b1093446e7b65\",\"username\":\"admin123\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514599954');
INSERT INTO `fa_admin_log` VALUES ('1517', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"ca59d6ccba96740d136e5e3e8080aa28\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514600970');
INSERT INTO `fa_admin_log` VALUES ('1518', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514600984');
INSERT INTO `fa_admin_log` VALUES ('1519', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"upload\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514601191');
INSERT INTO `fa_admin_log` VALUES ('1520', '1', 'admin', '/admin/', '', '{\"name\":\"guanzhu.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514601208');
INSERT INTO `fa_admin_log` VALUES ('1521', '1', 'admin', '/admin/', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514601267');
INSERT INTO `fa_admin_log` VALUES ('1522', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"b8af0230bd0e4b68e9bff187c7a0fac7\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514602601');
INSERT INTO `fa_admin_log` VALUES ('1523', '1', 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"upload\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514603040');
INSERT INTO `fa_admin_log` VALUES ('1524', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514603063');
INSERT INTO `fa_admin_log` VALUES ('1525', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514603878');
INSERT INTO `fa_admin_log` VALUES ('1526', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514603933');
INSERT INTO `fa_admin_log` VALUES ('1527', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"BX8I-fypceiq4165785.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514603951');
INSERT INTO `fa_admin_log` VALUES ('1528', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"logo.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514603963');
INSERT INTO `fa_admin_log` VALUES ('1529', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514603973');
INSERT INTO `fa_admin_log` VALUES ('1530', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514603974');
INSERT INTO `fa_admin_log` VALUES ('1531', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"logo.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514604466');
INSERT INTO `fa_admin_log` VALUES ('1532', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"\\u4efb\\u52a11.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514604467');
INSERT INTO `fa_admin_log` VALUES ('1533', '1', 'admin', '/admin/task/add/ids/0?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u4efb\\u52a1\\u5e26\\u56fe\\u6d4b\\u8bd5\",\"commission\":\"0.2\",\"content\":\"<p>1<\\/p><p>2<\\/p>\",\"use_link\":\"\",\"file_ids\":\"\\/uploads\\/20171230\\/fe80157c587f2e0f5a4e23a400b44a5e.jpg,\\/uploads\\/20171230\\/1f9c5d04e8052ca8846b340ee20f405c.png\",\"platform\":\"\\u5fae\\u4fe1\",\"demand_count\":\"100\",\"time_limit\":\"30\",\"end_time\":1532834880},\"ids\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514604489');
INSERT INTO `fa_admin_log` VALUES ('1534', '1', 'admin', '/admin/task/add/ids/0?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u4efb\\u52a1\\u5e26\\u56fe\\u6d4b\\u8bd5\",\"commission\":\"0.2\",\"content\":\"<p>1<\\/p><p>2<\\/p>\",\"use_link\":\"\",\"file_ids\":\"\\/uploads\\/20171230\\/fe80157c587f2e0f5a4e23a400b44a5e.jpg,\\/uploads\\/20171230\\/1f9c5d04e8052ca8846b340ee20f405c.png\",\"platform\":\"\\u5fae\\u4fe1\",\"demand_count\":\"100\",\"time_limit\":\"30\",\"end_time\":1532834880},\"ids\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514604536');
INSERT INTO `fa_admin_log` VALUES ('1535', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"222.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514604598');
INSERT INTO `fa_admin_log` VALUES ('1536', '1', 'admin', '/admin/task/edit/ids/4?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u4efb\\u52a1\\u5e26\\u56fe\\u6d4b\\u8bd5\",\"commission\":\"0.2\",\"content\":\"<p>1<\\/p><p>2<\\/p>\",\"use_link\":\"\",\"file_ids\":\"\\/uploads\\/20171230\\/fe80157c587f2e0f5a4e23a400b44a5e.jpg,\\/uploads\\/20171230\\/c2ce96a3b6a61bef6ac5ad5c8b7045cf.jpg\",\"platform\":\"\\u5fae\\u4fe1\",\"demand_count\":\"100\",\"time_limit\":\"30\",\"end_time\":1532834880},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514604601');
INSERT INTO `fa_admin_log` VALUES ('1537', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"222.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514604794');
INSERT INTO `fa_admin_log` VALUES ('1538', '1', 'admin', '/admin/task/edit/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u4efb\\u52a1\\u6d4b\\u8bd5\",\"commission\":\"3\",\"content\":\"<p>1\\uff1a\\u8bc6\\u522b\\u4e8c\\u7ef4\\u7801<\\/p><p>2\\uff1a\\u5173\\u6ce8<\\/p>\",\"use_link\":\"\",\"file_ids\":\"\\/uploads\\/20171230\\/c2ce96a3b6a61bef6ac5ad5c8b7045cf.jpg\",\"platform\":\"\\u5fae\\u4fe1\",\"demand_count\":\"50\",\"time_limit\":\"30\",\"end_time\":1527814671},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514604797');
INSERT INTO `fa_admin_log` VALUES ('1539', '1', 'admin', '/admin/task/edit/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u5c0f\\u624b\\u4e00\\u6296\\u79ef\\u5206\\u5230\\u624b\\uff01\",\"commission\":\"2\",\"content\":\"1.\\u626b\\u7801\\u5173\\u6ce8\\uff08\\u89c1\\u56fe1\\uff09\\r\\n2.\\u5173\\u6ce8\\u540e15\\u5929\\u5185\\u4e0d\\u8981\\u53d6\\u5173\\uff0c\\u8c22\\u8c22\",\"use_link\":\"\",\"file_ids\":\"\\/uploads\\/20171230\\/c2ce96a3b6a61bef6ac5ad5c8b7045cf.jpg\",\"platform\":\"\\u5fae\\u4fe1\",\"demand_count\":\"80\",\"time_limit\":\"30\",\"end_time\":1530926688},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514605001');
INSERT INTO `fa_admin_log` VALUES ('1540', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"6fadf228f67aa983c764f3222977f940\",\"username\":\"admin\"}', '192.168.102.70', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 MicroMessenger/6.6.1 NetType/WIFI Language/zh_CN', '1514612425');
INSERT INTO `fa_admin_log` VALUES ('1541', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"image.jpg\"}', '192.168.102.70', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 MicroMessenger/6.6.1 NetType/WIFI Language/zh_CN', '1514612461');
INSERT INTO `fa_admin_log` VALUES ('1542', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"IMG_5820.PNG\"}', '192.168.102.70', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 MicroMessenger/6.6.1 NetType/WIFI Language/zh_CN', '1514612484');
INSERT INTO `fa_admin_log` VALUES ('1543', '1', 'admin', '/admin/task/add/ids/0?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u624b\\u673a\\u53d1\\u5e03\\u7684\",\"commission\":\"0.2\",\"content\":\"<p>123<\\/p><p><br><\\/p>\",\"use_link\":\"\",\"file_ids\":\"\\/uploads\\/20171230\\/58f31b14138592ba24a3cd72d6dc476e.jpg,\\/uploads\\/20171230\\/3858facd4efb906fbb11a78c5cd6ecd0.png\",\"platform\":\"\\u5fae\\u4fe1\",\"demand_count\":\"100\",\"time_limit\":\"30\",\"end_time\":1514612559},\"ids\":\"0\"}', '192.168.102.70', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 MicroMessenger/6.6.1 NetType/WIFI Language/zh_CN', '1514612577');
INSERT INTO `fa_admin_log` VALUES ('1544', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"4db3453ce3424c943a4f4c6357278345\",\"username\":\"admin\"}', '192.168.102.65', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36', '1514615314');
INSERT INTO `fa_admin_log` VALUES ('1545', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"0d533230321bbb2a734faf22d7c93810\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514616000');
INSERT INTO `fa_admin_log` VALUES ('1546', '0', 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"e669ea6471670b700244fd5483bf7d38\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514588656');
INSERT INTO `fa_admin_log` VALUES ('1547', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"bf3aecde1034fadf1ead4411ddcb124c\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514588661');
INSERT INTO `fa_admin_log` VALUES ('1548', '1', 'admin', '/admin/addon/refresh', '插件管理 刷新', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514618479');
INSERT INTO `fa_admin_log` VALUES ('1549', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"1,4,66,71,5,12,11,10,9,3,2,77,8,7,6\",\"changeid\":\"1\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514618544');
INSERT INTO `fa_admin_log` VALUES ('1550', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"e0865a6651b05c67597ff0a2e34fb295\",\"username\":\"admin\"}', '192.168.102.65', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514680057');
INSERT INTO `fa_admin_log` VALUES ('1551', '1', 'admin', '/admin/user/edit/ids/4?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"blu10ph\",\"nickname\":\"blu10ph\",\"password\":\"a6338e62f7040feafce018aac22afb74\",\"email\":\"blu10ph@qq.com\",\"mobile\":\"18769714760\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"1\",\"gender\":\"0\",\"birthday\":\"1999-01-01\",\"score\":\"0\",\"prevtime\":1514355469,\"loginfailure\":\"0\",\"logintime\":1514419391,\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":1514355469,\"status\":\"normal\",\"salt\":\"I9gwWG\"},\"ids\":\"4\"}', '192.168.102.65', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514680123');
INSERT INTO `fa_admin_log` VALUES ('1552', '1', 'admin', '/admin/user/edit/ids/5?dialog=1', '会员管理 修改', '{\"dialog\":\"1\",\"row\":{\"username\":\"blu10ph1\",\"nickname\":\"blu10ph1\",\"password\":\"a96b207956c9204024b6205fbdec7e89\",\"email\":\"blu10ph@gmail.com\",\"mobile\":\"\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"1\",\"gender\":\"0\",\"birthday\":\"1999-01-01\",\"score\":\"0\",\"prevtime\":1514355568,\"loginfailure\":\"0\",\"logintime\":1514355568,\"loginip\":\"127.0.0.1\",\"joinip\":\"127.0.0.1\",\"jointime\":1514355568,\"status\":\"normal\",\"salt\":\"Ah2ySv\"},\"ids\":\"5\"}', '192.168.102.65', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514680143');
INSERT INTO `fa_admin_log` VALUES ('1553', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"a623b7414d213c7d72805f3bdda92ec2\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '1514681321');

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES ('1', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES ('2', '/uploads/20171228/f5734d519dbfcfa5496fb0834c575cb7.jpg', '200', '200', 'jpg', '0', '3859', 'image/jpeg', '', '1514445211', '1514445211', '1514445211', 'local', 'a2d3cc4f994d2bbf2be8ed99a07a19e4eb517a71');
INSERT INTO `fa_attachment` VALUES ('3', '/uploads/20171229/2730f908f626e8f46a8e3ad02010d513.jpg', '300', '300', 'jpg', '0', '4308', 'image/jpeg', '', '1514534612', '1514534612', '1514534612', 'local', 'ce0fb7a8d3e10f35ecd6fe5d73c8f373e2964584');
INSERT INTO `fa_attachment` VALUES ('6', '/uploads/20171229/0dba6b6f44803ce6a0b8138f582c9bd0.jpg', '300', '300', 'jpg', '0', '7465', 'image/jpeg', '', '1514534911', '1514534911', '1514534911', 'local', '8839ceb7c27f72052f34f3f584ef723a0a5a0bfd');
INSERT INTO `fa_attachment` VALUES ('7', '/uploads/20171229/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514535070', '1514535070', '1514535070', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('8', '/uploads/20171229/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514535228', '1514535228', '1514535228', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('9', '/uploads/20171229/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514535246', '1514535246', '1514535246', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('10', '/uploads/20171229/3858facd4efb906fbb11a78c5cd6ecd0.png', '640', '1136', 'png', '0', '154780', 'image/png', '', '1514535940', '1514535940', '1514535940', 'local', '2ec0d56305e2a815eec2082854c7537e666e7ab7');
INSERT INTO `fa_attachment` VALUES ('11', '/uploads/20171229/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514536684', '1514536684', '1514536684', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('12', '/uploads/20171229/ce86e7c8078d0753a44b521111d6ed20.jpg', '1000', '1402', 'jpg', '0', '143178', 'image/jpeg', '', '1514536684', '1514536684', '1514536684', 'local', 'e89c3426bc3ae02dda679ab4d839702cece86a9d');
INSERT INTO `fa_attachment` VALUES ('13', '/uploads/20171229/5e2ee63ef0e5443734973aa2d6189ae2.jpg', '465', '800', 'jpg', '0', '49978', 'image/jpeg', '', '1514536685', '1514536685', '1514536685', 'local', '037612fd21c10f1411f96fb71b1baf489be45856');
INSERT INTO `fa_attachment` VALUES ('14', '/uploads/20171229/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514537060', '1514537060', '1514537060', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('15', '/uploads/20171229/ce86e7c8078d0753a44b521111d6ed20.jpg', '1000', '1402', 'jpg', '0', '143178', 'image/jpeg', '', '1514537060', '1514537060', '1514537060', 'local', 'e89c3426bc3ae02dda679ab4d839702cece86a9d');
INSERT INTO `fa_attachment` VALUES ('16', '/uploads/20171229/fe80157c587f2e0f5a4e23a400b44a5e.jpg', '750', '500', 'jpg', '0', '129352', 'image/jpeg', '', '1514537116', '1514537116', '1514537116', 'local', '38731942b738f4396b4d7c9b568a732607b34cdc');
INSERT INTO `fa_attachment` VALUES ('17', '/uploads/20171229/c2ce96a3b6a61bef6ac5ad5c8b7045cf.jpg', '450', '800', 'jpg', '0', '74397', 'image/jpeg', '', '1514537160', '1514537160', '1514537160', 'local', '0f25830ec03b2bd597dac36b04427e1d6cc22404');
INSERT INTO `fa_attachment` VALUES ('18', '/uploads/20171229/24fb1f527314df715c50e621b0b895e8.jpg', '500', '315', 'jpg', '0', '37858', 'image/jpeg', '', '1514537160', '1514537160', '1514537160', 'local', '15598cf8b2c1a459b851f1d93ce3195d039febf3');
INSERT INTO `fa_attachment` VALUES ('19', '/uploads/20171229/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514539319', '1514539319', '1514539319', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('20', '/uploads/20171229/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514539329', '1514539329', '1514539329', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('21', '/uploads/20171229/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514539461', '1514539461', '1514539461', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('22', '/uploads/20171229/24fb1f527314df715c50e621b0b895e8.jpg', '500', '315', 'jpg', '0', '37858', 'image/jpeg', '', '1514539481', '1514539481', '1514539481', 'local', '15598cf8b2c1a459b851f1d93ce3195d039febf3');
INSERT INTO `fa_attachment` VALUES ('23', '/uploads/20171229/24fb1f527314df715c50e621b0b895e8.jpg', '500', '315', 'jpg', '0', '37858', 'image/jpeg', '', '1514539489', '1514539489', '1514539489', 'local', '15598cf8b2c1a459b851f1d93ce3195d039febf3');
INSERT INTO `fa_attachment` VALUES ('24', '/uploads/20171229/24fb1f527314df715c50e621b0b895e8.jpg', '500', '315', 'jpg', '0', '37858', 'image/jpeg', '', '1514539924', '1514539924', '1514539924', 'local', '15598cf8b2c1a459b851f1d93ce3195d039febf3');
INSERT INTO `fa_attachment` VALUES ('25', '/uploads/20171229/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514541580', '1514541580', '1514541580', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('26', '/uploads/20171230/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514595508', '1514595508', '1514595508', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('27', '/uploads/20171230/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514595612', '1514595612', '1514595612', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('28', '/uploads/20171230/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514600984', '1514600984', '1514600983', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('29', '/uploads/20171230/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514603063', '1514603063', '1514603063', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('30', '/uploads/20171230/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514603878', '1514603878', '1514603878', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('31', '/uploads/20171230/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514603933', '1514603933', '1514603933', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('32', '/uploads/20171230/24fb1f527314df715c50e621b0b895e8.jpg', '500', '315', 'jpg', '0', '37858', 'image/jpeg', '', '1514603951', '1514603951', '1514603951', 'local', '15598cf8b2c1a459b851f1d93ce3195d039febf3');
INSERT INTO `fa_attachment` VALUES ('33', '/uploads/20171230/fe80157c587f2e0f5a4e23a400b44a5e.jpg', '750', '500', 'jpg', '0', '129352', 'image/jpeg', '', '1514603963', '1514603963', '1514603963', 'local', '38731942b738f4396b4d7c9b568a732607b34cdc');
INSERT INTO `fa_attachment` VALUES ('34', '/uploads/20171230/a86b2d62ee2c680dcf94e5fc52b17052.jpg', '4689', '6576', 'jpg', '0', '1895054', 'image/jpeg', '', '1514603973', '1514603973', '1514603973', 'local', '3b7d55f9b08c21f47936ef4bc60ed1e970232be6');
INSERT INTO `fa_attachment` VALUES ('35', '/uploads/20171230/ce86e7c8078d0753a44b521111d6ed20.jpg', '1000', '1402', 'jpg', '0', '143178', 'image/jpeg', '', '1514603974', '1514603974', '1514603974', 'local', 'e89c3426bc3ae02dda679ab4d839702cece86a9d');
INSERT INTO `fa_attachment` VALUES ('36', '/uploads/20171230/fe80157c587f2e0f5a4e23a400b44a5e.jpg', '750', '500', 'jpg', '0', '129352', 'image/jpeg', '', '1514604466', '1514604466', '1514604466', 'local', '38731942b738f4396b4d7c9b568a732607b34cdc');
INSERT INTO `fa_attachment` VALUES ('37', '/uploads/20171230/1f9c5d04e8052ca8846b340ee20f405c.png', '640', '1136', 'png', '0', '119137', 'image/png', '', '1514604467', '1514604467', '1514604467', 'local', '389d25022c215574efe1c986e3cb329ec574e39d');
INSERT INTO `fa_attachment` VALUES ('38', '/uploads/20171230/c2ce96a3b6a61bef6ac5ad5c8b7045cf.jpg', '450', '800', 'jpg', '0', '74397', 'image/jpeg', '', '1514604598', '1514604598', '1514604598', 'local', '0f25830ec03b2bd597dac36b04427e1d6cc22404');
INSERT INTO `fa_attachment` VALUES ('39', '/uploads/20171230/c2ce96a3b6a61bef6ac5ad5c8b7045cf.jpg', '450', '800', 'jpg', '0', '74397', 'image/jpeg', '', '1514604794', '1514604794', '1514604794', 'local', '0f25830ec03b2bd597dac36b04427e1d6cc22404');
INSERT INTO `fa_attachment` VALUES ('40', '/uploads/20171230/58f31b14138592ba24a3cd72d6dc476e.jpg', '4032', '3024', 'jpg', '0', '1809150', 'image/jpeg', '', '1514612461', '1514612461', '1514612461', 'local', 'ab0454a867d63e28e530849020f830fbc8d0f2a5');
INSERT INTO `fa_attachment` VALUES ('41', '/uploads/20171230/3858facd4efb906fbb11a78c5cd6ecd0.png', '640', '1136', 'png', '0', '154780', 'image/png', '', '1514612484', '1514612484', '1514612484', 'local', '2ec0d56305e2a815eec2082854c7537e666e7ab7');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `fa_auth_group` VALUES ('2', '1', '二级管理组', '1,4,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,83,84,2,5', '1490883540', '1514518901', 'normal');
INSERT INTO `fa_auth_group` VALUES ('3', '2', '三级管理组', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,83,84,5', '1490883540', '1514518913', 'normal');
INSERT INTO `fa_auth_group` VALUES ('4', '1', '二级管理组2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65,83,84', '1490883540', '1514518934', 'normal');
INSERT INTO `fa_auth_group` VALUES ('5', '2', '三级管理组2', '1,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,83,84,2', '1490883540', '1514518923', 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES ('1', '1');
INSERT INTO `fa_auth_group_access` VALUES ('2', '2');
INSERT INTO `fa_auth_group_access` VALUES ('3', '3');
INSERT INTO `fa_auth_group_access` VALUES ('4', '5');
INSERT INTO `fa_auth_group_access` VALUES ('5', '5');

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES ('1', 'file', '0', 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', '1', '1497429920', '1497429920', '83', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('2', 'file', '0', 'general', 'General', 'fa fa-cogs', '', '', '1', '1497429920', '1497430169', '1', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('3', 'file', '0', 'category', 'Category', 'fa fa-list', '', 'Category tips', '1', '1497429920', '1497429920', '7', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('4', 'file', '0', 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', '1', '1502035509', '1502035509', '71', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('5', 'file', '0', 'auth', 'Auth', 'fa fa-group', '', '', '1', '1497429920', '1497430092', '13', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '35', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '42', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'fa fa-user', '', '', '1', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '14', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1497430307', '19', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1497429920', '23', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('12', 'file', '5', 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', '1', '1497429920', '1497430581', '28', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '8', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '9', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '11', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '10', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '12', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '43', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '44', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '45', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '46', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '47', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', '0', '1497429920', '1497429920', '36', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '37', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '38', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '39', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '40', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '41', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '49', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '53', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '54', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('35', 'file', '3', 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', '0', '1497429920', '1497429920', '2', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('36', 'file', '3', 'category/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '3', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('37', 'file', '3', 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '4', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('38', 'file', '3', 'category/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '5', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('39', 'file', '3', 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '6', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', '0', '1497429920', '1497429920', '15', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '16', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '17', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '18', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', '0', '1497429920', '1497429920', '20', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '21', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '22', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', '0', '1497429920', '1497429920', '24', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '25', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '26', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '27', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '33', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('55', 'file', '4', 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', '0', '1502035509', '1502035509', '82', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('56', 'file', '4', 'addon/add', 'Add', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '81', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('57', 'file', '4', 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '80', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('58', 'file', '4', 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '79', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('59', 'file', '4', 'addon/local', 'Local install', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '78', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('60', 'file', '4', 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '77', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('61', 'file', '4', 'addon/install', 'Install', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '76', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('62', 'file', '4', 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '75', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('63', 'file', '4', 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '74', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('64', 'file', '4', 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '73', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('65', 'file', '4', 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '72', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('66', 'file', '0', 'user', '会员管理', 'fa fa-user-o', '', '用于管理前台注册的会员', '1', '1514353237', '1514353237', '66', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('67', 'file', '66', 'user/index', '查看', 'fa fa-circle-o', '', '', '0', '1514353237', '1514353237', '70', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('68', 'file', '66', 'user/edit', '修改', 'fa fa-circle-o', '', '', '0', '1514353237', '1514353237', '69', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('69', 'file', '66', 'user/del', '删除', 'fa fa-circle-o', '', '', '0', '1514353237', '1514353237', '68', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('70', 'file', '66', 'user/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1514353237', '1514353237', '67', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('71', 'file', '0', 'page', '单页管理', 'fa fa-tags', '', '用于管理普通的单页面,通常用于关于我们、联系我们、商务合作等单一页面', '1', '1514354112', '1514354112', '34', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('72', 'file', '71', 'page/index', '查看', 'fa fa-circle-o', '', '', '0', '1514354112', '1514354112', '65', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('73', 'file', '71', 'page/add', '添加', 'fa fa-circle-o', '', '', '0', '1514354112', '1514354112', '64', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('74', 'file', '71', 'page/edit', '修改', 'fa fa-circle-o', '', '', '0', '1514354112', '1514354112', '63', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('75', 'file', '71', 'page/del', '删除', 'fa fa-circle-o', '', '', '0', '1514354112', '1514354112', '62', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('76', 'file', '71', 'page/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1514354112', '1514354112', '61', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('77', 'file', '2', 'general/crontab', '定时任务', 'fa fa-tasks', '', '类似于Linux的Crontab定时任务,可以按照设定的时间进行任务的执行,目前仅支持三种任务:请求URL、执行SQL、执行Shell', '1', '1514354136', '1514354136', '60', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('78', 'file', '77', 'general/crontab/index', '查看', 'fa fa-circle-o', '', '', '0', '1514354136', '1514354136', '59', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('79', 'file', '77', 'general/crontab/add', '添加', 'fa fa-circle-o', '', '', '0', '1514354136', '1514354136', '58', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('80', 'file', '77', 'general/crontab/edit', '编辑 ', 'fa fa-circle-o', '', '', '0', '1514354136', '1514354136', '57', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('81', 'file', '77', 'general/crontab/del', '删除', 'fa fa-circle-o', '', '', '0', '1514354136', '1514354136', '56', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('82', 'file', '77', 'general/crontab/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1514354136', '1514354136', '55', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('83', 'file', '0', 'weixin_application', '进程管理', 'fa fa-adjust', '', '用于管理所有微信进程', '1', '1514441306', '1514515902', '32', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('84', 'file', '0', 'task', '手工任务', 'fa fa-asterisk', '', '', '1', '1514518782', '1514518782', '0', 'normal');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES ('1', '0', 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', '1495262190', '1495262190', '1', 'normal');
INSERT INTO `fa_category` VALUES ('2', '0', 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', '1495262244', '1495262244', '2', 'normal');
INSERT INTO `fa_category` VALUES ('3', '2', 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', '1495262288', '1495262288', '3', 'normal');
INSERT INTO `fa_category` VALUES ('4', '2', 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', '1495262317', '1495262317', '4', 'normal');
INSERT INTO `fa_category` VALUES ('5', '0', 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', '1495262336', '1499681850', '5', 'normal');
INSERT INTO `fa_category` VALUES ('6', '5', 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', '1495262357', '1495262357', '6', 'normal');
INSERT INTO `fa_category` VALUES ('7', '5', 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', '1495262391', '1495262391', '7', 'hidden');
INSERT INTO `fa_category` VALUES ('8', '6', 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', '1495262424', '1495262424', '8', 'normal');
INSERT INTO `fa_category` VALUES ('9', '6', 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', '1495262456', '1495262456', '9', 'normal');
INSERT INTO `fa_category` VALUES ('10', '7', 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', '1495262487', '1495262487', '10', 'normal');
INSERT INTO `fa_category` VALUES ('11', '7', 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', '1495262515', '1495262515', '11', 'normal');
INSERT INTO `fa_category` VALUES ('12', '0', 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', '1497015727', '1497015727', '12', 'normal');
INSERT INTO `fa_category` VALUES ('13', '0', 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', '1497015738', '1497015738', '13', 'normal');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', '');
INSERT INTO `fa_config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `fa_config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `fa_config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `fa_config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `fa_config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `fa_config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `fa_config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `fa_config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `fa_config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `fa_config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `fa_config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `fa_config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for fa_crontab
-- ----------------------------
DROP TABLE IF EXISTS `fa_crontab`;
CREATE TABLE `fa_crontab` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '事件类型',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` text NOT NULL COMMENT '事件内容',
  `schedule` varchar(100) NOT NULL DEFAULT '' COMMENT 'Crontab格式',
  `sleep` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '延迟秒数执行',
  `maximums` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大执行次数 0为不限',
  `executes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已经执行的次数',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `begintime` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `executetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后执行时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` enum('completed','expired','hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务表';

-- ----------------------------
-- Records of fa_crontab
-- ----------------------------
INSERT INTO `fa_crontab` VALUES ('1', 'url', '请求FastAdmin', 'http://www.fastadmin.net', '* * * * *', '0', '0', '13548', '1497070825', '1501253101', '1483200000', '1546272000', '1501253101', '1', 'normal');
INSERT INTO `fa_crontab` VALUES ('2', 'sql', '查询一条SQL', 'SELECT 1;', '* * * * *', '0', '0', '13548', '1497071095', '1501253101', '1483200000', '1546272000', '1501253101', '2', 'normal');

-- ----------------------------
-- Table structure for fa_files
-- ----------------------------
DROP TABLE IF EXISTS `fa_files`;
CREATE TABLE `fa_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) DEFAULT NULL COMMENT '图片存放路径',
  `url` varchar(100) DEFAULT NULL COMMENT '网络图片地址',
  `fileext` varchar(10) DEFAULT NULL COMMENT '文件类型',
  `md5` char(32) DEFAULT NULL,
  `sha1` varchar(40) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `iszoom` tinyint(2) DEFAULT '0' COMMENT '是否有缩放图 0：未缩放；1：缩放 ',
  `take_id` varchar(50) DEFAULT NULL COMMENT '领取任务的领取id 对应fa_task_take表',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `md5` (`md5`) USING BTREE,
  KEY `sha1` (`sha1`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COMMENT='上传文件、图片存放记录表';

-- ----------------------------
-- Records of fa_files
-- ----------------------------

-- ----------------------------
-- Table structure for fa_page
-- ----------------------------
DROP TABLE IF EXISTS `fa_page`;
CREATE TABLE `fa_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(10) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `content` text NOT NULL COMMENT '内容',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='单页表';

-- ----------------------------
-- Records of fa_page
-- ----------------------------
INSERT INTO `fa_page` VALUES ('2', '4', '进程管理', '123', 'recommend', '/assets/img/qrcode.png', '213213', '', '0', '0', '1514533729', '1514533729', '0', 'normal');

-- ----------------------------
-- Table structure for fa_task
-- ----------------------------
DROP TABLE IF EXISTS `fa_task`;
CREATE TABLE `fa_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `commission` float DEFAULT NULL COMMENT '佣金',
  `platform` varchar(100) DEFAULT NULL COMMENT '所需平台',
  `code` varchar(50) DEFAULT NULL COMMENT '目前暂定与id一致 用id字段',
  `demand_count` int(11) DEFAULT NULL COMMENT '任务需求数量',
  `received_count` int(11) DEFAULT '0' COMMENT '已被领取数量',
  `time_limit` int(11) DEFAULT NULL COMMENT '完成时效（分钟）',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  `title` varchar(100) DEFAULT NULL COMMENT '任务标题',
  `content` text COMMENT '任务要求',
  `file_ids` text COMMENT '样图。路径用逗号隔开',
  `end_time` int(11) DEFAULT NULL COMMENT '任务结束时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '任务状态 1正常 -1已结束 ',
  `use_link` varchar(100) DEFAULT NULL COMMENT '可能用到的链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fa_task
-- ----------------------------
INSERT INTO `fa_task` VALUES ('1', '2', '微信', null, '80', '20', '30', null, '1514605001', '小手一抖积分到手！', '1.扫码关注（见图1）\r\n2.关注后15天内不要取关，谢谢', '/uploads/20171230/c2ce96a3b6a61bef6ac5ad5c8b7045cf.jpg', '1530926688', '1', '');
INSERT INTO `fa_task` VALUES ('2', '3', '微信', null, '50', '0', '30', '1514595488', '1514604797', '任务测试', '<p>1：识别二维码</p><p>2：关注</p>', '/uploads/20171230/c2ce96a3b6a61bef6ac5ad5c8b7045cf.jpg', '1527814671', '1', '');
INSERT INTO `fa_task` VALUES ('4', '0.2', '微信', null, '100', '0', '30', '1514604536', '1514604601', '任务带图测试', '<p>1</p><p>2</p>', '/uploads/20171230/fe80157c587f2e0f5a4e23a400b44a5e.jpg,/uploads/20171230/c2ce96a3b6a61bef6ac5ad5c8b7045cf.jpg', '1532834880', '1', '');
INSERT INTO `fa_task` VALUES ('5', '0.2', '微信', null, '100', '0', '30', '1514612577', '1514612577', '手机发布的', '<p>123</p><p><br></p>', '/uploads/20171230/58f31b14138592ba24a3cd72d6dc476e.jpg,/uploads/20171230/3858facd4efb906fbb11a78c5cd6ecd0.png', '1514612559', '1', '');

-- ----------------------------
-- Table structure for fa_task_take
-- ----------------------------
DROP TABLE IF EXISTS `fa_task_take`;
CREATE TABLE `fa_task_take` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL COMMENT '领取的任务id',
  `user_id` int(11) DEFAULT NULL COMMENT '领取任务的用户id',
  `sub_num` int(11) DEFAULT NULL COMMENT '提交次数',
  `aud_num` int(11) DEFAULT NULL COMMENT '审核次数',
  `sub_time` int(11) DEFAULT NULL COMMENT '首次提交时间',
  `take_time` int(11) DEFAULT NULL COMMENT '领取时间',
  `content` text COMMENT '结果反馈',
  `file_ids` text COMMENT '效果图路径用逗号隔开',
  `status` tinyint(4) DEFAULT NULL COMMENT '执行状态 0无状态  1已领取正在执行 2等待审核 3审核通过',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fa_task_take
-- ----------------------------

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES ('1', '0', '12', '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '0.00', '0', '2017-07-10', '2017-07-10 18:24:45', '2017', '18:24:45', '1499682285', '1499682526', '1499682526', '0', '1', 'normal', '1');

-- ----------------------------
-- Table structure for fa_third
-- ----------------------------
DROP TABLE IF EXISTS `fa_third`;
CREATE TABLE `fa_third` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `platform` enum('weibo','wechat','qq') NOT NULL COMMENT '第三方应用',
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT '第三方唯一ID',
  `openname` varchar(50) NOT NULL DEFAULT '' COMMENT '第三方会员昵称',
  `access_token` varchar(100) NOT NULL DEFAULT '',
  `refresh_token` varchar(100) NOT NULL DEFAULT '',
  `expires_in` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效期',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `expiretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `platform` (`platform`,`openid`),
  KEY `user_id` (`user_id`,`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='第三方登录表';

-- ----------------------------
-- Records of fa_third
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '1999-01-01' COMMENT '生日',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `prevtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '加入时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES ('3', 'admin123', 'admin123', '796cf2668b68e33056854579bf9bf758', 'ld26V5', 'admin@163.com', '13888888888', '/assets/img/avatar.png', '0', '0', '2017-04-15', '0', '1514360541', '0', '1514361874', '127.0.0.1', '127.0.0.1', '1491461418', '0', '1514506650', '2c0b47e7-7474-4bf6-9c5a-10b73acc3aaf', 'normal');
INSERT INTO `fa_user` VALUES ('4', 'blu10ph', 'blu10ph', 'a6338e62f7040feafce018aac22afb74', 'I9gwWG', 'blu10ph@qq.com', '18769714760', '/assets/img/avatar.png', '1', '0', '1999-01-01', '0', '1514355469', '0', '1514419391', '127.0.0.1', '127.0.0.1', '1514355469', '1514355469', '1514680123', 'c23bce3d-e936-4315-a6cd-ce761885cdd7', 'normal');
INSERT INTO `fa_user` VALUES ('5', 'blu10ph1', 'blu10ph1', 'a96b207956c9204024b6205fbdec7e89', 'Ah2ySv', 'blu10ph@gmail.com', '', '/assets/img/avatar.png', '1', '0', '1999-01-01', '0', '1514355568', '0', '1514355568', '127.0.0.1', '127.0.0.1', '1514355568', '1514355568', '1514680143', '7c388bc8-844c-4e19-a441-2931ea1a35d9', 'normal');
INSERT INTO `fa_user` VALUES ('6', 'blu10ph3', 'blu10ph3', '817848a71926ce0f06d15097803deef4', 'iqy8pX', 'blu10ph3@qq.com', '', '/assets/img/avatar.png', '1', '0', '1999-01-01', '0', '1514508812', '0', '1514508812', '127.0.0.1', '127.0.0.1', '1514508812', '1514508102', '1514508812', 'a951c1a8-0d38-4f0e-a5e5-2477dea54957', 'normal');

-- ----------------------------
-- Table structure for fa_weixin_application
-- ----------------------------
DROP TABLE IF EXISTS `fa_weixin_application`;
CREATE TABLE `fa_weixin_application` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(128) NOT NULL COMMENT 'ip',
  `socket_id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL COMMENT '进程id',
  `bind_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定用户',
  `bind_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `out_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下线时间',
  `createtime` int(10) unsigned NOT NULL,
  `updatetime` int(10) unsigned NOT NULL,
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1未用,2登陆',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fa_weixin_application
-- ----------------------------
INSERT INTO `fa_weixin_application` VALUES ('20', '65.102.168.192', '6', '5736', '4', '1514680282', '0', '1514680282', '1514680282', '2');
INSERT INTO `fa_weixin_application` VALUES ('21', '65.102.168.192', '6', '7436', '3', '1514680294', '0', '1514680294', '1514680294', '2');
INSERT INTO `fa_weixin_application` VALUES ('22', '65.102.168.192', '6', '7492', '4', '1514680315', '0', '1514680315', '1514680315', '2');
INSERT INTO `fa_weixin_application` VALUES ('23', '65.102.168.192', '6', '6020', '4', '1514680343', '0', '1514680343', '1514680343', '2');
INSERT INTO `fa_weixin_application` VALUES ('24', '65.102.168.192', '6', '8652', '4', '1514680420', '0', '1514680419', '1514680419', '1');
INSERT INTO `fa_weixin_application` VALUES ('25', '70.102.168.192', '7', '1544', '5', '1514689445', '0', '1514689445', '1514689445', '1');
INSERT INTO `fa_weixin_application` VALUES ('26', '51.102.168.192', '8', '7248', '5', '1514691906', '0', '1514691905', '1514691905', '1');
INSERT INTO `fa_weixin_application` VALUES ('27', '51.102.168.192', '6', '7236', '5', '1514698390', '0', '1514698390', '1514698390', '1');

-- ----------------------------
-- Table structure for fa_weixin_login_code
-- ----------------------------
DROP TABLE IF EXISTS `fa_weixin_login_code`;
CREATE TABLE `fa_weixin_login_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL COMMENT '微信程序序列',
  `code` varchar(255) NOT NULL COMMENT '微信二维码字符串',
  `bind_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `updatetime` int(10) unsigned NOT NULL,
  `dead_line` int(10) unsigned NOT NULL,
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '二维码状态,1未用,2占用,3使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fa_weixin_login_code
-- ----------------------------
INSERT INTO `fa_weixin_login_code` VALUES ('26', '20', 'http://weixin.qq.com/x/Q6vvKQS5h_OSSZR2rXDe', '4', '1514680282', '1514680282', '1514680342', '2');
INSERT INTO `fa_weixin_login_code` VALUES ('27', '21', 'http://weixin.qq.com/x/IerPjfxRTQthq0W85I9q', '3', '1514680294', '1514680294', '1514680354', '2');
INSERT INTO `fa_weixin_login_code` VALUES ('28', '22', 'http://weixin.qq.com/x/QYXMeD0O-YiKEi1zotle', '4', '1514680315', '1514680315', '1514680375', '2');
INSERT INTO `fa_weixin_login_code` VALUES ('29', '23', 'http://weixin.qq.com/x/gaEURvwLRWk-uSZQmtpq', '4', '1514680343', '1514680343', '1514680403', '2');
INSERT INTO `fa_weixin_login_code` VALUES ('30', '24', 'http://weixin.qq.com/x/QfHSLMn4goV4Lb1Qom7G', '4', '1514680419', '1514680419', '1514680479', '2');
INSERT INTO `fa_weixin_login_code` VALUES ('31', '25', 'http://weixin.qq.com/x/Y-Afs3y31Kx6nJEt2VPZ', '5', '1514689445', '1514689445', '1514689505', '2');
INSERT INTO `fa_weixin_login_code` VALUES ('32', '26', 'http://weixin.qq.com/x/QfLc_QRbOBY2OOw_2Qra', '5', '1514691905', '1514691905', '1514691965', '2');
INSERT INTO `fa_weixin_login_code` VALUES ('33', '27', 'http://weixin.qq.com/x/QaJhE5mKfaeB39hZjbjA', '5', '1514698390', '1514698390', '1514698450', '2');

-- ----------------------------
-- Table structure for fa_weixin_server
-- ----------------------------
DROP TABLE IF EXISTS `fa_weixin_server`;
CREATE TABLE `fa_weixin_server` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(128) NOT NULL,
  `protocol` varchar(16) NOT NULL COMMENT '协议',
  `port` varchar(8) NOT NULL COMMENT '命令端口',
  `key` varchar(128) NOT NULL COMMENT '密钥',
  `now_client` tinyint(4) NOT NULL DEFAULT '0' COMMENT '当前在线数量',
  `max_client` tinyint(4) unsigned NOT NULL COMMENT '最大客户端数量',
  `createtime` int(10) unsigned NOT NULL,
  `updatetime` int(10) unsigned NOT NULL,
  `out_time` int(10) unsigned NOT NULL,
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1正常,2离线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fa_weixin_server
-- ----------------------------
