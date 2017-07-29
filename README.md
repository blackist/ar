# 校友录(alumni record) 

[![AppVeyor](https://img.shields.io/appveyor/ci/gruntjs/grunt.svg)](https://github.com/blackist/ar)
[![](https://img.shields.io/badge/spring-3.2.0-blue.svg)]()
[![](https://img.shields.io/badge/jdk-1.7-blue.svg)]()
[![](https://img.shields.io/badge/mybatis-3.3.0-blue.svg)]()
[![](https://img.shields.io/badge/mysql-5.1.20-blue.svg)]()

---

## 项目简介

校友录网站。作为毕业设计，为母校设计校友交流平台。基于javaWeb，由Maven构建管理，采用Spring+SpringMVC+MyBatis框架，用EhCache做数据缓存。门户网站采用BootStrap设计界面，后台管理网站用AmazeUI设计界面。门户网站总体布局如下所示：

![](http://i.imgur.com/5ZsQbe4.jpg)

## 项目背景

面向学校潜在的需求，为校友设计交流平台（班记录、校友组织、校友论坛等），同时也让院校了解毕业生的就业状况并未毕业生提供就业服务（职业招聘、校园服务等）。

# 开发环境

## 本机

- Maven 3.0.3
- IntelliJ IDEA 2017.1/eclipse EE
- jdk1.7
- tomcat 7
- mysql 5.1

# 系统安装运行流程说明

## 安装数据库

1. 导入数据字典表；<br>
2. 在用户表(user)中加入id为1的超级管理员；<br>
3. 在组织表(origin)中加入id为1的徐州工程学院；<br>
4. 在图片表(image)中加入id为1的徐州工程学院logo；<br>

## 数据字典

dictionary(字典表)：

dictionary_data(字典数据表)：