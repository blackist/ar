# 校友录(alumni record) 

[![AppVeyor](https://img.shields.io/appveyor/ci/gruntjs/grunt.svg)](https://github.com/blackist/ar)
[![](https://img.shields.io/badge/spring-4.2.0-blue.svg)]()
[![](https://img.shields.io/badge/jdk-1.8-blue.svg)]()
[![](https://img.shields.io/badge/mybatis-3.3.0-blue.svg)]()
[![](https://img.shields.io/badge/mysql-5.1.20-blue.svg)]()

---

## 项目简介

[Wiki](https://github.com/blackist/ar/wiki)

校友录网站。作为毕业设计，为母校设计校友交流平台。基于javaWeb，由Maven构建管理，采用Spring+SpringMVC+MyBatis框架，用EhCache做数据缓存。门户网站采用BootStrap设计界面，后台管理网站用AmazeUI设计界面。门户网站总体布局如下所示：

![](http://pic.blackist.top/javaweb-ar-ar-portal-logo.png)

后台管理总体布局如下所示：

![](http://pic.blackist.top/javaweb-ar-ar-manage-logo.png)


在线体验：

【门户网站】
访问地址: http://tomcat.blackist.top/ar-portal/index.action
用户名/密码: black/12345678

【后台管理】
访问地址: http://tomcat.blackist.top/ar-portal/manage.action
用户名/密码: sa/12345678

## 项目背景

面向学校潜在的需求，为校友设计交流平台（班记录、校友组织、校友论坛等），同时也让院校了解毕业生的就业状况并未毕业生提供就业服务（职业招聘、校园服务等）。

## 开发环境

### 本机

- Maven 3.0.3
- IntelliJ IDEA 2017.1/eclipse EE
- jdk1.8
- tomcat8.0
- mysql 5.1




## Getting Start

### 导入数据库

数据库为MySQL5.1，数据库sql文件在./ar-doc/sql/ar-mysql-data.sql，新建数据库ar，执行此sql文件，可导入表结构和数据字典等数据。

1. 导入数据字典表；
2. 在用户表(user)中加入id为1的超级管理员；
3. 在组织表(origin)中加入id为1的徐州工程学院；
4. 在图片表(image)中加入id为1的徐州工程学院logo；

#### 数据字典

dictionary(字典表)：

dictionary_data(字典数据表)：

### 导入工程（推荐IDEA）

1.安装Maven...

2.在IDEA中配置Maven，jdk

3.导入Maven项目，等待maven依赖项下载...

4.在IDEA中配置Tomcat8.0

5.修改项目中的数据库配置 ./ar-parent/ar-portal/src/main/resources/config.properties


``` xml
jdbc.driver=com.mysql.jdbc.Driver
# 数据库地址
jdbc.url=jdbc:mysql://localhost/ar?characterEncoding=utf8
# 数据库用户名密码
jdbc.username=root
jdbc.password=root

```


### 项目构建

执行ar-common模块下的maven clean 以及 maven install

![](http://pic.blackist.top/javaweb-ar-ar-common-maven-cycle.png)

ar-common生成jar 安装在本地，ar-manage和ar-portal依赖此库。

### 项目部署

建议运行 ar-portal:war exploded。

![](http://pic.blackist.top/202002151534_482.png)

原因如下：

- war exploded 模式将 WEB 工程以文件夹的形式发布到 Tomcat，支持热部署。
- ar-portal 是门户网站模块，包含后台管理模块。maven 模块结构如下图所示。
  ![](http://pic.blackist.top/202002151541_295.png)

运行ar-portal模块，启动成功日志：

![](http://pic.blackist.top/javaweb-ar-ar-portal-startup-success.png)


门户网站：
访问地址: http://localhost:8080/ar-portal/index.action
用户名/密码: black/12345678

后台管理：
访问地址: http://localhost:8080/ar-portal/manage.action
用户名/密码: sa/12345678

如果此开源项目对您有帮助，欢迎给个Start，嘿嘿^-^~

### 项目打包

可以使用命令行打包war，打包的war在ar-portal/target下：
```cmd
mvn clean && mvn install && mvn package

```

### 使用IDEA运行

1.配置 Tomcat

tomcat 需要 8.0 的版本，否则会不兼容，👉[Tomcat 8.0.9](https://download.csdn.net/download/dong161114/20822688).

首先配置 Tomcat 服务器路径
![](http://pic.blackist.top/20210807123253.jpg)

其次配置项目部署在 Tomcat 上
![](http://pic.blackist.top/20210807123512.jpg)
![](http://pic.blackist.top/20210807123601.jpg)

Application Context 就是项目在容器里的目录，浏览器地址的一部分.

2.启动运行即可

![](http://pic.blackist.top/20210807123734.jpg)



## 项目开发交流

### 关注公众号

![校友录](http://pic.blackist.top/blackist-wechat-pub.jpg)

关注公众号，回复：
- 校友录，获取项目架构、线上部署、网站风格配置等开发文档
- 论文，获取参考论文

### 加入QQ群交流

**432196940**

<!-- ![校友录](http://pic.blackist.top/javaweb-ar-TIM%E5%9B%BE%E7%89%8720181130212423.jpg){:width="50px"} -->

### 开源支持

此项目作为我的毕业设计，期间我经历嵌入式开发、考研等事情，历时两年多还有部分功能未完成，有兴趣的码友欢迎[共同开发](https://github.com/blackist/ar/pulls)，也期待此项目可以成为某某学校的校友网站^-^。



## License

    Copyright (C) 2013 董亮亮
    
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
