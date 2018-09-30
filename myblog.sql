/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50711
 Source Host           : localhost:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 50711
 File Encoding         : 65001

 Date: 30/09/2018 10:44:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogs
-- ----------------------------
INSERT INTO `blogs` VALUES (1, '入门：基础语法（一）变量的定义使用', '一、简单进入一个hello world\r\npackage main\r\nimport \"fmt\"\r\nfunc main() {\r\n    fmt.Println(\"hello world!\")\r\n}\r\n1.package main是将本文件打包成main包，一个程序有且只有一个main包；\r\n\r\n2.import是该文件下所需的“依赖的包”，这里我们所需以来的包是fmt，所需“依赖”的函数是Println()。golang中都是通过包.函数来进行函数调用的；\r\n\r\n3.一个程有且只有一个main()函数\r\n\r\n二、变量的定义\r\n######（一）使用var关键字进行定义\r\n\r\nfunc variableTypeDeduction() {\r\n    var a, b = 3, 4\r\n    var c, d, e = 1, \"hello\", true\r\n    var aa int = 111\r\n\r\n    fmt.Println(a, b, c, d, e, aa)\r\n    fmt.Printf(\"a Type is %T\\n\", a)\r\n    fmt.Printf(\"b Type is %T\\n\", b)\r\n    fmt.Printf(\"c Type is %T\\n\", c)\r\n    fmt.Printf(\"d Type is %T\\n\", d)\r\n    fmt.Printf(\"e Type is %T\\n\", e)\r\n}\r\n我们可以使用var aa int = 111的类似写法，也可以使用var a,b = 3,4\r\n\r\n######（二）使用:=定义并初始化变量\r\n\r\nfunc variableShortDeduction() {\r\n    a, b := 1, \"六六六\"\r\n    fmt.Println(a)\r\n    fmt.Println(b)\r\n}\r\n总结：变量定义一般使用:=的方式定义，简单易懂！当我们在函数体外定义的变量（包内部变量，不是全局变量）的时候只能用var关键字定义\r\n\r\n三、变量的初始化\r\nfunc variableZreoValue() {\r\n    var a int\r\n    var b string\r\n    var bo bool\r\n    fmt.Printf(\"a-%d b-%q bo-%t\\n\", a, b, bo)\r\n}\r\n可以看到，int的初始化的值是0，string的初始化的值是空串（\"\"），bool的初始化的值是false\r\n\r\n四、拓展fmt.Printf()函数\r\n我们格式化的输出可以用fmt.Printf()函数进行，其函数定义为：\r\n\r\nfunc Printf(format string, a ...interface{}) (n int, err error)\r\n当然，这里有一个很重要的地方，就是我们的format string参数，我们必须使用系统提供的，以下是参数列表\r\n\r\n（一）通用：\r\n\r\n%v 值的默认格式表示\r\n\r\n%+v 类似%v，但输出结构体时会添加字段名\r\n\r\n%#v 值的Go语法表示\r\n\r\n%T 值的类型的Go语法表示\r\n\r\n%% 百分号\r\n\r\n（二）布尔值：\r\n\r\n%t 单词true或false\r\n\r\n（三）整数：\r\n\r\n%b 表示为二进制\r\n\r\n%c 该值对应的unicode码值\r\n\r\n%d 表示为十进制\r\n\r\n%o 表示为八进制\r\n\r\n%q 该值对应的单引号括起来的go语法字符字面值，必要时会采用安全的转义表示\r\n\r\n%x 表示为十六进制，使用a-f\r\n\r\n%X 表示为十六进制，使用A-F\r\n\r\n%U 表示为Unicode格式：U+1234，等价于\"U+%04X\"\r\n\r\n（四）字符串和[]byte：\r\n\r\n%s 直接输出字符串或者[]byte\r\n\r\n%q 该值对应的双引号括起来的go语法字符串字面值，必要时会采用安全的转义表示\r\n\r\n%x 每个字节用两字符十六进制数表示（使用a-f）\r\n\r\n%X 每个字节用两字符十六进制数表示（使用A-F）', '2012-12-31 18:17:18');
INSERT INTO `blogs` VALUES (2, '入门：基础语法（二）内建变量类型', 'golang内建类型包括：\r\nbool,string,int,uintptr,byte,rune,float,complex\r\n\r\ngolang作为一门通用编程语言，把complex作为内建类型是很少见的，我们这里用golang验证以下欧拉公式：\r\n\r\ne^(i*PI)+1=0\r\n\r\n复数所使用的包是cmplx，下面请看代码：\r\n\r\nfunc euler() {\r\n    fmt.Println(cmplx.Pow(math.E, 1i*math.Pi) + 1)\r\n    fmt.Println()\r\n    fmt.Println(cmplx.Exp(1i*math.Pi) + 1)\r\n}\r\n本人的计算机输出的结果是：\r\n\r\n(0+1.2246467991473515e-16i)\r\n为什么不是0？很简单，float无法表示0！如果一定要，使用fmt.printf(\"%.3f\")来进行输出的\r\n\r\ngolang中类型转换是强制的\r\nmath.Sqrt(a float)所需要的参数是一个float类型，我们这里求证以下勾股定理\r\n\r\nfunc triangle() {\r\n    var a, b int = 3, 4\r\n    var c int\r\n    c = int(math.Sqrt(float64(a*a + b*b)))\r\n    fmt.Println(c)\r\n}', '2012-12-31 18:20:43');
INSERT INTO `blogs` VALUES (3, 'werwqerq', 'qwerqwerqwer', '2018-09-30 10:16:39');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created` datetime(0) NOT NULL,
  `last_logintime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '82027871', '22ccd708c023261cbcce4b50e7ececa9', '2012-12-28 22:21:39', '2012-12-28 22:21:39');
INSERT INTO `user` VALUES (2, '', '', '0000-00-00 00:00:00', '2012-12-30 22:53:04');
INSERT INTO `user` VALUES (3, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2018-09-30 09:08:53', '2018-09-30 09:08:53');

SET FOREIGN_KEY_CHECKS = 1;
